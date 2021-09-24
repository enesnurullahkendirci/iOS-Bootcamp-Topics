//
//  heroDetailViewController.swift
//  BasicUIComponents
//
//  Created by Enes N KENDİRCİ on 21.09.2021.
//

import UIKit
import Hero

class HeroDetailViewController: UIViewController {
    
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var fibNumber: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var fibArray: [Int] = [] //will hold calculated fibonacci numbers
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hero methods
        self.hero.isEnabled = true // turned on Hero
        
        //added heroID's
        fibNumber.heroID = "fibNumber" 
        blueView.heroID = "resultView"
        calculateButton.heroID = "calculate"
        
    }
    
    @IBAction func calculateClicked(_ sender: UIButton) { //Calculate button method
        let number = fibNumber.text ?? "0" //if label has a wrong value returns 0
        calculateFib(fibNumber: Int(number) ?? 0) //calculate fibonacci numbers
        self.performSegue(withIdentifier: "secondHero", sender: self)
    }
    
    func calculateFib(fibNumber n: Int) {
        
        switch n {
        case 0: //input was 0 or wrong value
            fibArray = []
        case 1: //input was 1
            fibArray = [1]
        case 92...: //if the input was greater than 91
            fibNumber.text = "overflow"
        default: //if the inpus was 2...92
            fibArray = [1, 1]
            (2...n).forEach { i in
                fibArray.append(fibArray[i - 1] + fibArray[i - 2])
            }
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "secondHero",
           let destinationVC = segue.destination as? HeroDetailSecondViewController {
            destinationVC.number = fibNumber.text ?? "0" //send input to secondVC
            destinationVC.fibArray = fibArray //send calculated fibonacci numbers to secondVC
        }
        
    }
    
    
}
