//
//  extanshen.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import  UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count.randomElement()!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CactomCell else { return UITableViewCell() }
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.configure(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcEdit = TextFuildViewController()
        navigationController?.pushViewController(vcEdit, animated: true)
    }
    
    //MARK: - Later
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        if y <= 1.0 {
            //hide()
        } else {
            //show()
        }
    }
    private func show() {
        myTableView.center.y = view.center.y + 100
        myTableView.contentSize.height = view.frame.height + 100
        myTableView.center.y = view.center.y - 380
        myTableView.isHidden = true
    }
    
    private func hide() {
        myTableView.center.y = view.center.y + 200
        myTableView.contentSize.height = view.frame.height - 100
        myTableView.center.y = view.center.y - 305
        myTableView.isHidden = false
    }
    
}
