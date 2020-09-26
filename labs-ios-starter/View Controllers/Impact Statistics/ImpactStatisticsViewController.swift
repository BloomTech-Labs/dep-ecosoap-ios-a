//
//  ImpactStatisticsViewController.swift
//  labs-ios-starter
//
//  Created by Wyatt Harrell on 8/13/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class ImpactStatisticsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var propertyTextField: UITextField!
    
    // MARK: - Properties
    private let propertyPicker = UIPickerView()
    private let controller = BackendController.shared
    
    private var propertyPickerData: [[String]]?
    private var properties: [Property] = []
    private var selectedProperty: Property? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        grabProperties()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        propertyPicker.delegate = self
        propertyPicker.dataSource = self
        
        propertyTextField.layer.cornerRadius = 8
        propertyTextField.setupTextField()
        propertyTextField.inputView = propertyPicker
        self.hideKeyboardWhenViewTapped()
    }
    
    private func grabProperties() {
        var propertyNames: [String] = []
        for property in controller.properties.values {
            propertyNames.append(property.name)
            properties.append(property)
        }
        let data: [[String]] = [propertyNames]
        propertyPickerData = data
        
        guard propertyNames.count > 0, properties.count > 0 else { return }
        propertyTextField.text = propertyNames[0]
        selectedProperty = properties[0]
    }
    
    private func updateViews() {
        guard let selectedProperty = selectedProperty else { return }
        controller.impactStatsByPropertyId(id: selectedProperty.id) { (error) in
            if let error = error {
                print("Error fetching stats \(error)")
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func overallBreakDown() -> (Int, Int, Int, Int) {
        guard let selectedProperty = selectedProperty else { return (0,0,0,0) }
        let bottlesRecycled = selectedProperty.impact?.bottlesRecycled ?? 0
        let soapRecycled = selectedProperty.impact?.soapRecycled ?? 0
        let paperRecycled = selectedProperty.impact?.paperRecycled ?? 0
        let linensRecycled = selectedProperty.impact?.linensRecycled ?? 0
        
        let total = bottlesRecycled + soapRecycled + paperRecycled + linensRecycled
        let soapPercentage = (Double(soapRecycled) / Double(total)) * 100
        let bottlesPercentage = (Double(bottlesRecycled) / Double(total)) * 100
        let paperPercentage = (Double(paperRecycled) / Double(total)) * 100
        let linensPercentage = (Double(linensRecycled) / Double(total)) * 100
        return (Int(soapPercentage), Int(linensPercentage), Int(bottlesPercentage), Int(paperPercentage))
    }
}

extension ImpactStatisticsViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImpactStatisticsOverallCell", for: indexPath) as? ImpactStatisticsOverallCollectionViewCell else { return UICollectionViewCell() }
            
            cell.statsTuple = overallBreakDown()
            
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImpactStatisticsIndividualCell", for: indexPath) as? ImpactStatisticsIndividualCollectionViewCell else { return UICollectionViewCell() }
            
            cell.indexPath = indexPath
            cell.property = selectedProperty
            
            return cell
        }
    }
}

extension ImpactStatisticsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat
        let height : CGFloat
        
        if indexPath.item == 0 {
            width = collectionView.bounds.width - 40
            height = 200
        } else {
            width = (collectionView.bounds.width / 2) - 25
            height = 120 
        }
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20.0, left: 20, bottom: 20, right: 20)
    }

}

extension ImpactStatisticsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        guard let propertyPickerData = propertyPickerData else { return 0 }
        return propertyPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let propertyPickerData = propertyPickerData else { return 0 }
        return propertyPickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let propertyPickerData = propertyPickerData else { return nil }

        let componentArray = propertyPickerData[component]
        let title = componentArray[row]
        
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.bounds.width - 40 
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedProperty = properties[row]
    }
}

