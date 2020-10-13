//
//  ThoughtRecordInfoViewController.swift
//  IMWHO
//
//  Created by madhav sharma on 10/9/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class ThoughtRecordInfoViewController: UIViewController {

    @IBOutlet weak var mythghtsBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        mythghtsBtn.layer.cornerRadius = 10.0
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func yourThghtRecrdBtnPressed(_ sender: Any) {
        guard let thoughtRecordsViewController = storyboard?.instantiateViewController(withIdentifier: "ThoughtRecordsViewController")
            else {
                return
        }
        //to switch default annoying card-view to fullscreen-view
        //using a segue programmatically
        thoughtRecordsViewController.modalPresentationStyle = .fullScreen
        presentDetail(thoughtRecordsViewController)
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
