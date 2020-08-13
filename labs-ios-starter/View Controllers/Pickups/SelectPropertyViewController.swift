//
//  SelectPropertyViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

protocol DeselectTableViewCellOnDismissDelegate: AnyObject {
    func deselectTableViewCell()
}

class SelectPropertyViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    weak var delegate: DeselectTableViewCellOnDismissDelegate?
    var properties: [String] = ["Property 1", "Property 2", "Property 3"]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SelectPropertyViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)

        cell.textLabel?.text = properties[indexPath.row]
        if indexPath.row == 1 {
            // Find default property and add checkmark
            cell.accessoryType = .checkmark
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)
        cell.accessoryType = .checkmark
        
        dismiss(animated: true) {
            self.delegate?.deselectTableViewCell()
        }
    }
}
