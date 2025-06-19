//
//  ViewController.swift
//  Заметки
//
//  Created by dany on 11.06.2025.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UITextFieldDelegate,UISearchBarDelegate, NoteSaveDelegate {
   
    

    
    
    let myLable = UILabel()
    var myTable = UITableView()
    var newBarButten = UIBarButtonItem()
    var screchBar = UISearchBar()
    var filtradNoute = [String]()
    var isSearch = false
    let identifier = "myCell"
    var dataBase = Name()
        
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createdLable(myLable)
        createdTableView(&myTable)
        createdNavagationItemNew(&newBarButten)
        setupSearchBar(screchBar)
        
    }
    private func setupSearchBar(_ screchBar: UISearchBar) {
        screchBar.placeholder = "Why screch?"
        screchBar.delegate = self
        navigationItem.titleView = screchBar
    }
    
    private func creatrdSkrechTextFild(_ textFild : UITextField) {
        textFild.frame = CGRect(x: 0, y: 90, width: 450, height: 50)
        textFild.center.x = view.center.x
        textFild.placeholder = "Найти:"
        textFild.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.3)
        textFild.textColor = .black
        textFild.textAlignment = .center
        textFild.font = UIFont.boldSystemFont(ofSize: 25)
        textFild.layer.cornerRadius = 18
        textFild.delegate = self
        view.addSubview(textFild)
    }
    private func createdLable(_ lable: UILabel) {
        lable.frame = CGRect(x: 60, y: 150, width: 300, height: 100)
        lable.font = UIFont.boldSystemFont(ofSize: 35)
        lable.text = "Заметки"
        lable.tintColor = .black
        view.addSubview(lable)
    }
    private func createdTableView(_ table: inout UITableView) {
        table = UITableView(frame: view.bounds, style: .plain)
        table.bounds.size = CGSize(width: 450, height: 300)
        table.register(UITableViewCell.self, forCellReuseIdentifier: self.identifier)
        table.delegate = self
        table.dataSource = self
        table.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(table)
    }
    private func createdNavagationItemNew (_ button: inout UIBarButtonItem) {
        button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pushVC))
        navigationItem.rightBarButtonItem = button
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearch ? filtradNoute.count : dataBase.dict.count
    }
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath)
        if isSearch {
            cell.textLabel?.text = filtradNoute[indexPath.row]
        } else {
        let sortedNams = Array(dataBase.dict.keys).sorted()
        cell.textLabel?.text = sortedNams[indexPath.row]
        }
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcEdit = TextFildViewController()
        let sortedNams = Array(dataBase.dict.keys).sorted()
        let sortedText = Array(dataBase.dict.values).sorted()
        vcEdit.delegate = self
        vcEdit.myTextFild.text = sortedNams[indexPath.row]
        vcEdit.myTextView.text = sortedText[indexPath.row]
        navigationController?.pushViewController(vcEdit, animated: true)
    }
    
    func seveNewNout(titel: String, text: String) {
        dataBase.newNout(noutName: titel, text: text)
        myTable.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            isSearch = false
            self.filtradNoute.removeAll()
        } else {
            isSearch = true
            filtradNoute = Array(dataBase.dict.keys).filter {
                $0.lowercased().contains(searchText.lowercased())
            }.sorted()
        }
        myTable.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        screchBar.text = ""
        self.filtradNoute.removeAll()
        searchBar.resignFirstResponder()
        myTable.reloadData()
        isSearch = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
        @objc func pushVC() {
        let secVC = TextFildViewController()
        secVC.delegate = self
        navigationController?.pushViewController(secVC, animated: true)
        
    }
}



