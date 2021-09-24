//
//  CollectionViewCell.swift
//  Pods
//
//  Created by Enes N KENDİRCİ on 23.09.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    func addLabelToCell(_ text: String){
        
        
        for subview in self.subviews {
            print("sub", subview)
            if (subview.isKind(of: UILabel.self) && subview.tag == 50){
                print("if")
                let label = subview as! UILabel
                label.text = text
                return
            }
        }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 21))
        
        label.center = self.contentView.center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        
        label.text = text
        
        label.tag = 50
        self.addSubview(label)
    }
}
