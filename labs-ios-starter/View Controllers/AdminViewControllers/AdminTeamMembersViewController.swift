//
//  AdminTeamMembersViewController.swift
//  labs-ios-starter
//
//  Created by Patrick Millet on 11/9/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

//TODO: Stretch - Implement viewing and editing of Admin team members.
class AdminTeamMembersViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var membersTableView: UITableView!
    private let networkController = BackendController.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        fetchTeamMembers()
    }
    
    // MARK: - Helper Methods
    
    private func configureTableView() {
        membersTableView.delegate = self
        membersTableView.dataSource = self
    }
    
    private func fetchTeamMembers() {
       // networkController
        networkController.fetchTeamMembers { (_, error) in
            if let error = error {
                print("NOOOO \(error)")
            }
        }
    }
    
    
}

extension AdminTeamMembersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = membersTableView.dequeueReusableCell(withIdentifier: "TeamMemberCell", for: indexPath)
        return cell
    }
    
    
}

extension Queries {
    
    static func getTeamMembers(id: String?) -> String {
        return """
        query {
          
          teamMembers {
            
            hub {
              name
              id
            },
            id,
            firstName,
            middleName,
               lastName,
            title,
            bio,
              email,
            phone,
            skype,
            portrait,
            joinDate
          }
        }
    """
    }
}
