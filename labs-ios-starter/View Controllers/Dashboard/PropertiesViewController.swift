//
//  PropertiesViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 9/2/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PropertiesViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var properties: [Property] = []
    let controller = BackendController.shared

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        grabProperties()
    }
    
    // MARK: - Private Methods
    private func grabProperties() {
        for property in controller.properties.values {
            properties.append(property)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPropertyDetailPushSegue" {
            guard let propertyDetailVC = segue.destination as? PropertyDetailViewController else { return }
            guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
            propertyDetailVC.property = properties[selectedIndexPath.row]
        }

    }
    
    // MARK: - IBActions
}

extension PropertiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath) as? PropertyTableViewCell else { return UITableViewCell() }
        
        let property = properties[indexPath.row]
        cell.property = property
        
        return cell
    }
}
