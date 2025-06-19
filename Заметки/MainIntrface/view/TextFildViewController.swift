//
//  TextFildViewController.swift
//  Заметки
//
//  Created by dany on 12.06.2025.
//

import UIKit

class TextFildViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    let myTextFild = UITextField()
    let myTextView = UITextView()
    var saveButton = UIBarButtonItem()
    var delegate: NoteSaveDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatrdTextFild(myTextFild)
        createdTextView(myTextView)
        createdNavigationBar(&saveButton)
        tap()
        
    }
    private func creatrdTextFild(_ textFild : UITextField) {
        textFild.frame = CGRect(x: 0, y: 200, width: 300, height: 100)
        textFild.center.x = view.center.x
        textFild.placeholder = "Название"
        textFild.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.3)
        textFild.textColor = .black
        textFild.textAlignment = .center
        textFild.font = UIFont.boldSystemFont(ofSize: 25)
        textFild.layer.cornerRadius = 40
        textFild.delegate = self
        view.addSubview(textFild)
    }

    private func createdTextView(_ textView: UITextView) {
        textView.frame = CGRect(x: 0, y: 350, width: 400, height: 350)
        textView.center.x = view.center.x
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.layer.cornerRadius = 20
        textView.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 0.3)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.delegate = self
        view.addSubview(textView)
    }
    
    //MARK: - NavigatinBar
    private func createdNavigationBar(_ saveButton: inout UIBarButtonItem) {
        saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNout(button:)))
        navigationItem.rightBarButtonItem = saveButton
       
    }
    //MARK: - Gestche
    private func tap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(endEdit))
        view.addGestureRecognizer(tap)
    }
    
    //MARK: - Deleget
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.frame = CGRect(x: 0, y: 100, width: 200, height: 100)
        textField.sizeToFit()
        textField.layer.cornerRadius = 10
        textField.center.x = view.center.x
        myTextView.frame = CGRect(x: 0, y: 300, width: 400, height: 400)
        myTextView.center.x = view.center.x
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: - Selectors
    @objc func saveNout(button: UIBarButtonItem) {
        //guard let _ = myTextFild.text  else { return }
        delegate?.seveNewNout(titel: myTextFild.text!, text: myTextView.text)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func endEdit() {
        view.endEditing(true)
    }
    
}
