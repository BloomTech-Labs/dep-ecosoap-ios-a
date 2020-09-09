//
//  ProfileViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 9/2/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private let titleLabels = ["Name", "Company", "Email", "Phone", "Skype", "Address"]
    private let iconImageViews = [UIImage(systemName: "person.crop.square.fill"), UIImage(systemName: "briefcase.fill"), UIImage(systemName: "envelope.fill"), UIImage(systemName: "phone.fill"), UIImage(systemName: "desktopcomputer"), UIImage(systemName: "house.fill")]
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileInfoCell", for: indexPath) as? ProfileInfoTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.text = titleLabels[indexPath.row]
        cell.iconImageView.image = iconImageViews[indexPath.row]
        cell.iconImageView.tintColor = iconTints[indexPath.row]
        cell.descriptionTextField.text = placeholderData[indexPath.row]
        
        return cell
    }
}
