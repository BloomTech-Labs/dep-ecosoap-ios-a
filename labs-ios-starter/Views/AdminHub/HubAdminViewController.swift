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
    private var selectedHub: Hub? {
        didSet {
            updateViewsImpactStats()
            updateViewsProducitonReports()
        }
    }

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

        updateViewsProducitonReports()
        updateViewsImpactStats()
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

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.

                guard let hubAdminEditProduction = segue.destination as? HubAdminEditProductionReportViewController else { return }

                if segue.identifier == "HubAdminEditProductionReport" {
                    print("HubAdminEditProductionReport called")
                } else if segue.identifier == "HubAdminNewProductionReport" {
                    print("HubAdminNewProductionReport")

                    guard let indexPath = tableView.indexPathForSelectedRow else { return }
                }
    }
}


extension HubAdminViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Don't know if this is correct 
        return 7
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImpactStatisticsOverallCell", for: indexPath) as? HubAdminCollectionViewCell else { return UICollectionViewCell() }
            cell.statsTuple = overallBreakDown()

            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImpactStatisticsIndividualCell", for: indexPath) as? ImpactStatisticsIndividualCollectionViewCell else { return UICollectionViewCell() }

            cell.indexPath = indexPath

            return cell
        }
    }
}

//extension HubAdminViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }




extension HubAdminViewController {

    var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    func prepare() {
        guard cache.isEmpty == true, let collectionView = collectionView else { return }

        var columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset: [CGFloat] = []
        for column in 0..<numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset: [CGFloat] = .init(repeating: 0, count: numberOfColumns)

        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            if indexPath.item == 4 {
                numberOfColumns = 1
                columnWidth = contentWidth / CGFloat(numberOfColumns)
            }
            let photoHeight = delegate?.collectionView(
                collectionView,
                heightForCellAtIndexPath: indexPath) ?? 180
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffset[column],
                               y: yOffset[column],
                               width: columnWidth,
                               height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)

            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)

            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height

            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }

    func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes: [UICollectionViewLayoutAttributes] = []

        // Loop through the cache and look for items in the rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }

    func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}




//extension ImpactStatisticsViewController: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width : CGFloat
//        let height : CGFloat
//
//        if indexPath.item == 0 {
//            width = collectionView.bounds.width - 40
//            height = 200
//        } else {
//            width = (collectionView.bounds.width / 2) - 25
//            height = 120
//        }
//        return CGSize(width: width, height: height)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 20.0, left: 20, bottom: 20, right: 20)
//    }
//
//}
