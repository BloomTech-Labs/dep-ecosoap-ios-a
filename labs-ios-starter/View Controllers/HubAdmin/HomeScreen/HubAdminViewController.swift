//
//  HubAdminViewController.swift
//  labs-ios-starter
//
//  Created by Harmony Radley on 10/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

//protocol DashboardLayoutDelegate: AnyObject {
//    func collectionView(_ collectionView: UICollectionView, heightForCellAtIndexPath indexPath: IndexPath) -> CGFloat
//}

class HubAdminViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!

    // MARK: - Properties
    private let controller = BackendController.shared
    
    private var hubs: [Hub] = []
    private var selectedHub: Hub?
    
   
    
    
    var productionReportArray: [HubDailyProduction] = [HubDailyProduction(dictionary: ["id" : "5",
                                                                               "barsProduced": 10,
                                                                               "soapmakersWorked": 3,
                                                                               "soapmakerHours": 17,
                                                                               "date":  "2020-10-15"
    ])!,
    HubDailyProduction(dictionary: ["id" : "5",
                                                                               "barsProduced": 10,
                                                                               "soapmakersWorked": 3,
                                                                               "soapmakerHours": 17,
                                                                               "date":  "2020-10-10"
    ])!]



    // MARK: - Properties
    weak var delegate: DashboardLayoutDelegate?

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
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAll()
      
        tableView.delegate = self

        guard let userhub = controller.loggedInUser.hub else {return}
        controller.hubs[userhub.id] = userhub

        updateViewsProductionReports()

        updateViewsImpactStats()
    }

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
            print("\(self.controller.properties)")
            print("\(self.controller.pickups)")
            print("\(self.controller.payments)")
            print("\(self.controller.productionReports)")
            print("\(self.controller.hubs)")
            print("\(self.controller.pickupCartons)")
            print("\(self.controller.hospitalityContracts)")
        }
    }
    

    private func updateViewsImpactStats() {
        guard let selectedHub = controller.loggedInUser.hub?.id else { return }
        controller.impactStatsByHubId(id: selectedHub) { (error) in
            if let error = error {
                print("Error fetching stats \(error)")
                
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    

    private func updateViewsProductionReports() {
        guard let selectedHub = controller.loggedInUser.hub else { return }
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
    // MARK: - Navigation

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

    // MARK: UICollectionViewDataSource
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

extension HubAdminViewController: UITableViewDataSource,  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productionReportArray.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HubAdminProductionReportsCell", for: indexPath) as? HubAdminMainTableViewCell else {fatalError("oops")}
        let report = productionReportArray[indexPath.row]
        cell.productionReports = report
     
        return cell
    }

}
