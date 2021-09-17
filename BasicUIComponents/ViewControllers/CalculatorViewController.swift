//
//  CalculatorViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var actionButtons: [UIButton]!
    
    let calculatorVM = CalculatorViewModel()
    
    var firstNumber: Double = 0.0
    var secondNumber: Double = 0.0
    
    private var isTyping: Bool = false
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let displayText = resultLabel.text ?? ""

        if digit == "0" && displayText == "0" { // block "00"
            return
        }
        
        if isTyping {
            resultLabel.text = displayText + digit
        } else {
            resultLabel.text = digit
            isTyping.toggle()
            if resultLabel.text == "0" {
                isTyping = false
            }
        }
    }
    
    var operation = "+"
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case "=":
            secondNumber = Double(resultLabel.text!)!
            resultLabel.text = calculatorVM.equal(operation, firstNumber, secondNumber)
            isTyping.toggle() // reset after tap =
        case "√":
            secondNumber = Double(resultLabel.text!)!
            resultLabel.text = calculatorVM.square(secondNumber)
            isTyping.toggle() //reset after tap √
        default:
            isTyping.toggle() //reset after tap + - / x
            
            print(resultLabel.text!)
            firstNumber = Double(resultLabel.text!)!
            operation = sender.currentTitle!
            resultLabel.text = "0"
        }
    }
    
}

