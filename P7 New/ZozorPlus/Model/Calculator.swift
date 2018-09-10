//
//  Calculator.swift
//  CountOnMe
//
//  Created by Mac Hack on 10/08/2018.
//  Copyright © 2018 Ambroise Collon. All rights reserved.
//

import UIKit

protocol DisplayAlertsDelegate {
    func showAlert (title: String, message: String)
}

class Calculate {
    
    /**
     Variables:
    */
    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0
    var displayAlertsDelegate: DisplayAlertsDelegate?
    
    /**
    Variable to detect if the user is entering an expression correct
    */
    
    var isExpressionCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    displayAlertsDelegate?.showAlert(title: "Zéro", message: "Démarrez un nouveau calcul !")
                } else {
                    displayAlertsDelegate?.showAlert(title: "Zéro", message: "Entrez une expression correcte !")
                }
                return false
            }
        }
        return true
    }
    
    /**
    Variable to enter a new operator in the calculator
    */
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                displayAlertsDelegate?.showAlert(title: "Zéro", message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }
    
    /**
     Methods to add strings for operators and erase the content
    */
    
    func plus() -> String {
        if canAddOperator {
            operators.append("+")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func minus() -> String {
        if canAddOperator {
            operators.append("-")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func multiply() -> String {
        if canAddOperator {
            operators.append("x")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func divide() -> String {
        if canAddOperator {
            operators.append("÷")
            stringNumbers.append("")
        }
        return updateDisplay()
    }
    
    func clear() {
        stringNumbers = [String()]
        operators = ["+"]
        index = 0
    }
    
    func erase() -> String {
        clear()
        return ""
    }

    /**
     Method for priority calculation when user is multiplying or dividing // Alert message added for the division by zero
     */
    
    func priorityCalculation() {

        let priorityOperators = ["x", "÷"]
        var result: Double = 0
        var index = 0
        
        while index < stringNumbers.count-1 {
            
            if var firstNumber = Double(stringNumbers[index]) {
                while priorityOperators.contains(operators[index+1]) {
                    if let secondNumber = Double(stringNumbers[index+1]) {
                        if operators[index+1] == "x" {
                            result = firstNumber * secondNumber
                        } else if operators[index+1] == "÷" && secondNumber != 0 {
                            result = firstNumber / secondNumber
                        } else {
                            displayAlertsDelegate?.showAlert(title: "Zéro", message: "Impossible de diviser par zéro")
                            clear()
                            return
                        }
                        stringNumbers[index] = String(result)
                        firstNumber = result
                        stringNumbers.remove(at: index+1)
                        operators.remove(at: index+1)
                        if index == stringNumbers.count-1 {
                            return
                        }
                    }
                }
                index += 1
            }
        }
    }

    /**
    Method to add new number on the calculator
    */
                
    func addNewNumber(_ newNumber: Int) -> String {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        return updateDisplay()
    }
    
    /**
     Method to calculate the total. Only for additions and subtractions
    */
    
    func calculTotal() -> String {
        
        if !isExpressionCorrect {
            return ""
        }
        
        priorityCalculation()
        var total : Double = 0
        for (index, stringNumber) in stringNumbers.enumerated() {
            if let number = Double(stringNumber) {
                
                if operators[index] == "+" {
                    total += number
                    
                } else if operators[index] == "-" {
                total -= number

                }
            }
        }
        clear()
        return String(format: "%.2f", total)
    }
    
    /**
     Method to update the display of the calculator
    */
    
    func updateDisplay() -> String {
        var text = ""
        
        for (index, stringNumber) in stringNumbers.enumerated() {
            
            if index > 0 {
                text += operators[index]
            }
            text += stringNumber
        }
        return text
    }
}
