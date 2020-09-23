//
//  PickupNotesTableViewCell.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/12/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

protocol UserAddedNotesDelegate: AnyObject {
    func userAddedNotes(notes: String)
}

class PickupNotesTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var notesTextField: UITextView!
    
    // MARK: - Properties
    weak var delegate: UserAddedNotesDelegate?

    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        notesTextField.delegate = self
    }
}

extension PickupNotesTableViewCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Add an optional note for pickup instructions" {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let notes = textView.text else { return }
        delegate?.userAddedNotes(notes: notes)
    }
}
