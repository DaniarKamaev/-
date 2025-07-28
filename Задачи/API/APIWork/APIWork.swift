//
//  APIWork.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import UIKit

class APIWork {
    private func get(complition: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/todos") else { return }
        let reqest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: reqest) { data, _, error in
            if let error = error  {
                complition(.failure(error))
            }
            
            if let data = data {
                complition(.success(data))
            }
        }
        task.resume()
    }
    func get(index: Int?, complitions: @escaping (Int?, String?, Bool?, Int?, Int?)-> Void) {
        get { result in
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
            }
        }
    }
}
