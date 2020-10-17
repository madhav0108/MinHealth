//
//  NewSocraticQuestViewController.swift
//  MINHLT
//
//  Created by madhav sharma on 10/16/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit
import CoreData

class NewSocraticQuestViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var thghtQuesdTxt: UITextField!
    @IBOutlet weak var evidenceTxt: UITextView!
    @IBOutlet weak var factsOrFeelingsTxt: UITextView!
    @IBOutlet weak var blacknWhiteTxt: UITextView!
    @IBOutlet weak var assumptionsTxt: UITextView!
    @IBOutlet weak var allEvidenceTxt: UITextView!
    @IBOutlet weak var exaggerationTxt: UITextView!
    @IBOutlet weak var habitOrFactTxt: UITextView!
    @IBOutlet weak var smonPassTxt: UITextView!
    @IBOutlet weak var scenarioTxt: UITextView!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        evidenceTxt.isScrollEnabled = false
        evidenceTxt.layer.borderWidth = 1.0
        evidenceTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        evidenceTxt.layer.cornerRadius = 10.0
        evidenceTxt.keyboardDismissMode = .onDrag
        evidenceTxt.text = ""
        evidenceTxt.textColor = UIColor.lightGray
        evidenceTxt.delegate = self
        
        factsOrFeelingsTxt.isScrollEnabled = false
        factsOrFeelingsTxt.layer.borderWidth = 1.0
        factsOrFeelingsTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        factsOrFeelingsTxt.layer.cornerRadius = 10.0
        factsOrFeelingsTxt.keyboardDismissMode = .onDrag
        factsOrFeelingsTxt.text = ""
        factsOrFeelingsTxt.textColor = UIColor.lightGray
        factsOrFeelingsTxt.delegate = self
        
        blacknWhiteTxt.isScrollEnabled = false
        blacknWhiteTxt.layer.borderWidth = 1.0
        blacknWhiteTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        blacknWhiteTxt.layer.cornerRadius = 10.0
        blacknWhiteTxt.keyboardDismissMode = .onDrag
        blacknWhiteTxt.text = ""
        blacknWhiteTxt.textColor = UIColor.lightGray
        blacknWhiteTxt.delegate = self
        
        assumptionsTxt.isScrollEnabled = false
        assumptionsTxt.layer.borderWidth = 1.0
        assumptionsTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        assumptionsTxt.layer.cornerRadius = 10.0
        assumptionsTxt.keyboardDismissMode = .onDrag
        assumptionsTxt.text = ""
        assumptionsTxt.textColor = UIColor.lightGray
        assumptionsTxt.delegate = self
        
        allEvidenceTxt.isScrollEnabled = false
        allEvidenceTxt.layer.borderWidth = 1.0
        allEvidenceTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        allEvidenceTxt.layer.cornerRadius = 10.0
        allEvidenceTxt.keyboardDismissMode = .onDrag
        allEvidenceTxt.text = ""
        allEvidenceTxt.textColor = UIColor.lightGray
        allEvidenceTxt.delegate = self
        
        exaggerationTxt.isScrollEnabled = false
        exaggerationTxt.layer.borderWidth = 1.0
        exaggerationTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        exaggerationTxt.layer.cornerRadius = 10.0
        exaggerationTxt.keyboardDismissMode = .onDrag
        exaggerationTxt.text = ""
        exaggerationTxt.textColor = UIColor.lightGray
        exaggerationTxt.delegate = self
        
        habitOrFactTxt.isScrollEnabled = false
        habitOrFactTxt.layer.borderWidth = 1.0
        habitOrFactTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        habitOrFactTxt.layer.cornerRadius = 10.0
        habitOrFactTxt.keyboardDismissMode = .onDrag
        habitOrFactTxt.text = ""
        habitOrFactTxt.textColor = UIColor.lightGray
        habitOrFactTxt.delegate = self
        
        smonPassTxt.isScrollEnabled = false
        smonPassTxt.layer.borderWidth = 1.0
        smonPassTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        smonPassTxt.layer.cornerRadius = 10.0
        smonPassTxt.keyboardDismissMode = .onDrag
        smonPassTxt.text = ""
        smonPassTxt.textColor = UIColor.lightGray
        smonPassTxt.delegate = self
        
        scenarioTxt.isScrollEnabled = false
        scenarioTxt.layer.borderWidth = 1.0
        scenarioTxt.layer.borderColor = #colorLiteral(red: 0.5568627451, green: 0.5568627451, blue: 0.5725490196, alpha: 0.5)
        scenarioTxt.layer.cornerRadius = 10.0
        scenarioTxt.keyboardDismissMode = .onDrag
        scenarioTxt.text = ""
        scenarioTxt.textColor = UIColor.lightGray
        scenarioTxt.delegate = self
        
        submitBtn.layer.cornerRadius = 10.0
        
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func submitBtnPressed(_ sender: Any) {
        if thghtQuesdTxt.text != "" {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = qAppDelegate?.persistentContainer.viewContext else {return}
        let quest = Quest(context: managedContext)
        
        let date = Date()
        let calendar = Calendar.current
        //let hour = calendar.component(.hour, from: date)
        //let minute = calendar.component(.minute, from: date)
        //let second = calendar.component(.second, from: date)

        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        quest.thghtQuesd = thghtQuesdTxt.text
        quest.qTimeStamp = "\(day)/\(month)/\(year)"
        quest.evidence = evidenceTxt.text
        quest.factsOrFeelings = factsOrFeelingsTxt.text
        quest.blacknWhite = blacknWhiteTxt.text
        quest.assumptions = assumptionsTxt.text
        quest.allEvidence = allEvidenceTxt.text
        quest.exaggeration = exaggerationTxt.text
        quest.habitOrFact = habitOrFactTxt.text
        quest.smonPass = smonPassTxt.text
        quest.scenario = scenarioTxt.text
        
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
            textView.text = ""
            textView.textColor = UIColor.lightGray
        }
    }

}
