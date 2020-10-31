//
//  LetWorryGoInfoViewController.swift
//  IMWHO
//
//  Created by madhav sharma on 10/11/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class LetWorryGoInfoViewController: UIViewController {

    @IBOutlet weak var cominSoonIIIBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        cominSoonIIIBtn.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func minRndBtnPressed(_ sender: Any) {
        guard let minRndViewController = storyboard?.instantiateViewController(withIdentifier: "MinRndViewController")
            else {
                return
        }
        //to switch default annoying card-view to fullscreen-view
        //using a segue programmatically
        minRndViewController.modalPresentationStyle = .fullScreen
        presentDetail(minRndViewController)
    }
    
}
