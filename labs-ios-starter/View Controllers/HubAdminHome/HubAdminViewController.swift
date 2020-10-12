//
//  HubAdminViewController.swift
//  labs-ios-starter
//
//  Created by Harmony Radley on 10/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class HubAdminViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Properties
    private let controller = BackendController.shared
    private let hubs: [Hub] = []

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    private func updateViews() {

    }
}

extension HubAdminViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {


    }
}

