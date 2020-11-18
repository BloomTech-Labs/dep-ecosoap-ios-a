//
//  AdminDistributionsViewController.swift
//  labs-ios-starter
//
//  Created by Dahna on 11/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
class AdminDistributionsViewController: UIViewController {
    //MARK: - Types
    enum FilterType: Int, CaseIterable {
        case none = 0
        case partner = 1
        case hub = 2
    }
    
    
    // MARK: - Properties
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var distributionTableView: UITableView!
    
    var controller = BackendController.shared
    var currentFilter = 0
    var hub: Hub?
    
    var distributionsDict: [String: Distribution] {
        controller.distributions
    }
    var distributions: [Distribution] {
        filterDistributions(distributionsDict)
    }
    
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
        configureNewButton()
        configureTableView()
    }
    
    
    // MARK: - IBActions
    @IBAction func filtersTapped(_ sender: UIButton) {
        if currentFilter > (FilterType.allCases.count - 1) {
            currentFilter = 0
        } else {
            currentFilter += 1
        }
        distributionTableView.reloadData()
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editDistributionSegue":
            guard let indexPath = distributionTableView.indexPathForSelectedRow else {
                NSLog("Could not fetch index path for selected row.")
                return
            }
            guard let editVC = segue.destination as? AdminDistributionDetailViewController else {
                NSLog("Destination was not a distribution detail view controller")
                return
            }
            
            editVC.distribution = distributions[indexPath.row]
        default:
            NSLog("No such segue exists:  \(String(describing: segue.identifier))")
            return
        }
    }
    
    
    //MARK: - Methods
    private func filterDistributions(_ distroDict: [String: Distribution]) -> [Distribution] {
        var uniques = Set<Distribution>()
        for (_, distro) in distroDict {
            uniques.insert(distro)
        }
        var distributions = Array(uniques)
        
    }
    
    private func configureNewButton() {
        newButton.layer.cornerRadius = 5
    }
    
    private func configureTableView() {
        distributionTableView.delegate = self
        distributionTableView.dataSource = self
    }
    
    private func populateData() {
        DispatchQueue.main.async {
            self.controller.distributions { error in
                if let error = error {
                    NSLog("Problem fetching DISTRIBUTION Objects: \(error)")
                    return
                }
            }
            self.controller.distributionPartners { error in
                if let error = error {
                    NSLog("Problem fetching DISTRIBUTION PARTNER Objects: \(error)")
                    return
                }
            }
        }
    }
}


//MARK: - Extensions
///TableView DataSource & Delegate
extension AdminDistributionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return distributions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = distributionTableView.dequeueReusableCell(withIdentifier: "DistributionCell", for: indexPath) as? DistributionTableViewCell else { fatalError("Couldn't dequeue cell of type DistributionTableViewCell") }
        
        cell.distribution = distributions[indexPath.row]
        return cell
    }
}
