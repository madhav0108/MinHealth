//
//  SocraticQuestionsInfoViewController.swift
//  IMWHO
//
//  Created by madhav sharma on 10/11/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class SocraticQuestionsInfoViewController: UIViewController {

    @IBOutlet weak var comingSoonIBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        comingSoonIBtn.layer.cornerRadius = 10.0

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
