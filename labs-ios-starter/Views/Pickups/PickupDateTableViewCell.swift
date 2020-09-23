//
//  PickupDateTableViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

protocol UserAddedDateAndTimeDelegate: AnyObject {
    func userAddedDateAndTime(date: Date)
}

class PickupDateTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var dateTextField: UITextField!
    
    // MARK: - Properties
    private let picker = UIDatePicker()
    weak var delegate: UserAddedDateAndTimeDelegate?
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        dateTextField.inputView = picker
        picker.minimumDate = Date()
        picker.addTarget(self, action: #selector(selected), for: .valueChanged)
    }
    
    @objc func selected() {
        let formatter = DateFormatter()
        formatter.calendar = picker.calendar
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let dateString = formatter.string(from: picker.date)
        dateTextField.text = dateString
        delegate?.userAddedDateAndTime(date: picker.date)
    }
}
