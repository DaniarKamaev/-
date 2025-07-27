//
//  APIWork.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import UIKit

class APIWork {
    func get(complition: @escaping (Result<Data, Error>) -> Void) {
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
}
