//
//  PersonTests.swift
//  Course-01-Swift-Tests
//
//  Created by Fredrik Lillejordet on 15.01.2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//

import XCTest

class PersonTests: XCTestCase {
    
    var kylie: Person!
    
    override func setUp() {
        super.setUp()
        kylie = Person(firstName: "Kylie", lastName: "Jenner", gender: "Female", age: 19)
        kylie.addSibling(sibling: Person(firstName: "Kendall", lastName: "Kardashian", gender: "Female", age: 21))
        kylie.addSibling(sibling: Person(firstName: "Rob", lastName: "Kardashian", gender: "Male", age: 29))
        kylie.addSibling(sibling: Person(firstName: "Khloé", lastName: "Kardashian", gender: "Female", age: 32))
        kylie.addSibling(sibling: Person(firstName: "Kim", lastName: "Kardashian", gender: "Female", age: 36))
        kylie.addSibling(sibling: Person(firstName: "Kourtney", lastName: "Kardashian", gender: "Female", age: 37))
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFirstName() {
        XCTAssert(kylie.firstName == "Kylie", "Returned \(kylie.firstName) , should be Kylie")
    }
    
    func testLastName() {
        XCTAssert(kylie.lastName == "Jenner", "Returned \(kylie.lastName) , should be Jenner")
    }
    
    func testFullName() {
        XCTAssert(kylie.fullName() == "Kylie Jenner", "Returned \(kylie.fullName()) , should be Kylie Jenner")
    }
    
    func testCanBuyBeerInNorway() {
        XCTAssert(kylie.canBuyBeerIn(country: "Norway"), "Returned \(kylie.canBuyBeerIn(country: "Norway")) , should be true")
    }
    
    func testCanBuyBeerInUSA() {
        XCTAssert(kylie.canBuyBeerIn(country: "USA") == false, "Returned \(kylie.canBuyBeerIn(country: "USA")), should be false")
    }
    
    func testCanAppendSiblingsAndGetCount() {
        XCTAssert(kylie.getNumberOfSiblings() == 5, "Returned \(kylie.getNumberOfSiblings()) , should be 5")
    }
    
    func testSiblingNames() {
        let expected = ["Kendall", "Rob", "Khloé", "Kim", "Kourtney"]
        XCTAssert(kylie.getFirstNameOfSiblings() == expected, "Returned \(kylie.getFirstNameOfSiblings()) , should be \(expected)")
    }
    
    func testSisterNames() {
        let expected = ["Kendall", "Khloé", "Kim", "Kourtney"]
        XCTAssert(kylie.getFirstNameOfSisters() == expected, "Returned \(kylie.getFirstNameOfSisters()) , should be \(expected)")
    }
    
}
