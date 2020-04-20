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
    }
    
    //MARK: Custom methods
    func registerXibs() {
        QuestionTableViewCell.register(tableView: tableView)
        AnswerTableViewCell.register(tableView: tableView)
    }

}

// MARK: - Tableview datasource
extension PersonalityTestViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        //return viewModel.outputs.numberOfRows()
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
        viewModel.inputs.rowSelected(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
