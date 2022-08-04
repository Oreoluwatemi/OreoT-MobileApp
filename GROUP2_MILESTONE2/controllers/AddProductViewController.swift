//
//  AddProductViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-14.
//

import UIKit
import Firebase
import FirebaseStorage

class AddProductViewController: UIViewController, ImageProtocol {
   
    @IBOutlet weak var titleHeader: UILabel!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    @IBOutlet weak var itemImg: UIImageView!
    
    @IBOutlet weak var itemNamePhoto: UIButton!
    @IBOutlet weak var itemName: UITextField!
    
    @IBOutlet weak var expiryLabel: UILabel!
    
    @IBOutlet weak var expiry: UITextField!
    
    @IBOutlet weak var expiryDate: UIDatePicker!
    
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var addQuantity: UIButton!
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var removeQuantity: UIButton!
    
    var imgRef: StorageReference {
        return Storage.storage().reference().child(Auth.auth().currentUser!.uid)
    }
    let ref = Database.database().reference(withPath: "grocery-items")
    
    var items: [GroceryItem] = []
    
    
    let quantityBox = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyPortraitConstraint()
        
        // Do any additional setup after loading the view.
    }
    func applyPortraitConstraint(){
        titleHeader.translatesAutoresizingMaskIntoConstraints = false;
        titleHeader.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 3).isActive = true;
        titleHeader.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        titleHeader.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5.0).isActive = true
        titleHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false;
        itemNameLabel.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 5.0).isActive = true;
        itemNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        itemNameLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleHeader.topAnchor, multiplier: 10.0).isActive = true
        itemNameLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06).isActive = true
        
        itemImg.translatesAutoresizingMaskIntoConstraints = false;
        itemImg.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        itemImg.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true;
        itemImg.topAnchor.constraint(equalToSystemSpacingBelow: itemNameLabel.topAnchor, multiplier: 6.0).isActive = true
        itemImg.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16).isActive = true
        
        itemName.translatesAutoresizingMaskIntoConstraints = false;
        itemName.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        itemName.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        itemName.topAnchor.constraint(equalToSystemSpacingBelow: itemImg.topAnchor, multiplier: 19.0).isActive = true
        itemName.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        itemNamePhoto.translatesAutoresizingMaskIntoConstraints = false;
        itemNamePhoto.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        itemNamePhoto.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.65).isActive = true;
        itemNamePhoto.topAnchor.constraint(equalToSystemSpacingBelow: itemName.topAnchor, multiplier: 7.0).isActive = true
        itemNamePhoto.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        
        expiryLabel.translatesAutoresizingMaskIntoConstraints = false;
        expiryLabel.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 5.0).isActive = true;
        expiryLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        expiryLabel.topAnchor.constraint(equalToSystemSpacingBelow: itemNamePhoto.topAnchor, multiplier: 6.0).isActive = true
        expiryLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06).isActive = true
        
        expiry.translatesAutoresizingMaskIntoConstraints = false;
        expiry.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        expiry.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        expiry.topAnchor.constraint(equalToSystemSpacingBelow: expiryLabel.topAnchor, multiplier: 6.0).isActive = true
        expiry.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
        
        expiryDate.translatesAutoresizingMaskIntoConstraints = false;
        expiryDate.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        expiryDate.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true;
        expiryDate.topAnchor.constraint(equalToSystemSpacingBelow: expiry.topAnchor, multiplier: 5.0).isActive = true
        expiryDate.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.16).isActive = true
        
        
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false;
        quantityLabel.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 5.0).isActive = true;
        quantityLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        quantityLabel.topAnchor.constraint(equalToSystemSpacingBelow: expiryDate.topAnchor, multiplier: 16.0).isActive = true
        quantityLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06).isActive = true
        
        quantityBox.frame = CGRect(x: ((view.frame.width / 100 ) * 20), y: ((view.frame.height / 100) * 77), width: ((view.frame.width / 100 ) * 60), height: 70)
        view.addSubview(quantityBox)
        
        removeQuantity.translatesAutoresizingMaskIntoConstraints = false;
        removeQuantity.leftAnchor.constraint(equalToSystemSpacingAfter: quantityBox.leftAnchor, multiplier: 0.2).isActive = true;
        removeQuantity.widthAnchor.constraint(equalTo: quantityBox.widthAnchor, multiplier: 0.3).isActive = true;
        //removeQuantity.topAnchor.constraint(equalToSystemSpacingBelow: quantityBox.topAnchor, multiplier: 3.0).isActive = true
        removeQuantity.heightAnchor.constraint(equalTo: quantityBox.heightAnchor, multiplier: 0.8).isActive = true
        
        quantityBox.addSubview(removeQuantity)
        
        addQuantity.translatesAutoresizingMaskIntoConstraints = false;
        addQuantity.trailingAnchor.constraint(equalToSystemSpacingAfter: quantityBox.trailingAnchor, multiplier:-0.2).isActive = true;
        addQuantity.widthAnchor.constraint(equalTo: quantityBox.widthAnchor, multiplier: 0.3).isActive = true;
        //removeQuantity.topAnchor.constraint(equalToSystemSpacingBelow: quantityBox.topAnchor, multiplier: 3.0).isActive = true
        addQuantity.heightAnchor.constraint(equalTo: quantityBox.heightAnchor, multiplier: 0.8).isActive = true
        
        quantityBox.addSubview(addQuantity)
        
        quantity.translatesAutoresizingMaskIntoConstraints = false;
        quantity.centerXAnchor.constraint(equalToSystemSpacingAfter: quantityBox.centerXAnchor, multiplier:0.5).isActive = true;
        quantity.widthAnchor.constraint(equalTo: quantityBox.widthAnchor, multiplier: 0.3).isActive = true;
        //removeQuantity.topAnchor.constraint(equalToSystemSpacingBelow: quantityBox.topAnchor, multiplier: 3.0).isActive = true
        quantity.heightAnchor.constraint(equalTo: quantityBox.heightAnchor, multiplier: 0.8).isActive = true
        
        quantityBox.addSubview(quantity)
        
    }

    @IBAction func cancelAddProduct(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func takeImagePhoto(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "imageprocesscontroller") as! ImageViewController
        self.present(nextViewController, animated: true, completion: nil)
        nextViewController.delegate = self
    }
    
    @IBAction func takeExpiryPhoto(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ocrviewcontroller") as! OCRViewController
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func datePickerValue(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, YYYY"
        let strDate = dateFormatter.string(from: (sender as AnyObject).date)
        expiry.text = strDate
    }
    
    @IBAction func addBtn(_ sender: Any) {
        let quantityValue = Int(quantity.text!)! + 1
        
        quantity.text = "\(quantityValue)"
        
    }
    
    @IBAction func subtractBtn(_ sender: Any) {
        let quantityValue = Int(quantity.text!)
        
        if quantityValue == 0 {
            quantity.text = "\(0)"
        }
        else{
            quantity.text = "\(quantityValue! - 1)"
        }
    }
    
    func didImageVCFinishWithPhoto(img: UIImage, value: String) {
        print(value)
        itemName.text = value;
        itemImg.image = img
    }
    
    func didImageVCFinishWithCancel() {
        
    }
    
    
    @IBAction func saveItem(_ sender: Any) {
        guard let image = itemImg.image else {
            return
        }
        guard let name = itemName.text else {
            showErrorMsg(msg : "Grocery name")
            return
        }
        guard let expiry = expiry.text else {
            showErrorMsg(msg : "Expiry date")
            return
        }
        guard let quantity = quantity.text else {
            showErrorMsg(msg : "Quantity")
            return
        }
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return
        }
        
        let uploadRef = imgRef.child("\(imageData.description).png")
        if let uploadData = image.jpegData(compressionQuality: 0.5) {
            uploadRef.putData(uploadData, metadata: nil) { (metadata, error) in
                    if error != nil {
                        print("error")
                       
                    } else {

                        uploadRef.downloadURL(completion: { (url, error) in

                            print(url?.absoluteString)
                            let groceryItem = GroceryItem(name: name, imgurl: url!.absoluteString, expiry: expiry, quantity: quantity)
                            
                            let groceryItemRef = self.ref.child(Auth.auth().currentUser!.uid).child(name.lowercased())
                            
                            groceryItemRef.setValue(groceryItem.toAnyObject())
                            
                            let alert = UIAlertController(title: "Success", message: "Item Saved", preferredStyle: .alert)
                            
                            let action = UIAlertAction(title: "OK", style: .cancel,handler: {_ in
                                self.dismiss(animated: true)
                            })
                           
                            alert.addAction(action)
                            self.present(alert, animated: true, completion: nil)
                        })

                      //  completion((metadata?.downloadURL()?.absoluteString)!))
                        // your uploaded photo url.


                    }
                }
            }
        func showErrorMsg(msg : String){
            let alert = UIAlertController(title: "Error!!", message: "Missing \(msg)", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .cancel,handler: nil)
           
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
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
