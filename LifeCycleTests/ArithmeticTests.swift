//
//  Arithmetic.swift
//  LifeCycleTests
//
//  Created by Admin on 21/10/22.
//

import XCTest
@testable import LifeCycle

final class ArithmeticTests: XCTestCase {
    
    var arithmeticObject = Arithmetic()

    func testAdditionOperationWhichReturnsIntNumber(){
        let firstNumber = 3
        let secondNumber = 3
        let result = arithmeticObject.additionOperation(firstNumber: firstNumber, secondNumber: secondNumber)
        
        XCTAssertEqual(result, 6)
        XCTAssertNotNil(result)
    }
    
    func testSubtractionOperationWhichReturnsIntNumber(){
        let firstNumber = 3
        let secondNumber = 3
        let result = arithmeticObject.subtractionOperation(firstNumber: firstNumber, secondNumber: secondNumber)
        
        XCTAssertEqual(result, 0)
        XCTAssertNotNil(result)
    }
    
    func testMultiplicationOperationWhichReturnsIntNumber(){
        let firstNumber = 3
        let secondNumber = 3
        let result = arithmeticObject.multiplicationOperation(firstNumber: firstNumber, secondNumber: secondNumber)
        
        XCTAssertEqual(result, 9)
        XCTAssertNotNil(result)
    }
    
    func testDivisionOperationWhichReturnsIntNumber(){
        let firstNumber = 3
        let secondNumber = 3
        let result = arithmeticObject.divisionOperation(firstNumber: firstNumber, secondNumber: secondNumber)
        
        XCTAssertEqual(result, 1)
        XCTAssertNotNil(result)
    }

}
