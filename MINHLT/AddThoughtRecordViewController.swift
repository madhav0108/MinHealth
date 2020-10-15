//
//  AddThoughtRecordViewController.swift
//  IMWHO
//
//  Created by madhav sharma on 10/9/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit
import CoreData

class AddThoughtRecordViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var thghtTitleTxt: UITextField!
    @IBOutlet weak var situationTxt: UITextView!
    @IBOutlet weak var thoughtTxt: UITextView!
    @IBOutlet weak var emotionsTxt: UITextView!
    @IBOutlet weak var behaviorTxt: UITextView!
    @IBOutlet weak var alterThghtTxt: UITextView!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        situationTxt.isScrollEnabled = false
        situationTxt.keyboardDismissMode = .onDrag
        situationTxt.text = "I was at..."
        situationTxt.textColor = UIColor.lightGray
        situationTxt.delegate = self
        
        thoughtTxt.isScrollEnabled = false
        thoughtTxt.keyboardDismissMode = .onDrag
        thoughtTxt.text = "I'm thinking..."
        thoughtTxt.textColor = UIColor.lightGray
        thoughtTxt.delegate = self
        
        emotionsTxt.isScrollEnabled = false
        emotionsTxt.keyboardDismissMode = .onDrag
        emotionsTxt.text = "I feel..."
        emotionsTxt.textColor = UIColor.lightGray
        emotionsTxt.delegate = self
        
        behaviorTxt.isScrollEnabled = false
        behaviorTxt.keyboardDismissMode = .onDrag
        behaviorTxt.text = "I am..."
        behaviorTxt.textColor = UIColor.lightGray
        behaviorTxt.delegate = self
        
        alterThghtTxt.isScrollEnabled = false
        alterThghtTxt.keyboardDismissMode = .onDrag
        alterThghtTxt.text = "An alternate thought is..."
        alterThghtTxt.textColor = UIColor.lightGray
        alterThghtTxt.delegate = self
        
        submitBtn.layer.cornerRadius = 10.0
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func submitBtnPressed(_ sender: Any) {
        if thghtTitleTxt.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let thought = Thought(context: managedContext)
        
        let date = Date()
        let calendar = Calendar.current
        //let hour = calendar.component(.hour, from: date)
        //let minute = calendar.component(.minute, from: date)
        //let second = calendar.component(.second, from: date)

        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        thought.thoughtTitle = thghtTitleTxt.text
        thought.timestamp = "\(day)/\(month)/\(year)"
        thought.situation = situationTxt.text
        thought.thought = thoughtTxt.text
        thought.emotions = emotionsTxt.text
        thought.behavior = behaviorTxt.text
        thought.alterThght = alterThghtTxt.text
        
        do {
            try managedContext.save()
            print ("Successfully saved data")
            completion(true)
        } catch {
            debugPrint("Couldn't save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            if traitCollection.userInterfaceStyle == .dark {
                textView.textColor = UIColor.white
            } else {
                textView.textColor = UIColor.black
            }
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "I am..."
            textView.textColor = UIColor.lightGray
        }
    }
    
}
