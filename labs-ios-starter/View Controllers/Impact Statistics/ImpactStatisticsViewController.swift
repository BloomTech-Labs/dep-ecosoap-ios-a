//
//  ImpactStatisticsViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ImpactStatisticsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let layout = collectionView?.collectionViewLayout as? StatisticsLayout {
//            layout.delegate = self
//        }
//        collectionView?.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        collectionView.allowsMultipleSelection = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImpactStatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImpactStatisticsOverallCell", for: indexPath) as? ImpactStatisticsOverallCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImpactStatisticsIndividualCell", for: indexPath) as? ImpactStatisticsIndividualCollectionViewCell else { return UICollectionViewCell() }
            
            return cell
        }
    }
}

extension ImpactStatisticsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        
        if indexPath.item == 0 {
            width = collectionView.bounds.width - 40
            height = 265
        } else {
            width = (collectionView.bounds.width / 2) - 25
            height = 150
        }
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20.0, left: 20, bottom: 20, right: 20)
    }

}

//extension ImpactStatisticsViewController: StatisticsLayoutDelegate {
//    func collectionView(
//        _ collectionView: UICollectionView,
//        heightForCellAtIndexPath indexPath:IndexPath) -> CGFloat {
//
//        if indexPath.item == 0 {
//            return 265
//        } else {
//            return 100
//        }
//    }
//}
