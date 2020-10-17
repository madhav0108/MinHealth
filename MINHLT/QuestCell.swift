//
//  QuestCell.swift
//  MINHLT
//
//  Created by madhav sharma on 10/16/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit

class QuestCell: UITableViewCell {

    @IBOutlet weak var qThoughtTitleLbl: UILabel!
    @IBOutlet weak var qTimeStampLbl: UILabel!
    
    func configureQuestCell(qtitle: String, qtimestamp: String) {
        self.qThoughtTitleLbl.text = qtitle
        self.qTimeStampLbl.text = qtimestamp
    }

}
