//
//  AdminDistributionsViewController.swift
//  labs-ios-starter
//
//  Created by Dahna on 11/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//
//TODO:
///Need singleton for backend with data.

import UIKit
class AdminDistributionsViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var distributionTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNewButton()
        configureTableView()
    }
    // MARK: - Helper Methods
    private func configureNewButton() {
        newButton.layer.cornerRadius = 5
    }
    private func configureTableView() {
        distributionTableView.delegate = self
        distributionTableView.dataSource = self
    }
    // MARK: - IBActions
    @IBAction func newTapped(_ sender: UIButton) {
        // TODO: Segue to empty detail VC
    }
    @IBAction func filtersTapped(_ sender: UIButton) {
        // TODO: Add a filtering method for the hubs. This button can present a modal picker of some kind.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //TODO: Add segues to present hub details to edit or empty fields to add new
    }
}
// MARK: - TableView DataSource & Delegate
extension AdminDistributionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = distributionTableView.dequeueReusableCell(withIdentifier: "DistributionCell", for: indexPath)
        return cell
    }
}
