//
//  SchedulePickupViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/11/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class SchedulePickupViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var schedulePickupButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    // MARK: - Private Methods
    private func setupViews() {
        self.hideKeyboardWhenViewTapped()
        schedulePickupButton.layer.cornerRadius = 8
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: - IBActions
    @IBAction func schedulePickupButtonTapped(_ sender: Any) {
    }
    
}

extension SchedulePickupViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        case 2:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Pickup Details"
        case 1:
            return "Package Contents"
        case 2:
            return "Notes"
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
