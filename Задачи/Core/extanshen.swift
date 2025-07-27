//
//  extanshen.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import  UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: self.cell)
        viewModel.getId(index: indexPath.row) { (id, todu, isComplited, userId) in
            DispatchQueue.main.async {
                cell.textLabel?.text = todu
            }
        }
        return cell
    }
    
    
}
