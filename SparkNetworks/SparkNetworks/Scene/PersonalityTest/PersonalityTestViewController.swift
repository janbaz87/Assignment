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
    static func storyboardName() -> String {
        return "Main"
    }
    
    //MARK: Properties
    var viewModel : PersonalityTestViewModelType!

    //MARK: View cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Personality Test"
        registerXibs()
        viewModel.inputs.start()
    }
    
    //MARK: Custom methods
    func registerXibs() {
        QuestionTableViewCell.register(tableView: tableView)
        AnswerTableViewCell.register(tableView: tableView)
    }
    @IBAction func nextTapped(_ sender: Any) {
        viewModel.inputs.nextQuestion { [unowned self] status in
            self.handelStatus(status: status)
        }
    }
    
    @IBAction func previousTapped(_ sender: Any) {
        viewModel.inputs.previousQuestion { [unowned self] status in
            self.handelStatus(status: status)
        }
    }
    
    func handelStatus (status : TestStatus ) {
        self.title = viewModel.outputs.title()
        let range = NSMakeRange(0, self.tableView.numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        
        switch status {
        case .start:
            break
        case .end:
            break
        case .previous:
             self.tableView.reloadSections(sections as IndexSet, with: .right)
        case .next:
             self.tableView.reloadSections(sections as IndexSet, with: .left)
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
        cell.configure(with: viewmodel)
        return cell as! UITableViewCell
    }
}

// MARK: - Tableview delegates
extension PersonalityTestViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.inputs.rowSelected(at: indexPath) {_ in
            
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
