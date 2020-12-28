//
//  IMWHOViewController.swift
//  IMWHO
//
//  Created by madhav sharma on 10/8/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class MinHealthViewController: ViewController {

    @IBOutlet weak var thghtrcrdBtn: UIButton!
    @IBOutlet weak var thghtstrialBtn: UIButton!
    @IBOutlet weak var minRndWordBtn: UIButton!
    @IBOutlet weak var minRndMathBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        thghtrcrdBtn.layer.cornerRadius = 12.5
        thghtrcrdBtn.layer.borderWidth = 1.0
        thghtrcrdBtn.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
        thghtstrialBtn.layer.cornerRadius = 12.5
        thghtstrialBtn.layer.borderWidth = 1.0
        thghtstrialBtn.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
        minRndWordBtn.layer.cornerRadius = 12.5
        minRndWordBtn.layer.borderWidth = 1.0
        minRndWordBtn.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
        minRndMathBtn.layer.cornerRadius = 12.5
        minRndMathBtn.layer.borderWidth = 1.0
        minRndMathBtn.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        
        // Do any additional setup after loading the view.
    }
    
    

}
