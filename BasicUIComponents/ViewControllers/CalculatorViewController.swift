//
//  CalculatorViewController.swift
//  BasicUIComponents
//
//  Created by Semih Emre ÜNLÜ on 11.09.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    //@IBOutlet var digitButtons: [UIButton]!
    @IBOutlet weak var sqrtButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet var actionButtons: [UIButton]!
    
    let calculatorVM = CalculatorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    private var isTyping: Bool = false
    
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let displayText = resultLabel.text ?? ""

        if digit == "0" && displayText == "0" {
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
    
    var operations: [String] = []
    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        
        let operation = calculatorVM.findOperation(buttonText: sender.currentTitle ?? "")
        
        switch operation {
        case "=":
            resultLabel.text = calculatorVM.equal(operations: operations)
        case "√":
            resultLabel.text = calculatorVM.square(operations: operations)
        case nil:
            break
        default:
            operations.append(sender.currentTitle!)
            resultLabel.text! += sender.currentTitle!
        }
    }
    
    func changeDefaultColor() {
        for button in actionButtons{
            button.backgroundColor = .darkGray
        }
    }
    
    
}
