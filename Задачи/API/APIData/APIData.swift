//
//  APIData.swift
//  Задачи
//
//  Created by dany on 27.07.2025.
//

import Foundation

// MARK: - APIData
struct APIData: Codable {
    let todos: [Todo]
    let total, skip, limit: Int
}

// MARK: - Todo
struct Todo: Codable {
    let id: Int
    let todo: String
    let completed: Bool
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, todo, completed
        case userID = "userId"
    }
}
