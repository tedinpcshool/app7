//
//  TEDCustomSearchBar.swift
//  app7
//
//  Created by ios on 2018/1/29.
//  Copyright © 2018年 pcschool. All rights reserved.
//

import UIKit

class TEDCustomSearchBar: UISearchBar {
    var preferredFont: UIFont!
    
    var preferredTextColor: UIColor!
    
    init(frame: CGRect,font:UIFont,textColor:UIColor) {
        super.init(frame: frame)
        
        self.frame = frame
        preferredFont = font
        preferredTextColor = textColor
        
        searchBarStyle = UISearchBarStyle.prominent
        isTranslucent = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Find the index of the search field in the search bar subviews.
        
        
        if let index = indexOfSearchFieldInSubviews() {
            // Access the search field
            let searchField: UITextField = subviews[0].subviews[index] as! UITextField
            
            // Set its frame.
            searchField.frame = CGRect(x: 5.0, y: 5.0, width: frame.size.width-10.0, height: frame.size.height - 10.0)
//                CGRectMake(5.0, 5.0, frame.size.width - 10.0, frame.size.height - 10.0)
            
            // Set the font and text color of the search field.
            searchField.font = preferredFont
            searchField.textColor = preferredTextColor
            
            // Set the background color of the search field.
            searchField.backgroundColor = barTintColor
        }
        let startPoint = CGPoint(x: 0.0, y: frame.size.height)
//            CGPointMake(0.0, frame.size.height)
        let endPoint = CGPoint(x: frame.size.width, y: frame.size.height)
//            CGPointMake(frame.size.width, frame.size.height)
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = preferredTextColor.cgColor
        shapeLayer.lineWidth = 2.5
        
        layer.addSublayer(shapeLayer)
        
        super.draw(rect)
    }
    
    func indexOfSearchFieldInSubviews() -> Int! {
        var index: Int!
        let searchBarView = subviews[0]
        
        
        for i in 0...searchBarView.subviews.count{
            if searchBarView.subviews[i] is UITextField{
                index = i
                break
            }
        }
        
//        for var i=0; i<searchBarView.subviews.count; i {
//            if searchBarView.subviews[i].isKindOfClass(UITextField) {
//                index = i
//                break
//            }
//        }
        
        return index
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
