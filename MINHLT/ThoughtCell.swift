//
//  ThoughtCell.swift
//  IMWHO
//
//  Created by madhav sharma on 10/8/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class ThoughtCell: UITableViewCell {

    @IBOutlet weak var thoughtTitleLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    
    func configureCell(title: String, timestamp: String) {
        self.thoughtTitleLbl.text = title
        self.timeStampLbl.text = timestamp
    }

}
