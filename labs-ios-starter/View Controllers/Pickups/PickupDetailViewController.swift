//
//  PickupDetailViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 9/23/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class PickupDetailViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var propertyNameLabel: UILabel!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    // MARK: - Properties
    var controller: BackendController?
    var pickup: Pickup? {
        didSet {
            setupViews()
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view1.layer.cornerRadius = 8
        view2.layer.cornerRadius = 8
        view3.layer.cornerRadius = 8
        view4.layer.cornerRadius = 8
        view5.layer.cornerRadius = 8
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        guard let pickup = pickup else { return }
//        let property = controller?.properties[pickup.propertyId]
//        propertyNameLabel.text = property?.name
        
        /*
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false

        for id in pickup.cartonsById {
            let carton = controller?.pickupCartons[id]

            let view = UIView()
            view.backgroundColor = UIColor(named: "Panel System Background")
            view.translatesAutoresizingMaskIntoConstraints = false
            view.heightAnchor.constraint(equalToConstant: 40).isActive = true

            let imageView = UIImageView()
            imageView.translatesAutoresizingMaskIntoConstraints = false
            if carton?.product = "" {
                imageView.image = UIImage(named: "")
            }
            imageView.contentMode = .scaleAspectFit

            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text =

        }
        */
    }
    
    private func updateViews() {
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: - IBActions


}
