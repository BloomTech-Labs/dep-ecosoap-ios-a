//
//  AdminDistributionsViewController.swift
//  labs-ios-starter
//
//  Created by Brian Vilchez on 11/4/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class AdminDistributionsTBVC: UIViewController {
    
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
        
        // TODO:
    }
    
    @IBAction func filtersTapped(_ sender: UIButton) {
        
        // TODO:
    }
}

// MARK: - TableView DataSource & Delegate
extension AdminDistributionsTBVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = distributionTableView.dequeueReusableCell(withIdentifier: "DistributionCell", for: indexPath)
        
        return cell
    }
    
    
}
