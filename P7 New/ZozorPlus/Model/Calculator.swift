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
    
    // Var:
    
    var stringNumbers: [String] = [String()]
    var operators: [String] = ["+"]
    var index = 0
    var textView: UITextView!
    var displayAlertsDelegate: DisplayAlertsDelegate?
    
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
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                displayAlertsDelegate?.showAlert(title: "Zéro", message: "Expression incorrecte !")
                return false
            }
        }
        return true
    }

    
    // Methods:
    
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
        index = 0
    }
    
    func erase() -> String {
        if canAddOperator {
        clear()
    }
    return "0"
}
    
    func addNewNumber(_ newNumber: Int) -> String {
        if let stringNumber = stringNumbers.last {
            var stringNumberMutable = stringNumber
            stringNumberMutable += "\(newNumber)"
            stringNumbers[stringNumbers.count-1] = stringNumberMutable
        }
        return updateDisplay()
    }
            
    func calculTotal() -> String {
        if !isExpressionCorrect {
            return ""
        }
        
        var total = 0
        for (index, stringNumber) in stringNumbers.enumerated() {
            if let number = Int(stringNumber) {
                
                switch operators[index] {
                    
                case "+": total += number
                
                case "-": total -= number
                
                case "x": total *= number
                
                case "÷": total /= number

            default:
                    break
                }
            }
        }
        clear()
        return String(total)
    }
    
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
