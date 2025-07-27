//
//  ViewModel.swift
//
//
//  Created by dany on 27.07.2025.
//

import UIKit

class ViewModel: ViewModelProtocol {
    
    let api = APIWork()
    
    func createdMainLable(_ label: UILabel, _ view: UIView) {
        label.frame = CGRect(x: 30, y: 80, width: 150, height: 41)
        label.textColor = .white
        label.text = "Задачи"
        label.font = .systemFont(ofSize: 41, weight: .bold)
        view.addSubview(label)
        
    }
    
    func createdTableView(_ table: UITableView, view: UIView) {
        
        table.frame = CGRect(x: 0, y: 0, width: 400, height: 800)
        table.center = view.center
        table.center.y = view.center.y + 170
        table.rowHeight = 106
        table.register(CactomCell.self, forCellReuseIdentifier: "Cell")
        table.backgroundColor = .black
        table.separatorColor = .systemGray4
        view.addSubview(table)
    }
    
    //MARK: - Network
    func get(index: Int?, complitions: @escaping (Int?, String?, Bool?, Int?, Int?)-> Void) {
        api.get { result in
            switch result {
            case.failure(_):
                print("error")
            case.success(let data):
                let json = try? JSONDecoder().decode(APIData.self, from: data)
                let id = json?.todos[index ?? 0].id
                let todu = json?.todos[index ?? 0].todo
                let complited = json?.todos[index ?? 0].completed
                let userId = json?.todos[index ?? 0].userID
                let count = json?.todos.count
                complitions(id, todu, complited, userId, count)
                //print(json?.todos.randomElement()?.id)
            }
        }
    }
}
