//
//  RemindersViewController.swift
//  whileimhere-ios
//
//  Created by Chelsea Power on 4/30/17.
//  Copyright © 2017 Brian Maci. All rights reserved.
//

import UIKit

class RemindersViewController: WIHViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addReminderButton: WIHButton!
    
    let kCellIdentifier = "ReminderCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
    }

    func initialSetup() {
        
        setupTableView()
        setupButtons()
    }
    
    func setupTableView() {
        
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: kCellIdentifier, bundle: nil), forCellReuseIdentifier: kCellIdentifier)
    }
    
    func setupButtons() {
        
        addReminderButton.addTarget(self, action: #selector(tappedAddReminderButton), for: .touchUpInside)
    }
    
    func tappedAddReminderButton(sender: UIButton) {
        
        let addReminder = AddNewReminderViewController(nibName: "AddNewReminderViewController", bundle: nil)
        
        navigationController?.present(UINavigationController(rootViewController: addReminder), animated: true, completion: nil)
    }
    
    //MARK: - UITableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CurrentUser.shared.reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier) as! ReminderCell
        cell.populate(CurrentUser.shared.reminders[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("We selected: \(CurrentUser.shared.reminders[indexPath.row].title)")
    }
}
