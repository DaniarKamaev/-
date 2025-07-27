//
//  ViewModel.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import UIKit

class ViewModel {
    let api = APIWork()
    
    func getId(index: Int, complitions: @escaping (Int?, String?, Bool?, Int?)-> Void) {
        api.get { result in
            switch result {
            case.failure(_):
                print("error")
            case.success(let data):
                let json = try? JSONDecoder().decode(APIData.self, from: data)
                let id = json?.todos[index].id
                let todu = json?.todos[index].todo
                let complited = json?.todos[index].completed
                let userId = json?.todos[index].userID
                complitions(id, todu, complited, userId)
                print(json?.todos.randomElement()?.id)
            }
        }
    }
}
