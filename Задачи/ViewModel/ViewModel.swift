//
//  ViewModel.swift
//
//
//  Created by dany on 27.07.2025.
//

import UIKit

class ViewModel: ViewModelProtocol {
    
    let api = APIWork()
    var todus : Int?
    //var taskCount: Int { todus.count }
    let count = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
                 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
                 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    
    func createdMainLable(_ label: UILabel, _ view: UIView) {
        label.frame = CGRect(x: 30, y: 80, width: 150, height: 41)
        label.textColor = .white
        label.text = "Задачи"
        label.font = .systemFont(ofSize: 41, weight: .bold)
        view.addSubview(label)
    }
    
    func createdTableView(_ table: UITableView, view: UIView) {
        table.frame = CGRect(x: 0, y: 0, width: 400, height: 565)
        table.center = view.center
        table.center.y = view.center.y + 60
        table.rowHeight = 106
        table.register(CactomCell.self, forCellReuseIdentifier: "Cell")
        table.backgroundColor = .black
        table.separatorColor = .systemGray4
        view.addSubview(table)
    }
    func creatadDounView(_ View: UIView, _ view: UIView, _ label: UILabel) {
        View.backgroundColor = .systemGray5
        View.translatesAutoresizingMaskIntoConstraints = false

        label.frame = CGRect(x: 0, y: 0, width: 100, height: 16)
        label.center = View.center
        label.text = "count \(count.randomElement())"
        
        View.addSubview(label)
        view.addSubview(View)
        api.get(index: nil) { (_, _, _, _, count) in
            self.todus = count
        }
    }
}
