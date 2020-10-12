//
//  HubAdminCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Harmony Radley on 10/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class HubAdminCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet var soapView: UIView!
    @IBOutlet var linensView: UIView!
    @IBOutlet var bottlesView: UIView!
    @IBOutlet var paperView: UIView!
    @IBOutlet weak var soapPercentageLabel: UILabel!
    @IBOutlet weak var linensPercentageLabel: UILabel!
    @IBOutlet weak var bottlesPercentageLabel: UILabel!
    @IBOutlet weak var paperPercentageLabel: UILabel!

    // MARK: - Properties
    var statsTuple: (Int, Int, Int, Int)? {
        didSet {
            updateViews()
        }
    }


    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    private func updateViews() {
        guard let statsTuple = statsTuple else { return }
        soapPercentageLabel.text = "\(statsTuple.0)%"
        linensPercentageLabel.text = "\(statsTuple.1)%"
        bottlesPercentageLabel.text = "\(statsTuple.2)%"
        paperPercentageLabel.text = "\(statsTuple.3)%"

        let viewWidth = soapView.bounds.width + paperView.bounds.width + linensView.bounds.width + bottlesView.bounds.width
        print(viewWidth)
        var soap = Double(statsTuple.0)
        var linens = Double(statsTuple.1)
        var bottles = Double(statsTuple.2)
        var paper = Double(statsTuple.3)

        soap = soap / 100 * Double(viewWidth)
        linens = linens / 100 * Double(viewWidth)
        bottles = bottles / 100 * Double(viewWidth)
        paper = paper / 100 * Double(viewWidth)

        soapView.widthAnchor.constraint(equalToConstant: CGFloat(soap)).isActive = true
        linensView.widthAnchor.constraint(equalToConstant: CGFloat(linens)).isActive = true
        bottlesView.widthAnchor.constraint(equalToConstant: CGFloat(bottles)).isActive = true
        paperView.widthAnchor.constraint(equalToConstant: CGFloat(paper)).isActive = true


    }
}
