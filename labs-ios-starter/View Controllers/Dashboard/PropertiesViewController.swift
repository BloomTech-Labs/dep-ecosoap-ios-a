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
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
    }
    
    private func updateViews() {
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: - IBActions


}

extension PropertiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath) as? PropertyTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}
