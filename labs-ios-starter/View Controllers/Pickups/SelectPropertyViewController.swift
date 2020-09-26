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

protocol UserAddedPropertyDelegate: AnyObject {
    func userAddedProperty(with property: Property)
}

class SelectPropertyViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    weak var delegate: DeselectTableViewCellOnDismissDelegate?
    weak var delegateProperty: UserAddedPropertyDelegate?
    private var properties: [Property] = []
    private let controller = BackendController.shared
    
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
}

extension SelectPropertyViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)

        cell.textLabel?.text = properties[indexPath.row].name

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath)
        cell.accessoryType = .checkmark
        let property = properties[indexPath.row]
        delegateProperty?.userAddedProperty(with: property)
        dismiss(animated: true) {
            self.delegate?.deselectTableViewCell()
        }
    }
}
