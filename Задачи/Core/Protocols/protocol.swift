//
//  protocol.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import UIKit


protocol ViewModelProtocol {
    
    func createdMainLable(_ label: UILabel, _ view: UIView)
    func createdTableView(_ table: UITableView, view: UIView)
    //func get(index: Int?, complitions: @escaping (Int?, String?, Bool?, Int?, Int?)-> Void)
    
}
