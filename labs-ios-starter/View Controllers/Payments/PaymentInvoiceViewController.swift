//
//  PaymentInvoiceViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 9/18/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit
import PDFKit

class PaymentInvoiceViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var navBar: UINavigationBar!
    
    // MARK: - Properties
    var invoiceURL: String? {
        didSet {
            updateViews()
        }
    }
    
    private let pdfView: PDFView = {
        let pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        // pdfView.autoScales = true
        return pdfView
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        // For testing
        updateViews()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(pdfView)
        pdfView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    private func updateViews() {
        // guard let path = URL(string: invoiceURL) else { return }
        guard let path = URL(string: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf") else { return }

        if let document = PDFDocument(url: path) {
            pdfView.document = document
        }
    }
    
    // MARK: - IBActions
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
