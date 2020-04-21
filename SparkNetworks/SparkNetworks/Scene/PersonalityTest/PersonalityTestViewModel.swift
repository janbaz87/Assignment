//
//  PersonalityTestViewModel.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 19/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import Foundation

protocol PersonalityTestViewModelInput {
    func start()
    func rowSelected(at indexPath: IndexPath, compeletion : @escaping (TestStatus)->())
    func nextQuestion(completion: @escaping (TestStatus)->() )
    func previousQuestion(completion: @escaping (TestStatus)->() )
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
    var test = PersonalityTest.mocked
    var viewModels = [ReusableTableViewCellViewModelType]()
    var currentIndex = 0
    
    //MARK: Init
    init() {
        
    }
   
    func generateViewModels(question: Question) {
        
        switch question.questionType.type {
            
        case .numberRange:
            viewModels.append(QuestionTableViewCellViewModel(question: question.question))
            guard let range = question.questionType.condition?.subQuestion.questionType.range else {return}
            let models = addRanges(range: range)
            viewModels.append(contentsOf: models)
        default:
            viewModels.removeAll()
            viewModels.append(QuestionTableViewCellViewModel(question: question.question))
            guard let models = addOptions(options: question.questionType.options) else { return }
             viewModels.append(contentsOf: models)
        }
    }
    
    func addOptions(options: [String]) -> ([AnswerTableViewCellViewModel<Any>]?) {
        return  options.map{ AnswerTableViewCellViewModel(answer: $0) }
    }
    
    /// create  array of answers for the givent subquestion
    func addRanges(range : Range) -> ([AnswerTableViewCellViewModel<Any>]) {
    
        let ranges = getArrayFor(range: range)
        
        return  ranges.map{ AnswerTableViewCellViewModel(answer: $0) }
    }
    
    /// create an array of ranges of provide from & to
    func getArrayFor(range: Range) -> [Int] {
        var models = [Int]()
        
        for i in range.from..<range.to {
            models.append(i)
        }
        return models
    }
}

//MARk: PersonalityTestViewModelOutputs
extension PersonalityTestViewModel:PersonalityTestViewModelOutput {
    
    func viewModel(for indexPath: IndexPath) -> ReusableTableViewCellViewModelType {
        return viewModels[indexPath.row]
    }
    
}

//MARk: PersonalityTestViewModelInputs
extension PersonalityTestViewModel:PersonalityTestViewModelInput {
    
    func start() {
           generateViewModels(question: test.questions[currentIndex])
    }
    
    func title() -> String {
        return test.questions[currentIndex].category
    }
    
    func numberOfRows() -> Int {
        return viewModels.count
    }
    
    func nextQuestion(completion: @escaping (TestStatus) -> ()) {
        if currentIndex >= test.questions.count - 1 { completion(.end); return }
        currentIndex += 1
        generateViewModels(question: test.questions[currentIndex])
        completion(.next)
    }
    
    func previousQuestion(completion: @escaping (TestStatus) -> ()) {
        if currentIndex < 1  {
            completion(.start)
            return
        }
        currentIndex -= 1
        generateViewModels(question: test.questions[currentIndex])
        let status =  currentIndex == 0 ? TestStatus.start : TestStatus.previous
        completion(status)
    }
    
    func rowSelected(at indexPath: IndexPath, compeletion : @escaping (TestStatus)->())  {
        
        compeletion(.next)
    }
    
}
