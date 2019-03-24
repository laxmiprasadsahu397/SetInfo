//
//  TaskListVC.swift
//  SetInfo
//
//  Created by LaxmiPrasad Sahu on 22/03/19.
//  Copyright © 2019 C1X. All rights reserved.
//

import UIKit

class TaskListVC: UIViewController {

    @IBOutlet weak var tableView_TaskList: UITableView!
    var taskList:[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        taskList = [TaskList.task1,TaskList.task2,TaskList.task3]
        self.tableView_TaskList.tableFooterView = UIView()
    }
}

extension TaskListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = self.taskList?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch self.taskList?[indexPath.row] {
        case TaskList.task1:
            let collectionVc = storyboard?.instantiateViewController(withIdentifier: "CollectionVC") as! CollectionVC
            self.navigationController?.pushViewController(collectionVc, animated: true)
        case TaskList.task2:
            let plotVc = storyboard?.instantiateViewController(withIdentifier: "PlotRectVC") as! PlotRectVC
            self.navigationController?.pushViewController(plotVc, animated: true)
        case TaskList.task3:
            let colorCrownVc = storyboard?.instantiateViewController(withIdentifier: "ColorClownVC") as! ColorClownVC
            self.navigationController?.pushViewController(colorCrownVc, animated: true)
        default:
            break
        }
    }
    
    
}
