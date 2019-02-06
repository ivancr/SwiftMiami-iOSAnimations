//
//  MainTableViewController.swift
//  iOSAnimations
//
//  Created by Ivan Corchado Ruiz on 2/2/19.
//  Copyright © 2019 ivancr. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private let demoTypes = ["UIView.animate",
                             "CA Animations",
                             "Particle Animations",
                             "Chained Animations"]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "iOS Animations"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return demoTypes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let title = "\(indexPath.row + 1). \(demoTypes[indexPath.row])"
        cell.textLabel?.text = title
        cell.accessoryType = .disclosureIndicator

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var demoVC = UIViewController()
        
        switch indexPath.row {
        case 0:
            demoVC = DemoOneViewController()
            demoVC.navigationItem.title = demoTypes[indexPath.row]
        
        case 1:
            demoVC = DemoTwoViewController()
            demoVC.navigationItem.title = demoTypes[indexPath.row]
            
        case 2:
            demoVC = DemoThreeViewController()
            demoVC.navigationItem.title = demoTypes[indexPath.row]
            
        case 3:
            demoVC = DemoFourViewController()
            demoVC.navigationItem.title = demoTypes[indexPath.row]
            
        default:
            assertionFailure("Cell not configured yet")
        }
        
        navigationController?.pushViewController(demoVC, animated: true)
    }
}
