//
//  UIViewExt.swift
//  IMWHO
//
//  Created by madhav sharma on 10/9/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

extension UIView {
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    @objc func keyboardWillChange(_ notification: NSNotification) {
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        //captures the frame of the keyboard below the screen before it goes up
        //force cast as raw value to covert it into a cgRectValue
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        //captures how far the frame of the keyboard after it goes up
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        //how much it moves up on the y-axis
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: KeyframeAnimationOptions(rawValue: curve), animations:
            {
                //adding keyboard delta-y to the object-y
                self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
