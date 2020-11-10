//
//  ProductionReportDetailVC.swift
//  labs-ios-starter
//
//  Created by Brian Vilchez on 11/9/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ProductionReportDetailVC: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var barsMadeLabel: UILabel!
    @IBOutlet weak var soapsMadeLabel: UILabel!
    @IBOutlet weak var hoursWorkedLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imagePageControl: UIPageControl!
    @IBOutlet weak var deleteButtonBorderView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        
    }
    
}
