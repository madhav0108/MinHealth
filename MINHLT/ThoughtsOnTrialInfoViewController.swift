//
//  ThoughtsOnTrialInfoViewController.swift
//  IMWHO
//
//  Created by madhav sharma on 10/11/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class ThoughtsOnTrialInfoViewController: UIViewController {

    @IBOutlet weak var comingSoonIIBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        comingSoonIIBtn.layer.cornerRadius = 10.0
        comingSoonIIBtn.layer.borderWidth = 1.0
        comingSoonIIBtn.layer.borderColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func rndWrdBtnPressed(_ sender: Any) {
        guard let minWrdViewController = storyboard?.instantiateViewController(withIdentifier: "MinWrdViewController")
            else {
                return
        }
        //to switch default annoying card-view to fullscreen-view
        //using a segue programmatically
        minWrdViewController.modalPresentationStyle = .fullScreen
        presentDetail(minWrdViewController)
    }
    

}
