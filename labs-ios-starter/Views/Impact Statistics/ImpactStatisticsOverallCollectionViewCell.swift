//
//  ImpactStatisticsOverallCollectionViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ImpactStatisticsOverallCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var soapView: UIView!
    @IBOutlet weak var paperView: UIView!
    @IBOutlet weak var linensView: UIView!
    @IBOutlet weak var bottlesView: UIView!
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
        setupViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        self.layer.cornerRadius = 8.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.backgroundColor = UIColor(named: "Panel System Background")?.cgColor
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.25
        self.layer.masksToBounds = false
        soapView.layer.cornerRadius = 5
        soapView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        paperView.layer.cornerRadius = 5
        paperView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
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
