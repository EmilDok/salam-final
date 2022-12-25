//
//  Person.swift
//  salam
//
//  Created by Илья Родионов on 23.12.2022.
//

import Foundation
import UIKit

struct Person {
    var userId: Int
    var firstName: String
    var secondName: String
    var email: String
    var login: String
    var password: String
    var avatarImage: UIImage
}

extension Person {
    static func == (personOne : Person, personSecond: Person) -> Bool{
        return personOne.login == personSecond.login
    }
    
    static func != (personOne : Person, personSecond: Person) -> Bool{
        return personOne.login != personSecond.login
    }
}

