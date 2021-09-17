//
//  calculatorViewModel.swift
//  BasicUIComponents
//
//  Created by Enes N KENDİRCİ on 17.09.2021.
//

import Foundation

struct CalculatorViewModel {
    

    
    func equal(_ operation: String,_ first: Double,_ second: Double) -> String {
        
        switch operation {
        case "+":
            return String(Int(first + second))
        case "-":
            return String(Int(first - second))
        case "÷":
            return String(first / second)
        case "x":
            return String(Int(first * second))
        default:
            return "nasil oldu bu???"
        }
    }

    func square(_ number: Double) -> String {
        return String(sqrt(number))
    }
    
    
}
