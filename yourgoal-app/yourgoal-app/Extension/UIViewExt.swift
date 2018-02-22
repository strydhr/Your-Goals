//
//  UIViewExt.swift
//  yourgoal-app
//
//  Created by Satyia Anand on 22/02/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import UIKit

extension UIView{
    func bindToKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        
    }
    @objc func keyboardWillChange(_ notification: NSNotification){
        let duration  = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions.init(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
