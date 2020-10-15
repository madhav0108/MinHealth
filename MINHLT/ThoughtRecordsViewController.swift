//
//  ThoughtRecordsViewController.swift
//  IMWHO
//
//  Created by madhav sharma on 10/8/20.
//  Copyright © 2020 madhav sharma. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class ThoughtRecordsViewController: ViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var thoughts: [Thought] = []
    
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
                if thoughts.count >= 1 {
                    tableView.isHidden = false
                }
                //if no thoughts were created
                else {
                    tableView.isHidden = true
                }
            }
        }
    }
    
    @IBAction func addThoughtPressed(_ sender: Any) {
        guard let addThoughtRecordViewController = storyboard?.instantiateViewController(withIdentifier: "AddThoughtRecordViewController")
            else {
                return
        }
        //to switch default annoying card-view to fullscreen-view
        //using a segue programmatically
        addThoughtRecordViewController.modalPresentationStyle = .fullScreen
        presentDetail(addThoughtRecordViewController)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
}

extension ThoughtRecordsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thoughts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "thoughtCell") as? ThoughtCell
            else {
                return UITableViewCell()
        }
        
        let thought = thoughts[indexPath.row]
        cell.configureCell(title: thought.thoughtTitle!, timestamp: thought.timestamp!)
        
        return cell
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
            self.removeThought(atIndexPath: indexPath)
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

extension ThoughtRecordsViewController {
    
    func removeThought(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        managedContext.delete(thoughts[indexPath.row])
        do{
            try managedContext.save()
            print("remove was successful")
        } catch{
            debugPrint("Couldn't remove: \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        //trying to fetch items of this particular entity
        let fetchRequest = NSFetchRequest<Thought>(entityName: "Thought")
        
        do {
            thoughts = try managedContext.fetch(fetchRequest)
            print("fetch was successful")
            completion(true)
        } catch {
            debugPrint("Couldn't fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
