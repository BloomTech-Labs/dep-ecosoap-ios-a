//
//  HubAdminNewProductionReportViewController.swift
//  labs-ios-starter
//
//  Created by Enzo Jimenez-Soto on 10/8/20.
//  Copyright © 2020 Spencer Curtis. All rights reserved.
//

import UIKit

class HubAdminNewProductionReportViewController: UIViewController {
    
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var addAPhotoLabel: UILabel!
    @IBOutlet weak var uploadThisImageButton: UIButton!
    @IBOutlet weak var removeThisImageButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var barsProducedTextFIeld: UITextField!
    @IBOutlet weak var soapWorkersTextField: UITextField!
    @IBOutlet weak var hoursWorkedTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var uploadProgressBar: CustomProgressView!
    
    @IBOutlet weak var uploadProgressPercentLabel: UILabel!
    
    public var imagePicker: UIImagePickerController?  // save reference to it
    
    private let controller = BackendController.shared
    
    var imageURL: String? // this contains the url for the image that was uploaded
    
    var placeHolderURL: String = "https://www.fillmurray.com/1000/768"
   
    var keyboardHeight: CGFloat?
    
    var keyboardIsOpen = true
    
    var productionReport: CreateProductionReportInput?
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d yyyy"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    deinit {
        // stop listening to keyboard events
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    /// sets up the view to their initial state
    private func setupInitialViews() {
        deactivateButton(uploadThisImageButton)
        deactivateButton(removeThisImageButton)
        uploadProgressBar.alpha = 0
        uploadProgressPercentLabel.alpha = 0
        
        
        func integer(from textField: UITextField) -> Int {
            guard let text = textField.text, let number = Int(text) else {
                return 0
            }
            return number
        }
        
  
       
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
 
    @IBAction func addPhotoButtonPressed(_ sender: UIButton) {
        presentPhotoLibraryActionSheet()
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        guard let soapWorked = Int(soapWorkersTextField.text ?? "0"),
              let barsProduced = Int(barsProducedTextFIeld.text ?? "0"),
              let soapHours = Int(hoursWorkedTextField.text ?? "0")
              
              else { return }
   
        guard let hubId = controller.loggedInUser.hub?.id else {return}
        
        productionReport = CreateProductionReportInput(hubId: hubId, date: Date(), barsProduced: barsProduced, soapmakersWorked: soapWorked, soapmakersHours: soapHours, soapPhotos: [placeHolderURL])
        
       
        
        controller.createProductionReport(input: productionReport! ) { (error) in
            
            if let error = error {
                print("Error creating Production Report: \(error)")
                return
            }
            
            

        }
        self.dismiss(animated: true, completion: nil)
       
    }
    private func presentPhotoLibraryActionSheet() {
        // make sure imagePicker is nill
        if self.imagePicker != nil {
            self.imagePicker?.delegate = nil
            self.imagePicker = nil
        }
        // init image picker
        self.imagePicker = UIImagePickerController()
        // action sheet
        let actionSheet = UIAlertController(title: "Select Source Type", message: nil, preferredStyle: .actionSheet)
        // imagePickerActions
        if UIImagePickerController.isSourceTypeAvailable(.camera) { // need to have real device
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                self.presentImagePicker(controller: self.imagePicker!, sourceType: .camera)
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
                self.presentImagePicker(controller: self.imagePicker!, sourceType: .photoLibrary)
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            actionSheet.addAction(UIAlertAction(title: "Saved Albums", style: .default, handler: { _ in
                self.presentImagePicker(controller: self.imagePicker!, sourceType: .savedPhotosAlbum)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        // present action sheet
        self.present(actionSheet, animated: true)
    }
    
    func presentImagePicker(controller: UIImagePickerController, sourceType: UIImagePickerController.SourceType) {
        controller.delegate = self
        controller.sourceType = sourceType
        self.present(controller, animated: true)
    }
    
    
    @IBAction func uploadThisImageButtonPressed(_ sender: UIButton) {
        deactivateButton(removeThisImageButton)
        deactivateButton(uploadThisImageButton)
        uploadImage()
    }
    
    
    /// moves the keyboard down
    @objc override func dismissKeyboard() {
        keyboardIsOpen = false
        view.endEditing(true)
        view.frame.origin.y = 0
        DispatchQueue.main.async {
            self.keyboardIsOpen = true
        }
    }
    
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
    
    /// uploads an image and returns a URL of it's location in the imageURL property in the CreatePlantVC
    private func uploadImage(){
        
        
    
       
    }
    
    /// resets the whole uploading an image process
    @IBAction func removeThisImageButtonPressed(_ sender: UIButton) {
        selectedImage.image = nil // reset image
        activateButton(addPhotoButton)
        addAPhotoLabel.alpha = 1
        deactivateButton(removeThisImageButton)
        deactivateButton(uploadThisImageButton)
    }
    
    
    /// restores the buttons to visibility and re-enables them to be pressed again
    func activateButton(_ button: UIButton) {
        button.isEnabled = true
        button.alpha = 1
    }
    
    /// hides the buttons and makes them so they can't be pressed
    func deactivateButton(_ button: UIButton) {
        button.isEnabled = false
        button.alpha = 0
    }
    
    func createObservers() {
        // listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }


    /// moves the keyboard up
    @objc func keyboardWillChange(notification: Notification) {
        print("Keyboard will show: \(notification.name.rawValue)")
        if keyboardIsOpen == true {
            view.frame.origin.y = -(self.keyboardHeight ?? 100)
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            self.keyboardHeight = keyboardRectangle.height
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HubAdminNewProductionReportViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return self.imagePickerControllerDidCancel(picker)
        }
        self.selectedImage.image = image
        picker.dismiss(animated: true) {
            // clean up
            picker.delegate = nil
            self.imagePicker = nil
        }
        deactivateButton(addPhotoButton)
        addAPhotoLabel.alpha = 0
        activateButton(uploadThisImageButton)
        activateButton(removeThisImageButton)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true) {
            // clean up
            picker.delegate = nil
            self.imagePicker = nil
        }
    }
    
}


/// Used to set a custom height for UIProgressView
public class CustomProgressView: UIProgressView { // FIXME: - doesn't work
    var height: CGFloat = 4.0
    public override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: 30) // We can set the required height
    }
}
