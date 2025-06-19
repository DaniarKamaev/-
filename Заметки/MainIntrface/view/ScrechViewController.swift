//
//  ScrechViewController.swift
//  Заметки
//
//  Created by dany on 18.06.2025.
//

import UIKit

class ScrechViewController: UIViewController {
    
    var myButton = UIButton()
    var valueNout = String()
    var textView = TextFildViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Поиск"
        view.addSubview(myButton)
        createdButton(myButton)
    }
    private func createdButton(_ button: UIButton) {
        button.frame = CGRect(x: 0, y: 200, width: 300, height: 50)
        button.center.x = view.center.x
        button.layer.cornerRadius = 25
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(tapButton(param:)), for: .touchUpInside)
        view.addSubview(button)
    }
    @objc func tapButton(param: UIButton) {
        if self.valueNout != "Not text" {
            self.textView.myTextView.text = self.valueNout
        } else {
            myButton.isEnabled = false
        }
        if self.myButton.titleLabel?.text != "Not Foundet" {
            self.textView.myTextView.text = self.valueNout
        } else {
            myButton.isEnabled = false
        }
        //navigationController?.popViewController(animated: false)
        navigationController?.pushViewController(self.textView, animated: true)
    }
    

}
