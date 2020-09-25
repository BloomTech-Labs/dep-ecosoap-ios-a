//
//  PickupsViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PickupsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var pickups: [Pickup] = []
    let controller = BackendController.shared
    let dateFormatter = DateFormatter()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        grabPickups()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.calendar = .current
    }
    
    private func grabPickups() {
        for pickup in controller.pickups.values {
            pickups.append(pickup)
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPickUpDetailsPushSegue" {
            guard let pickupDetailsVC = segue.destination as? PickupDetailViewController else { return }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
            pickupDetailsVC.pickup = pickups[selectedIndexPath.row]
        }
    }
    
}

extension PickupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return pickups.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SchedulePickupCell", for: indexPath)
                        
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PickupCell", for: indexPath) as? PickupTableViewCell else { return UITableViewCell() }
            
            let pickup = pickups[indexPath.row]
            cell.controller = controller
            cell.pickup = pickup
            cell.dateFormatter = dateFormatter
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 && indexPath.section == 0 {
            performSegue(withIdentifier: "ShowScheduleNewPushSegue", sender: self)
        }
    }
}
