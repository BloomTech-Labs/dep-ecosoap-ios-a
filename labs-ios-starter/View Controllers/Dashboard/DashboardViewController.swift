//
//  DashboardViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/10/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    let controller = BackendController.shared
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let selectedIndexPaths = self.collectionView.indexPathsForSelectedItems {
            for item in selectedIndexPaths {
                self.collectionView.deselectItem(at: item, animated: true)
            }
        }
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        if let layout = collectionView?.collectionViewLayout as? DashboardLayout {
            layout.delegate = self
        }
        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        collectionView.allowsMultipleSelection = false
    }
    
    private func fetchAll() {
        controller.initialFetch(userId: "UserId1") { (error) in
            if let error = error {
                NSLog("\(error): Error occured during initial fetch")
            }
            print("\(self.controller.users)")
            print("\(self.controller.properties)")
            print("\(self.controller.pickups)")
            print("\(self.controller.payments)")
            print("\(self.controller.hubs)")
            print("\(self.controller.pickupCartons)")
            print("\(self.controller.hospitalityContracts)")
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         SEGUE IDENTIFIERS
          - ShowProfilePushSegue
          - ShowPropertiesPushSegue
          - ShowPaymentHistoryPushSegue
          - ShowMakePaymentPushSegue
          - ShowSettingsPushSegue
        */
    }
    
    // MARK: - IBActions
    
}

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardCell", for: indexPath) as? DashboardCollectionViewCell else { return UICollectionViewCell() }
        
        cell.indexPath = indexPath
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
        if let cell = collectionView.cellForItem(at: indexPath) as? DashboardCollectionViewCell {
            cell.updateShadowOnSelect()
        }
        */
        
        if indexPath.item == 0 {
            performSegue(withIdentifier: "ShowProfilePushSegue", sender: self)
        } else if indexPath.item == 1 {
            performSegue(withIdentifier: "ShowPropertiesPushSegue", sender: self)
        } else if indexPath.item == 2 {
            performSegue(withIdentifier: "ShowPaymentHistoryPushSegue", sender: self)
        } else if indexPath.item == 3 {
            performSegue(withIdentifier: "ShowMakePaymentPushSegue", sender: self)
        } else if indexPath.item == 4 {
            performSegue(withIdentifier: "ShowSettingsPushSegue", sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? DashboardCollectionViewCell {
            cell.updateShadowOnDeselect()
        }
    }
}

extension DashboardViewController: DashboardLayoutDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForCellAtIndexPath indexPath:IndexPath) -> CGFloat {
        
        if indexPath.item == 0 {
            return 250
        } else if indexPath.item == 1 {
            return 200
        } else if indexPath.item == 2 {
            return 200
        } else if indexPath.item == 3 {
            return 250
        } else {
            return 150
        }
    }
}
