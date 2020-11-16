//
//  AdminDistributionsViewController.swift
//  labs-ios-starter
//
//  Created by Dahna on 11/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
class AdminDistributionsViewController: UIViewController {
    
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
    var distributionsDict: [String: Distribution] {
        controller.distributions
    }
    var distributions: [Distribution] {
        filterDistributions(distributionsDict)
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
        if currentFilter > (FilterType.allCases.count - 1) {
            currentFilter = 0
        } else {
            currentFilter += 1
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "newDistributionSegue":
            guard let newVC = segue.destination as? AdminDistributionDetailViewController else {
                NSLog("Destination was not a distribution detail view controller")
                return
            }
            ///inject any future dependencies here for new distros.
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
        
        switch currentFilter {
        case 0:
            return distributions
        case 1:
            let sortedByPartner: [Distribution] = Array(distributions.sorted { (distribution0, distribution1) -> Bool in
                distribution0.partner?.name ?? "" > distribution1.partner?.name ?? ""
            })
            return sortedByPartner
        case 2:
            let sortedByHub: [Distribution] = Array(distributions.sorted { (distribution0, distribution1) -> Bool in
                distribution0.hub.id > distribution1.hub.id
            })
            return sortedByHub
        default:
            return distributions
        }
    }
}
// MARK: - TableView DataSource & Delegate
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
