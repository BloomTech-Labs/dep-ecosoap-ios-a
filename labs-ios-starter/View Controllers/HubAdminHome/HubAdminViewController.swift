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
    private var hubs: [Hub] = []
    private var selectedHub: Hub? {
        didSet {
            updateViewsImpactStats()
            updateViewsProducitonReports()
        }
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    private func updateViewsImpactStats() {
        guard let selectedHub = selectedHub else { return }
        controller.impactStatsByHubId(id: selectedHub.id) { (error) in
            if let error = error {
                print("Error fetching stats \(error)")
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    private func updateViewsProducitonReports() {
        guard let selectedHub = selectedHub else { return }
        controller.productionReportsByHubId(hubId: selectedHub.id) { (error) in
            if let error = error {
                print("Error fetching stats \(error)")
            }

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    private func overallBreakDown() -> (Int, Int, Int, Int) {
        guard let selectedHub = selectedHub else { return (0,0,0,0) }
        let bottlesRecycled = selectedHub.impact?.bottlesRecycled ?? 0
        let soapRecycled = selectedHub.impact?.soapRecycled ?? 0
        let paperRecycled = selectedHub.impact?.paperRecycled ?? 0
        let linensRecycled = selectedHub.impact?.linensRecycled ?? 0

        let total = bottlesRecycled + soapRecycled + paperRecycled + linensRecycled
        let soapPercentage = (Double(soapRecycled) / Double(total)) * 100
        let bottlesPercentage = (Double(bottlesRecycled) / Double(total)) * 100
        let paperPercentage = (Double(paperRecycled) / Double(total)) * 100
        let linensPercentage = (Double(linensRecycled) / Double(total)) * 100
        return (Int(soapPercentage), Int(linensPercentage), Int(bottlesPercentage), Int(paperPercentage))

    }
}

extension HubAdminViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImpactStatisticsOverallCell", for: indexPath) as? HubAdminCollectionViewCell else { return UICollectionViewCell() }

            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImpactStatisticsIndividualCell", for: indexPath) as? ImpactStatisticsIndividualCollectionViewCell else { return UICollectionViewCell() }

            cell.indexPath = indexPath

            return cell
        }
    }



}

