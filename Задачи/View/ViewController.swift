//
//  ViewController.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import UIKit

class ViewController: UIViewController {
    let footerView = TasksFooterView()
    let viewModel = ViewModel()
    let myTableView = UITableView()
    let myLable = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        viewModel.createdMainLable(myLable, view)
        viewModel.createdTableView(myTableView, view: view)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.tableFooterView = footerView
        loadData()
    }
    private func loadData() {
        viewModel.api.get(index: nil) { (_, _, _, _, count) in
            DispatchQueue.main.async {
                self.myTableView.reloadData()
                self.footerView.configure(with: count ?? 0)
            }
        }
    }
}

