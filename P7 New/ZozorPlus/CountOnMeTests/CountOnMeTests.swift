//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Mac Hack on 08/08/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculTests: XCTestCase {
    
    var calculate: Calculate!
    
    override func setUp() {
        super.setUp()
        
        calculate = Calculate()
    }
    
    func testCalculateTotal_WhenOperatorContainsPlus_ThenVariablesShouldBeUpdated() {

        let _ = calculate.addNewNumber(1)
        let _ = calculate.plus()
        let _ = calculate.addNewNumber(2)

        XCTAssertEqual(calculate.calculTotal(), "3.00")
    }

    func testCalculateTotal_WhenOperatorContainsMinus_ThenVariablesShouldBeUpdated() {

        let _ = calculate.addNewNumber(1)
        let _ = calculate.minus()
        let _ = calculate.addNewNumber(1)

        XCTAssertEqual(calculate.calculTotal(), "0.00")
    }
    
    func testCalculateTotal_WhenOperatorContainsMultiply_ThenVariablesShouldBeUpdated() {
        
        let _ = calculate.addNewNumber(2)
        let _ = calculate.multiply()
        let _ = calculate.addNewNumber(3)
        
        XCTAssertEqual(calculate.calculTotal(), "6.00")
    }
    
    func testCalculateTotal_WhenOperatorContainsDivide_ThenVariablesShouldBeUpdated() {
        
        let _ = calculate.addNewNumber(8)
        let _ = calculate.divide()
        let _ = calculate.addNewNumber(2)
        
        XCTAssertEqual(calculate.calculTotal(), "4.00")
    }
    
    func testCalculateTotal_WhenOperatorContainsPlusAndMultiplication_ThenPriorityMultiplication() {
        
        let _ = calculate.addNewNumber(2)
        let _ = calculate.plus()
        let _ = calculate.addNewNumber(3)
        let _ = calculate.multiply()
        let _ = calculate.addNewNumber(10)
        
        XCTAssertEqual(calculate.calculTotal(), "32.00")
    }
    
    func testAddDecimals_WhenResultOfCalculationWillBeDecimals_ThenResultWillShowDecimals() {
        
        let _ = calculate.addNewNumber(10)
        let _ = calculate.divide()
        let _ = calculate.addNewNumber(3)
        
        XCTAssertEqual(calculate.calculTotal(), "3.33")
    }
    
    func testGivenElementToCalculateIs1Plus_WhenCalculating_ThenShowAlertExpressionIsIncorrect() {
        
        let _ = calculate.addNewNumber(1)
        let _ = calculate.plus()

        XCTAssertFalse(calculate.isExpressionCorrect)
    }
    
    func testGivenElementToCalculateReturn_WhenCalculating_ThenReturnTheResult() {
        
        let _ = calculate.addNewNumber(2)
        let _ = calculate.plus()
        let _ = calculate.addNewNumber(3)
        let _ = calculate.minus()
        let _ = calculate.addNewNumber(5)
        
        XCTAssertEqual(calculate.calculTotal(), "0.00")
    }
    
    func testGivenElementToErase_WhenErasing_ThenTextShowsNil() {
        
        XCTAssertEqual(calculate.erase(), "")
    }
    
    func testGivenElementToCalculateIsNil_WhenCalculating_ThenShowAlertExpressionIsIncorrect() {
        
        let _ = calculate.stringNumbers.isEmpty
    
        XCTAssertFalse(calculate.isExpressionCorrect)
    }
    
    func testGivenElementToCalculateDoubleOperators_WhenCalculating_ThenShowAlertExpressionIsIncorrect() {
        
        let _ = calculate.addNewNumber(1)
        let _ = calculate.plus()
        let _ = calculate.plus()
        
        XCTAssertFalse(calculate.canAddOperator)
    }
}
