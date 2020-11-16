//
//  AdminDistributionsViewController.swift
//  labs-ios-starter
//
//  Created by Dahna on 11/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
class AdminDistributionsViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var distributionTableView: UITableView!
    
    var controller = BackendController.shared
    var distributionsDict: [String: Distribution] {
        return controller.distributions
    }
    var distributions: [Distribution] {
        return filterDistributions(distributionsDict)
    }
    
    //MARK: - Life Cycles
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
    @IBAction func filtersTapped(_ sender: UIButton) {
        // TODO:
    }
    
    //MARK: - Methods
    private func filterDistributions(_ distroDict: [String: Distribution]) -> [Distribution] {
        var distros = Set<Distribution>()
        for (_, distro) in distroDict {
            distros.insert(distro)
        }
        let distributions = Array(distros)
        return distributions
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
