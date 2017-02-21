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

    }
    
    func fullName() -> String {
        return ""
    }
    
    func canBuyBeerIn(country: String) -> Bool {
        return true
    }
    
    func addSibling(sibling: Person) {
    }
    
    func getNumberOfSiblings() -> Int {
        return 0
    }
    
    func getFirstNameOfSiblings() -> [String] {
        return []
    }
    
    func getFirstNameOfSisters() -> [String] {
        return []
    }
}
