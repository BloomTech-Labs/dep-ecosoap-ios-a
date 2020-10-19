//
//  HubAdminPickupDetailViewController.swift
//  labs-ios-starter
//
//  Created by Enzo Jimenez-Soto on 10/15/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class HubAdminPickupDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var locationEntry: UILabel!
    @IBOutlet var dateEntry: UILabel!
    @IBOutlet var timeEntry: UILabel!
    @IBOutlet var driverEntry: UILabel!
    @IBOutlet var soapEntry: UILabel!
    @IBOutlet var paperEnttry: UILabel!
    @IBOutlet var linensEntry: UILabel!
    @IBOutlet var bottlesEntry: UILabel!
    @IBOutlet var notesEntry: UITextView!

    // MARK: - Properties
    var pickup: Pickup? {
        didSet {
            updateViews()
        }
    }
    var backendController: BackendController!


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Methods
    private func updateViews() {
        guard isViewLoaded else { return }
        if let pickup = pickup {
            locationEntry.text = pickup.confirmationCode
            timeEntry.text = pickup.status
            notesEntry.text = pickup.notes
            driverEntry.text = pickup.driver
        }
    }
}
