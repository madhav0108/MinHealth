//
//  MINHLTViewController.swift
//  MINHLT
//
//  Created by madhav sharma on 10/12/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class MINHLTViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1882352941, green: 0.4862745098, blue: 0.9647058824, alpha: 1)

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            guard let minHealthViewController = self.storyboard?.instantiateViewController(withIdentifier: "MinHealthViewController")
                        else {
                            return
                    }
                    //to switch default annoying card-view to fullscreen-view
                    //using a segue programmatically
                    minHealthViewController.modalPresentationStyle = .fullScreen
            self.presentDetail(minHealthViewController)
        }
    }
    
}
