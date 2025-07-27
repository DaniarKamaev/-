//
//  ViewController.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ViewModel()
    let cell = "Cell"
    let myTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createdTableView(myTableView)
    }
    private func createdTableView(_ table: UITableView) {
        table.frame = view.frame
        table.register(UITableViewCell.self, forCellReuseIdentifier: cell)
        table.delegate = self
        table.dataSource = self
        
        view.addSubview(table)
    }

}

