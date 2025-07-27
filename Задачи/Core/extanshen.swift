//
//  extanshen.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import  UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count.randomElement()!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CactomCell else { return UITableViewCell() }
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.configure(indexPath.row)
        return cell
    }
    
    
}
