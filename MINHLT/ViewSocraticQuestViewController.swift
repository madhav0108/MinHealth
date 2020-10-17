//
//  ViewSocraticQuestViewController.swift
//  MINHLT
//
//  Created by madhav sharma on 10/17/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit
import CoreData

class ViewSocraticQuestViewController: UIViewController, UITextViewDelegate {
    
    var quests: [Quest] = []
    var questRowIndex: NSInteger?

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
    @IBOutlet weak var bigBackBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        evidenceTxt.isScrollEnabled = true
        evidenceTxt.keyboardDismissMode = .onDrag
        evidenceTxt.delegate = self
        
        factsOrFeelingsTxt.isScrollEnabled = true
        factsOrFeelingsTxt.keyboardDismissMode = .onDrag
        factsOrFeelingsTxt.delegate = self
        
        blacknWhiteTxt.isScrollEnabled = true
        blacknWhiteTxt.keyboardDismissMode = .onDrag
        blacknWhiteTxt.delegate = self
        
        assumptionsTxt.isScrollEnabled = true
        assumptionsTxt.keyboardDismissMode = .onDrag
        assumptionsTxt.delegate = self
        
        allEvidenceTxt.isScrollEnabled = true
        allEvidenceTxt.keyboardDismissMode = .onDrag
        allEvidenceTxt.delegate = self
        
        exaggerationTxt.isScrollEnabled = true
        exaggerationTxt.keyboardDismissMode = .onDrag
        exaggerationTxt.delegate = self
        
        habitOrFactTxt.isScrollEnabled = true
        habitOrFactTxt.keyboardDismissMode = .onDrag
        habitOrFactTxt.delegate = self
        
        smonPassTxt.isScrollEnabled = true
        smonPassTxt.keyboardDismissMode = .onDrag
        smonPassTxt.delegate = self
        
        scenarioTxt.isScrollEnabled = true
        scenarioTxt.keyboardDismissMode = .onDrag
        scenarioTxt.delegate = self
        
        bigBackBtn.layer.cornerRadius = 10.0
        
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
    }
    
    func fetchCoreDataObjects() {
        self.fetch { (complete) in
            if complete {
                print("fetch was successful")
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func bigBackBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
}

extension ViewSocraticQuestViewController {
    override func viewDidAppear(_ animated: Bool) {
        let quest = quests[questRowIndex!]
        
        thghtQuesdTxt.text = quest.thghtQuesd
        evidenceTxt.text = quest.evidence
        factsOrFeelingsTxt.text = quest.factsOrFeelings
        blacknWhiteTxt.text = quest.blacknWhite
        assumptionsTxt.text = quest.assumptions
        allEvidenceTxt.text = quest.allEvidence
        exaggerationTxt.text = quest.exaggeration
        habitOrFactTxt.text = quest.habitOrFact
        smonPassTxt.text = quest.smonPass
        scenarioTxt.text = quest.scenario
        
    }
    
}

extension ViewSocraticQuestViewController {
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = qAppDelegate?.persistentContainer.viewContext else {return}
        
        //trying to fetch items of this particular entity
        let fetchRequest = NSFetchRequest<Quest>(entityName: "Quest")
        
        do {
            quests = try managedContext.fetch(fetchRequest)
            print("fetch was successful")
            completion(true)
        } catch {
            debugPrint("Couldn't fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
}
