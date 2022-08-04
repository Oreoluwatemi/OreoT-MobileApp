//
//  ImageViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-28.
//

import UIKit
import CoreML
import Vision
import SwiftUI

protocol ImageProtocol{
    func didImageVCFinishWithPhoto(img: UIImage, value: String);
    
    func didImageVCFinishWithCancel();
}

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var createImgBtn: UIButton!
    
    
    @IBOutlet weak var done: UIBarButtonItem!

    @IBOutlet weak var cancel: UIBarButtonItem!
    
    @IBOutlet weak var imageItem: UILabel!
    @IBOutlet weak var img: UIImageView!
    let imagePicker = UIImagePickerController()
    var delegate: ImageProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        guard let val = imageItem.text else{
            print("no"); return}
        delegate?.didImageVCFinishWithPhoto(img: img.image!, value: val)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func takeImage(_ sender: Any) {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                        self.goToCamera()
                }))

                alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
                            self.goToGallery()
                }))
                alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))

                self.present(alert, animated: true, completion: nil)
    }
    
    func goToCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
                let cameraImg = UIImagePickerController()
            cameraImg.delegate = self
            cameraImg.sourceType = UIImagePickerController.SourceType.camera
            cameraImg.allowsEditing = false
                self.present(cameraImg, animated: true, completion: nil)
        }else{
            let alert  = UIAlertController(title: "Camera", message: "You don't have camera on your phone", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func goToGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let galleryImg = UIImagePickerController()
            galleryImg.delegate = self
            galleryImg.allowsEditing = true
            galleryImg.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(galleryImg, animated: true, completion: nil)
        
        }else{
            let alert  = UIAlertController(title: "Gallery", message: "You don't have gellery on your phone.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            if let i = info[.originalImage] as? UIImage{
               img.image = i
            }
        
        if let ciImage = CIImage(image: img.image!) {
                    processImage(ciImage: ciImage)
                }else {
                    print("CIImage convert error")
                }
            dismiss(animated: true, completion: nil)
        
        
        }
        
    func processImage(ciImage: CIImage){
            
            do{
                let model = try VNCoreMLModel(for: MobileNetV2().model)

                let request = VNCoreMLRequest(model: model) { (request, error) in
                    self.processClassifications(for: request, error: error)
                }

                DispatchQueue.global(qos: .userInitiated).async {
                    let handler = VNImageRequestHandler(ciImage: ciImage, orientation: .up)
                    do {
                        try handler.perform([request])
                    } catch {

                        print("Failed to perform classification.\n\(error.localizedDescription)")
                    }
                }

            }catch {
                print(error.localizedDescription)
            }

        }

        func processClassifications(for request: VNRequest, error: Error?) {
            DispatchQueue.main.async {
                guard let results = request.results else {
                    print("Unable to classify image.\n\(error!.localizedDescription)")
                    let alert = UIAlertController(title: "Unable to get grocery item name", message: "Enter Item name below", preferredStyle: .alert)
                    
                    //MARK: - Add a save button to alert
                    let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
                        guard let textField = alert.textFields?.first,
                              let text = textField.text else { return }
                        self.imageItem.text = text
                    }
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    
                    //MARK: - Build alert
                    alert.addTextField()
                    alert.addAction(saveAction)
                    alert.addAction(cancelAction)
                    
                    self.present(alert, animated: true)
                    return
                }

                let classifications = results as! [VNClassificationObservation]
                let item = classifications.first?.identifier.uppercased()
                self.imageItem.text = classifications.first?.identifier
                let alert = UIAlertController(title: "Your grocery item is \(item!)", message: "Not correct? Enter Item name below", preferredStyle: .alert)
                
                //MARK: - Add a save button to alert
                let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
                    guard let textField = alert.textFields?.first,
                          let text = textField.text else { return }
                    self.imageItem.text = text
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
                //MARK: - Build alert
                alert.addTextField()
                alert.addAction(saveAction)
                alert.addAction(cancelAction)
                
                self.present(alert, animated: true)
                
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
