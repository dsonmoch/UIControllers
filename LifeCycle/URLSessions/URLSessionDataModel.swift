//
//  URLSessionCodableStruct.swift
//  LifeCycle
//
//  Created by Admin on 20/10/22.
//

import Foundation

struct Response: Codable{
let page: Int?
let total: Int?
let data: [UserData]
}

struct UserData: Codable{
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
    enum CodingKeys: String,CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}

struct CreateUserResponse: Codable{
    let name: String
    let job: String
    let id: String
    let createdAt: String
}

struct Endpoint{
    static let createUser = "https://reqres.in/api/users"
    static let getUsers = "https://reqres.in/api/users?page=2"
    static let deleteUser = "https://reqres.in/api/users/2"
}

