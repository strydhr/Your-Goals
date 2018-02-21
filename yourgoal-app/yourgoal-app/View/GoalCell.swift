//
//  GoalCell.swift
//  yourgoal-app
//
//  Created by Satyia Anand on 21/02/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescLbl: UILabel!
    
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(description: String, type: GoalType, goalProgressAmount: Int){
        self.goalDescLbl.text = description
        self.goalTypeLbl.text = type.rawValue
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
    }
}

