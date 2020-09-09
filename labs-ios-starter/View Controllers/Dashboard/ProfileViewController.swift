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
    private let accountInfoLabels = ["Name",
                               "Company",
                               "Address",]
    private let contactInfoLabels = ["Phone",
                                     "Skype",
                                     "Email"]
    private let accountInfoImageViews = [UIImage(systemName: "person.fill"),
                                         UIImage(systemName: "briefcase.fill"),
                                         UIImage(systemName: "house.fill")]
    private let contactInfoImageViews = [UIImage(systemName: "phone.fill"),
                                         UIImage(systemName: "desktopcomputer"),
                                         UIImage(systemName: "envelope.fill")]
    private let accountInfoImageTints = [UIColor(named: .colorESBBlue),
                                         UIColor(named: .colorESBBrick),
                                         UIColor(named: .colorESBGold)]
    private let contactInfoImageTints = [UIColor(named: .colorESBRed),
                                         UIColor(named: .colorESBSapphire),
                                         UIColor(named: .colorESBGreen)]
    private let placeholderData = ["Wyatt Harrell",
                                   "Lambda School",
                                   "3452 Apple Park Way"]
    private let placeholderData2 = ["345-394-9034",
                                   "wyattharrell",
                                   "example@gmail.com"]
    
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
        if section == 0{
            return accountInfoLabels.count
        } else {
            return contactInfoLabels.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Account Information"
        } else {
            return "Contact Information"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileInfoCell", for: indexPath) as? ProfileInfoTableViewCell else { return UITableViewCell() }
        
        if indexPath.section == 0 {
            cell.titleLabel.text = accountInfoLabels[indexPath.row].uppercased()
            cell.iconImageView.image = accountInfoImageViews[indexPath.row]
            cell.iconImageView.tintColor = .white
            cell.circularBackgroundImageView.tintColor = accountInfoImageTints[indexPath.row]
            cell.descriptionTextField.text = placeholderData[indexPath.row]
        } else {
            cell.titleLabel.text = contactInfoLabels[indexPath.row].uppercased()
            cell.iconImageView.image = contactInfoImageViews[indexPath.row]
            cell.iconImageView.tintColor = .white
            cell.circularBackgroundImageView.tintColor = contactInfoImageTints[indexPath.row]
            cell.descriptionTextField.text = placeholderData2[indexPath.row]
        }
        
        return cell
    }
}
