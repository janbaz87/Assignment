//
//  PersonalityTestViewController.swift
//  SparkNetworks
//
//  Created by Janbaz Ali on 18/04/2020.
//  Copyright © 2020 Janbaz Ali. All rights reserved.
//

import UIKit

class PersonalityTestViewController: UIViewController,StoryboardInitializable {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nextButton: UIButton!
    static func storyboardName() -> String {
        return "Main"
    }
    
    //MARK: Properties
    var viewModel : PersonalityTestViewModelType!
    private var selectedIndex = -1

    //MARK: View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerXibs()
        render()
        fetchTest()
    }
    
    //MARK: Private methods
    private func registerXibs() {
        QuestionTableViewCell.register(tableView: tableView)
        AnswerTableViewCell.register(tableView: tableView)
        TextAnswerTableViewCell.register(tableView: tableView)
    }
    
    private func render() {
        nextButton.roundCorners(with: 8)
    }
    
    private func reload(with animation : UITableView.RowAnimation) {
        
        self.title = viewModel.outputs.title()
        
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
    
        self.tableView.reloadSections(sections as IndexSet, with: animation)
    }
    
    private func handelStatus (status : TestStatus ) {
    
        switch status {
        case .start:
            reload(with: .none)
            break
        case .end:
            nextButton.isEnabled = false
            viewModel.inputs.testCompleted()
            break
        case .next:
            reload(with: .left)
        }
    }
    
    private func setNextButton( isEnabled : Bool) {
        
        nextButton.isEnabled = isEnabled
        nextButton.backgroundColor = isEnabled == true ? .blue_grey : .grey_grey
    }
    
    //MARK: IBActions
    
    @IBAction func nextTapped(_ sender: Any) {
        setNextButton(isEnabled: false)
        self.selectedIndex = -1
        viewModel.inputs.nextQuestion { [unowned self] status in
            self.handelStatus(status: status)
        }
    }
}

//MARK: Fetching data
extension PersonalityTestViewController {
    private func fetchTest() {
        addAndShowActivity()
        viewModel.inputs.fetchTest { [weak self] (error) in
            guard let self = self else {return}
            if error == nil {
                DispatchQueue.main.async {
                    self.reload(with: .none)
                    self.removeActivity()
                }
            }else {
                self.setNextButton(isEnabled: false)
                guard let error = error else {
                    return
                }
                self.showError(error: error)
            }
        }
    }
}

// MARK: - Tableview datasource
extension PersonalityTestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let viewmodel = viewModel.outputs.viewModel(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: viewmodel.reusableIdentifier) as! ConfigurableTableViewCell
        let isSelected = indexPath.row == selectedIndex ?  true : false
        cell.setIndexPath(indexPath)
        cell.isSelected(isSelected)
        cell.configure(with: viewmodel)
        return cell as! UITableViewCell
    }
}

// MARK: - Tableview delegates
extension PersonalityTestViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        viewModel.inputs.rowSelected(at: indexPath) {[unowned self] in
            self.setNextButton(isEnabled: true)
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
