//
//  SocraticQuestsViewController.swift
//  MINHLT
//
//  Created by madhav sharma on 10/16/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit
import CoreData

let qAppDelegate = UIApplication.shared.delegate as? AppDelegate

class SocraticQuestsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var quests: [Quest] = []
    var questRowIndex: NSInteger?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreDataObjects()
        tableView.reloadData()
    }
    
    func fetchCoreDataObjects() {
        self.fetch { (complete) in
            if complete {
                //if atleast one thought was created
                if quests.count >= 1 {
                    tableView.isHidden = false
                }
                //if no thoughts were created
                else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    @IBAction func addQuestBtnPressed(_ sender: Any) {
        guard let newSocraticQuestViewController = storyboard?.instantiateViewController(withIdentifier: "NewSocraticQuestViewController")
            else {
                return
        }
        //to switch default annoying card-view to fullscreen-view
        //using a segue programmatically
        newSocraticQuestViewController.modalPresentationStyle = .fullScreen
        presentDetail(newSocraticQuestViewController)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }

}

extension SocraticQuestsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let qcell = tableView.dequeueReusableCell(withIdentifier: "questCell") as? QuestCell
            else {
                return UITableViewCell()
        }
        
        let quest = quests[indexPath.row]
        qcell.configureQuestCell(qtitle: quest.thghtQuesd!, qtimestamp: quest.qTimeStamp!)
        
        return qcell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            //return UITableViewCell.EditingStyle.none
            return .none
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, boolValue) in
            self.removeQuest(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        contextItem.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.3019607843, blue: 0.2705882353, alpha: 0.952349101)
        //let deleteAction = UISwipeActionsConfiguration(actions: [contextItem])
        let actions = UISwipeActionsConfiguration(actions: [contextItem])
                
        return actions
    }
    
}

extension SocraticQuestsViewController {
    
    func removeQuest(atIndexPath indexPath: IndexPath) {
        guard let managedContext = qAppDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(quests[indexPath.row])
        do{
            try managedContext.save()
            print("remove was successful")
        } catch{
            debugPrint("Couldn't remove: \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = qAppDelegate?.persistentContainer.viewContext else {return}
        
        //trying to fetch items of this particular entity
        let fetchRequest = NSFetchRequest<Quest>(entityName: "Quest")
        
        do {
            quests = try managedContext.fetch(fetchRequest)
            print("fetch was successful")
            completion(true)
        } catch {
            debugPrint("Couldn't fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
