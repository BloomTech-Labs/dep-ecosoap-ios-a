//
//  MakePaymentViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 9/18/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class MakePaymentViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var amountDueLabel: UILabel!
    @IBOutlet weak var invoiceStartDateLabel: UILabel!
    @IBOutlet weak var invoiceEndDateLabel: UILabel!
    @IBOutlet weak var invoiceDueDateLabel: UILabel!
    @IBOutlet weak var invoiceCodeLabel: UILabel!
    @IBOutlet weak var paymentBackgroundView: UIView!
    @IBOutlet weak var viewInvoiceButton: UIButton!
    @IBOutlet weak var makePaymentButton: UIButton!
    
    // MARK: - Properties
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Private Methods
    private func updateViews() {
        paymentBackgroundView.layer.cornerRadius = 8
        viewInvoiceButton.layer.cornerRadius = 8
        makePaymentButton.layer.cornerRadius = 8
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: - IBActions

}
