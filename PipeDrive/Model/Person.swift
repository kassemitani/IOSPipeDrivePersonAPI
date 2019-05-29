//
//  Article.swift
//
//  Copyright © 2019 kassem Itani. All rights reserved.
//

struct Persons: Decodable {
    var data: [Person]
}

struct Person: Decodable {
    var name: String?
    var firstName: String?
    var lastName: String?
    var updated_time: String?
    var email: [Email]
    var phone: [Phone]
    var pictureId: Picture_id
}

struct Picture_id: Decodable {
    var pictures:[String: String]
}

struct Phone: Decodable {
    var label: String?
    var value: String?
    var primary: Bool
}
struct Email: Decodable {
    var label: String?
    var value: String?
    var primary: Bool
}
