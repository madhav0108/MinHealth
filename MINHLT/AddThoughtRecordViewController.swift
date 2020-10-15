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
        situationTxt.layer.borderWidth = 1.0
        situationTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        situationTxt.layer.cornerRadius = 10.0
        situationTxt.keyboardDismissMode = .onDrag
        situationTxt.text = "Describe what was happening: Who, what, when where?"
        situationTxt.textColor = UIColor.lightGray
        situationTxt.delegate = self
        
        thoughtTxt.isScrollEnabled = false
        thoughtTxt.layer.borderWidth = 1.0
        thoughtTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        thoughtTxt.layer.cornerRadius = 10.0
        thoughtTxt.keyboardDismissMode = .onDrag
        thoughtTxt.text = "What thoughts were going through your mind? What memories or images were in your mind?"
        thoughtTxt.textColor = UIColor.lightGray
        thoughtTxt.delegate = self
        
        emotionsTxt.isScrollEnabled = false
        emotionsTxt.layer.borderWidth = 1.0
        emotionsTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        emotionsTxt.layer.cornerRadius = 10.0
        emotionsTxt.keyboardDismissMode = .onDrag
        emotionsTxt.text = "What emotions did you feel at that time? How intense were they?"
        emotionsTxt.textColor = UIColor.lightGray
        emotionsTxt.delegate = self
        
        behaviorTxt.isScrollEnabled = false
        behaviorTxt.layer.borderWidth = 1.0
        behaviorTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        behaviorTxt.layer.cornerRadius = 10.0
        behaviorTxt.keyboardDismissMode = .onDrag
        behaviorTxt.text = "How did you react at that time? How has your behavior been since then?"
        behaviorTxt.textColor = UIColor.lightGray
        behaviorTxt.delegate = self
        
        alterThghtTxt.isScrollEnabled = false
        alterThghtTxt.layer.borderWidth = 1.0
        alterThghtTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        alterThghtTxt.layer.cornerRadius = 10.0
        alterThghtTxt.keyboardDismissMode = .onDrag
        alterThghtTxt.text = "A new thought based on the evidence for and against the original thought"
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
