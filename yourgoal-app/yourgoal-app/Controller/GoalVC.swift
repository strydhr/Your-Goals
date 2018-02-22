//
//  ViewController.swift
//  yourgoal-app
//
//  Created by Satyia Anand on 21/02/2018.
//  Copyright © 2018 Satyia Anand. All rights reserved.
//

import UIKit
import CoreData

class GoalVC: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       tabelView.delegate = self
        tabelView.dataSource = self
        
    }

   
    @IBAction func addGoalBtnPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return}
        presentDetail(createGoalVC)
    }
    
}

extension GoalVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tabelView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell()}
        cell.configureCell(description: "Eat Salad mon", type: .shortTerm, goalProgressAmount: 3)
        return cell
    }
    
    
    
}

