//
//  HeroDetailSecondViewController.swift
//  
//
//  Created by Enes N KENDİRCİ on 23.09.2021.
//

import UIKit
import Hero

class HeroDetailSecondViewController: UIViewController {
    
    
    @IBOutlet weak var secondGreyView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fibNumber: UITextField!
    @IBOutlet weak var calculate: UIButton!
    
    var number: String = ""
    var fibArray: [Int] = []
    var redCells: [UICollectionViewCell] = []
    var randomColors: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hero.isEnabled = true
        
        fibNumber.heroID = "fibNumber"
        fibNumber.text = number
        calculate.heroID = "calculate"
        secondGreyView.heroID = "greyOne"
        
        randomColorAppendToArray(Int(number) ?? 0)
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.hero.modifiers = [.cascade]
        
        secondGreyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(popVC)))
    }
    
    func randomColorAppendToArray(_ number: Int) -> Void {
        
        switch number{
        case 0 :
            break
        default:
            for _ in 1...number {
                let color = UIColor.random
                randomColors.append(color)
            }
        }
    }
    
    @objc func popVC() {
        hero.dismissViewController(completion: nil)
    }
}

extension HeroDetailSecondViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = randomColors[indexPath.row]
        cell.hero.modifiers = [.fade, .scale(0.5)]
        cell.clear()
        cell.addLabelToCell(String(fibArray[indexPath.row]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.height / 2.5, height: 120)
    }
    
    
}
