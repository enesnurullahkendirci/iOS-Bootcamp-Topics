//
//  calculatorViewModel.swift
//  BasicUIComponents
//
//  Created by Enes N KENDİRCİ on 17.09.2021.
//

import Foundation

struct CalculatorViewModel {
    
    func findOperation(buttonText text: String) -> String {
        
        return text
    }
    
    func plus(_ firstNumber: Int,_ secondNumber: Int) -> Int {
        
        
        return firstNumber + secondNumber
    }
    
    func sub(intArray array: [Int]) -> String {
        
        var result = array[0]
        for index in 1...array.count - 1{
            result -= array[index]
        }
        
        return String(result)
    }
    
    
    func equal(operations numberArray: [String]) -> String {
        
        var result = 0
    
        while numberArray.count != 0 {
            var firstItem = numberArray[0]
            var operation = numberArray[1]
            var secondItem = numberArray[3]
        }
        
        
        return "0"
    }
    
    func square(operations numberArray: [String]) -> String {
        return String(Double(numberArray.last ?? "0")!.squareRoot())
    }
    
    
}
