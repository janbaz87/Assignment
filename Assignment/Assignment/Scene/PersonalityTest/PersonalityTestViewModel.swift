//
//  PersonalityTestViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

protocol PersonalityTestViewModelInput {
    func rowSelected(at indexPath: IndexPath, compeletion : @escaping ()->())
    func nextQuestion(completion: @escaping (TestStatus)->() )
    func fetchTest(completion: @escaping (AppError?)->())
    func testCompleted()
}

protocol PersonalityTestViewModelOutput {
    func title()->String
    func numberOfRows()->Int
    func viewModel(for indexPath: IndexPath) -> ReusableTableViewCellViewModelType
}

protocol PersonalityTestViewModelType {
    var inputs: PersonalityTestViewModelInput { get }
    var outputs: PersonalityTestViewModelOutput { get }
}

class PersonalityTestViewModel : PersonalityTestViewModelType  {
    
    var inputs: PersonalityTestViewModelInput { return self }
    var outputs: PersonalityTestViewModelOutput { return self }
    
    //MARK: Properties
    private var repository = PersonalityTestRepository()
    private var personalityTest : PersonalityTest!
    var viewModelsArray = [[ReusableTableViewCellViewModelType]]()
    private var currentIndex = 0
    private var parentIndex = 0
    private var answersDictionary = Dictionary<String, String>()
    private var coordinator : PersonalityTestCoordinator
    
    //MARK: Init
    init(coordinator: PersonalityTestCoordinator) {
        self.coordinator = coordinator
    }
   
    func generateViewModels(question: Question)-> [ReusableTableViewCellViewModelType]? {
        
        var viewModels = [ReusableTableViewCellViewModelType]()
        
        viewModels.append(QuestionTableViewCellViewModel(question: question.question))
     
        switch question.questionType.type {
            
        case .text:
            addTextAnswer(viewModels: &viewModels)
            
        case .numberRange:
            let range = question.questionType.range
            addRanges(viewModels: &viewModels, range: range)
           
        default:
            guard let options = question.questionType.options else {return nil}
            addOptions(viewModels: &viewModels, options: options)
        }

        return viewModels
    }
    /// this method will add viewmodel for text type answers
    func addTextAnswer( viewModels : inout [ReusableTableViewCellViewModelType]) {
        let viewmodel = TextAnswerTableViewCellViewModel.init()
        viewModels.append(viewmodel)
    }
    
    func addOptions( viewModels : inout [ReusableTableViewCellViewModelType], options: [String]) {
        _ = options.map{ viewModels.append(AnswerTableViewCellViewModel.init(answer: $0)) }
    }
    /// create  array of answers for the givent subquestion
    func addRanges( viewModels : inout [ReusableTableViewCellViewModelType], range : Range?) {
        guard let unwrapedRange = range else {return}
        let ranges = getArrayFor(range: unwrapedRange)
        _ = ranges.map{ viewModels.append(AnswerTableViewCellViewModel.init(answer: $0)) }
    }
    
    /// create an array of ranges of provide from & to
    func getArrayFor(range: Range) -> [Int] {
        var models = [Int]()
        
        for i in range.from..<range.to {
            models.append(i)
        }
        return models
    }
    
    /// Handling of api response
    
    func handleApiRespose(test : PersonalityTest) -> [[ReusableTableViewCellViewModelType]] {
        self.personalityTest = test
        
        createQuestionArray(questions: test.questions)
        return viewModelsArray
    }
    
    func createQuestionArray(questions : [Question]){
        _ =  questions.map{ viewModelsArray.append(generateViewModels(question: $0)!) }
    }
    
    func addConditionalSubQuestion(condition : Condition) {
        let models = self.viewModelsArray[currentIndex]
        guard let questionViewModelType = models[0] as? QuestionTableViewCellViewModelType else {return}
        if condition.predicate.exactEquals[1] == answersDictionary[questionViewModelType.outputs.text()] {
            guard let model = generateViewModels(question: condition.subQuestion) else {return}
            viewModelsArray.insert(model, at: currentIndex + 1)
        }else {
            parentIndex += 1
        }
    }
    
    func checkForConditionalQuestionType(question : Question) {
        switch question.questionType.type {
        case .conditional:
            guard let condition = question.questionType.condition else {return}
            addConditionalSubQuestion(condition: condition)
        default:
            parentIndex += 1
            break
        }
    }
}

//MARk: PersonalityTestViewModelOutputs
extension PersonalityTestViewModel:PersonalityTestViewModelOutput {
    func title() -> String {
        if personalityTest == nil {
            return "Personality test loading..."
        }
        if currentIndex == self.personalityTest.questions.count {
            return self.personalityTest.questions[currentIndex - 1].category
        }
        return viewModelsArray.count > currentIndex  ? self.personalityTest.questions[currentIndex].category : "Test Ended"
    }
    
    func numberOfRows() -> Int {
        return viewModelsArray.count > 0 ? viewModelsArray[currentIndex].count : 0
    }
    
    func viewModel(for indexPath: IndexPath) -> ReusableTableViewCellViewModelType {
        return viewModelsArray[currentIndex][indexPath.row]
    }
    
}

//MARk: PersonalityTestViewModelInputs
extension PersonalityTestViewModel:PersonalityTestViewModelInput {
    func fetchTest(completion: @escaping (AppError?)->()) {
        repository.getPersonalityTest {[weak self] (test, serverError) in
            guard let self = self else {return}

            var error : AppError? = nil
            defer {
                completion(error)
            }

            if error == nil {
                guard let testFromServer = test else {return}
                _ = self.handleApiRespose(test: testFromServer)
            }else {
                error = serverError
            }
        }
        
        /// For mocking
//        completion(nil)
//        _ = handleApiRespose(test: repository.mockData())
    }
    
    func nextQuestion(completion: @escaping (TestStatus) -> ()) {
        
        var status: TestStatus!
        defer {
            currentIndex += 1
            completion (status)
        }
        
        checkForConditionalQuestionType(question: personalityTest.questions[parentIndex])
        if currentIndex >= viewModelsArray.count - 1{
            status = .end
            return
        }
        status = .next
    }

    func rowSelected(at indexPath: IndexPath, compeletion : @escaping ()->())  {
        defer {
             compeletion()
        }
        if currentIndex > self.viewModelsArray.count - 1 {
            return
        }
        let models = self.viewModelsArray[currentIndex]
        guard let questionViewModelType = models[0] as? QuestionTableViewCellViewModelType else {return}
        guard let answerViewModelType = models[indexPath.row] as? AnswerTableViewCellViewModelType else {return}
        self.answersDictionary[questionViewModelType.outputs.text()] = answerViewModelType.outputs.text()
        answerViewModelType.inputs.setSelectedIndex(index: indexPath.row)
       
    }
    
    func testCompleted() {
    
        self.coordinator.compeltionScene()
           
    }
    
}
