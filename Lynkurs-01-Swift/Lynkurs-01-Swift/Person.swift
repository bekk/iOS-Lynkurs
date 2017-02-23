//
//  Person.swift
//  Course-01-Swift
//
//  Created by Fredrik Lillejordet on 15.01.2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//
import Foundation

class Person {

    let firstName, lastName, gender: String
    var siblings: [Person] = []
    var age: Int

    init(firstName: String, lastName: String, gender: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.age = age
    }

    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }

    func canBuyBeerIn(country: String) -> Bool {
        switch country {
        case "USA":
            return age >= 21
        case "Norway":
            return age >= 18
        default:
            return false
        }
    }

    func addSibling(sibling: Person) {
        siblings.append(sibling)
    }

    func getNumberOfSiblings() -> Int {
        return siblings.count
    }

    func getFirstNameOfSiblings() -> [String] {
        return siblings.map {$0.firstName}
    }

    func getFirstNameOfSisters() -> [String] {
        return siblings.filter {$0.gender == "Female"}.map {$0.firstName}
    }
}
