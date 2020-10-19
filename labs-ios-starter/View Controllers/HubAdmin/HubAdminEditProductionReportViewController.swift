//
//  HubAdminEditProductionReportViewController.swift
//  labs-ios-starter
//
//  Created by Enzo Jimenez-Soto on 10/8/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
import Foundation

class HubAdminEditProductionReportViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var barsProducedLabel: UILabel!
    @IBOutlet weak var soapMakersWorkedLabel: UILabel!
    @IBOutlet weak var hoursWorkedLabel: UILabel!
    @IBOutlet weak var editButtonPressed: UIButton!

    //MARK: - Properties
    var productionReport: HubDailyProduction?
    var hubAdminController: HubAdminViewController?
    var imageURL: URL?
    var urlString: String?

    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    //MARK: - Methods

    func updateViews() {
        guard let productionReport = productionReport else { return }
        
        barsProducedLabel.text = String(productionReport.barsProduced)
        soapMakersWorkedLabel.text = String(productionReport.soapmakersWorked)
        hoursWorkedLabel.text = String(productionReport.soapmakerHours)
        urlString = productionReport.soapPhotos[0]

        guard let urlString = urlString else { return }

        if urlString.contains("http:"){
            imageURL = URL(string: "https://www.fillmurray.com/1000/768")
        } else {
            imageURL = URL(string: urlString)
        }

        guard let imageURL = imageURL else { return }

        selectedImage.load(url: imageURL)
    }
    
    //MARK: - Actions
    @IBAction func editButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        
    }
}

    //MARK: - Extensions
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
