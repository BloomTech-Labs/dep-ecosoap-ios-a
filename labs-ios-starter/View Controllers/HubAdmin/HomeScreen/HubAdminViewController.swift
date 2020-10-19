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
    private var selectedHub: Hub?
    private var productionReportArray: [HubDailyProduction] = []
    private var impactStats: ImpactStats?
    private var numberOfColumns = 2
    private let cellPadding: CGFloat = 8
    private var cache: [UICollectionViewLayoutAttributes] = []
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }

    // MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        guard let userhub = controller.loggedInUser.hub else {return}
        controller.hubs[userhub.id] = userhub
        fetchAll()
        updateViewsProductionReports()
        updateViewsImpactStats()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
    }

    //MARK: - Methods
    private func fetchAll() {
        controller.initialFetch(userId: controller.loggedInUser.id) { (error) in
            if let error = error {
                NSLog("\(error): Error occured during initial fetch")
            }
            if let user = self.controller.users[self.controller.loggedInUser.id] {
                self.controller.loggedInUser = user
                print(self.controller.loggedInUser.id)
            }
            print("\(self.controller.users)")
            print("\(self.controller.pickups)")
            print("\(self.controller.productionReports)")
            print("\(self.controller.hubs)")
        }
    }

    private func updateViewsImpactStats() {
        guard let selectedHub = controller.loggedInUser.hub?.id else { return }
        controller.impactStatsByHubId(id: selectedHub) { (data, error) in
            if let error = error {
                print("Error fetching stats \(error)")
                return
            }

            guard let data = self.controller.loggedInUser.hub?.impact else { return }

            self.impactStats = data
            self.overallBreakDown()

            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    private func updateViewsProductionReports() {
        guard let selectedHub = controller.loggedInUser.hub else { return }
        productionReportArray = []
        controller.productionReportsByHubId(hubId: selectedHub.id) { (error) in
            if let error = error {
                print("Error fetching production reports \(error)")
                return
            }
            for productionReport in self.controller.productionReports.values {
                self.productionReportArray.append(productionReport)
            }

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    private func overallBreakDown() -> (Int, Int, Int, Int) {
        let bottlesRecycled = impactStats?.bottlesRecycled ?? 1
        let soapRecycled = impactStats?.soapRecycled ?? 1
        let paperRecycled = impactStats?.paperRecycled ?? 1
        let linensRecycled = impactStats?.linensRecycled ?? 1

        let total = bottlesRecycled + soapRecycled + paperRecycled + linensRecycled
        let soapPercentage = (Double(soapRecycled) / Double(total)) * 100
        let bottlesPercentage = (Double(bottlesRecycled) / Double(total)) * 100
        let paperPercentage = (Double(paperRecycled) / Double(total)) * 100
        let linensPercentage = (Double(linensRecycled) / Double(total)) * 100

        return (Int(soapPercentage), Int(linensPercentage), Int(bottlesPercentage), Int(paperPercentage))
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "HubAdminEditProdRepSegue":
            if let indexPath = tableView.indexPathForSelectedRow?.row {
                guard let editProdReportVC = segue.destination as? HubAdminEditProductionReportViewController else {return}

                editProdReportVC.productionReport = productionReportArray[indexPath]
            }
        case "HubAdminNewProdRepSegue":
            return

        case "SettingsSegue":
            return

        default: preconditionFailure("unexpected segue identifier")
        }
    }
}
// MARK: - UICollectionView Extension
extension HubAdminViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat

        width = collectionView.bounds.width - 40
        height = 200

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20.0, left: 20, bottom: 20, right: 20)
    }
}

extension HubAdminViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HubAdminImpactStatisticsOverallCell", for: indexPath) as? HubAdminCollectionViewCell else { return UICollectionViewCell() }

        cell.statsTuple = overallBreakDown()

        return cell
    }
}

// MARK: - UITableView Extension
extension HubAdminViewController: UITableViewDataSource,  UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productionReportArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubAdminProductionReportsCell", for: indexPath) as? HubAdminMainTableViewCell else {fatalError("oops")}
        let sortedArray = productionReportArray.sorted { $0.barsProduced < $1.barsProduced }
        let report = sortedArray[indexPath.row]
        cell.productionReports = report

        return cell
    }
}
