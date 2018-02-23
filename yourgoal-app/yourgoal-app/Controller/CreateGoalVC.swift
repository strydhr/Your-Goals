//
//  CreateGoalVC.swift
//  yourgoal-app
//
//  Created by Satyia Anand on 22/02/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController ,UITextViewDelegate{

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    
    @IBOutlet weak var longTermBtn: UIButton!
    
    
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        
        goalTextView.delegate = self
    }

   
    @IBAction func nextBtnPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "Whats your goal ?" {
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC")as? FinishGoalVC else { return}
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
            
        }
    }
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        goalType = .longTerm
        longTermBtn.setSelectedColor()
        shortTermBtn.setDeselectedColor()
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
