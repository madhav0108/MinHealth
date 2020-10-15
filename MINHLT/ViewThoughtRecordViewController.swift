//
//  ViewThoughtRecordViewController.swift
//  MINHLT
//
//  Created by madhav sharma on 10/14/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit
import CoreData

class ViewThoughtRecordViewController: UIViewController, UITextViewDelegate {
    
    var thoughts: [Thought] = []
    var thoughtRowIndex: NSInteger?

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
        situationTxt.delegate = self
        
        thoughtTxt.isScrollEnabled = false
        thoughtTxt.keyboardDismissMode = .onDrag
        thoughtTxt.delegate = self
        
        emotionsTxt.isScrollEnabled = false
        emotionsTxt.keyboardDismissMode = .onDrag
        emotionsTxt.delegate = self
        
        behaviorTxt.isScrollEnabled = false
        behaviorTxt.keyboardDismissMode = .onDrag
        behaviorTxt.delegate = self
        
        alterThghtTxt.isScrollEnabled = false
        alterThghtTxt.keyboardDismissMode = .onDrag
        alterThghtTxt.delegate = self

        submitBtn.layer.cornerRadius = 10.0
        submitBtn.isHidden = true
        
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

}

extension ViewThoughtRecordViewController {
    override func viewDidAppear(_ animated: Bool) {
        let thought = thoughts[thoughtRowIndex!]
        
        thghtTitleTxt.text = thought.thoughtTitle
        situationTxt.text = thought.situation
        thoughtTxt.text = thought.thought
        emotionsTxt.text = thought.emotions
        behaviorTxt.text = thought.behavior
        alterThghtTxt.text = thought.alterThght
        
        //situationTxt.text = thought
    }
}

extension ViewThoughtRecordViewController {
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        //trying to fetch items of this particular entity
        let fetchRequest = NSFetchRequest<Thought>(entityName: "Thought")
        
        do {
            thoughts = try managedContext.fetch(fetchRequest)
            print("fetch was successful")
            completion(true)
        } catch {
            debugPrint("Couldn't fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
}
