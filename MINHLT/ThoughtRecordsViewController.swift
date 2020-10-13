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
    
}

extension ThoughtRecordsViewController {
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        //trying to fetch items of this particular entity
        let fetchRequest = NSFetchRequest<Thought>(entityName: "Thought")
        
        do {
            thoughts = try managedContext.fetch(fetchRequest)
            print("Successfully fetched")
            completion(true)
        } catch {
            debugPrint("Couldn't fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
