//
//  ProductViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-14.
//

import UIKit
import Firebase
import FirebaseStorage
class ProductViewController: UIViewController {

    
    @IBOutlet weak var titleHeader: UILabel!
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var addQuantity: UIButton!
    
    @IBOutlet weak var stock: UILabel!
    
    @IBOutlet weak var expiryDate: UILabel!
    
    @IBOutlet weak var quantity: UILabel!
    
    @IBOutlet weak var usedBtn: UIButton!
    
    @IBOutlet weak var removeQuantity: UIButton!
    
    let quantityBox = UIView()
    
    var itemImg : String = ""
    var name : String = ""
    var quant : String = ""
    var expiry : String = ""
    
    let ref = Database.database().reference(withPath: "grocery-items").child(Auth.auth().currentUser!.uid)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        applyPortraitConstraint()
        // Do any additional setup after loading the view.
        
        let q = DispatchQueue.init(label: "myQ")
        let iUrl = URL(string: itemImg)
        
                q.async {
                    let data = try?  Data(contentsOf: iUrl!)
                    
                    DispatchQueue.main.async { [self] in
                        let imgUI = UIImage(data: data!)
                        img.image = imgUI
                           }
                }
        expiryDate.text = expiry
        quantity.text = quant
        titleHeader.text = name
            
    }
    func applyPortraitConstraint(){
        titleHeader.translatesAutoresizingMaskIntoConstraints = false;
        titleHeader.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 3).isActive = true;
        titleHeader.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        titleHeader.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 5.0).isActive = true
        titleHeader.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true
        
        img.image = UIImage(named: "signin-header")
        img.translatesAutoresizingMaskIntoConstraints = false;
        img.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        img.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true;
        img.topAnchor.constraint(equalToSystemSpacingBelow: titleHeader.topAnchor, multiplier: 8.0).isActive = true
        img.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        
        expiryDate.translatesAutoresizingMaskIntoConstraints = false;
        expiryDate.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        expiryDate.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true;
        expiryDate.topAnchor.constraint(equalToSystemSpacingBelow: img.topAnchor, multiplier: 25.0).isActive = true
        expiryDate.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        
        stock.translatesAutoresizingMaskIntoConstraints = false;
        stock.leftAnchor.constraint(equalToSystemSpacingAfter: view.leftAnchor, multiplier: 3.0).isActive = true;
        stock.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true;
        stock.topAnchor.constraint(equalToSystemSpacingBelow: expiryDate.topAnchor, multiplier: 8.0).isActive = true
        stock.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
        
        quantityBox.frame = CGRect(x: ((view.frame.width / 100 ) * 20), y: ((view.frame.height / 100) * 55), width: ((view.frame.width / 100 ) * 60), height: 70)
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
        
        usedBtn.translatesAutoresizingMaskIntoConstraints = false;
        usedBtn.centerXAnchor.constraint(equalToSystemSpacingAfter: view.centerXAnchor, multiplier: 0.5).isActive = true;
        usedBtn.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true;
        usedBtn.topAnchor.constraint(equalToSystemSpacingBelow: quantityBox.topAnchor, multiplier: 20.0).isActive = true
        usedBtn.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.08).isActive = true
    }

    @IBAction func addItem(_ sender: Any) {
        let quantityValue = Int(quantity.text!)! + 1
        
        quantity.text = "\(quantityValue)"
    }
    
    
    @IBAction func removeQuantity(_ sender: Any) {
        let quantityValue = Int(quantity.text!)
        
        if quantityValue == 0 {
            quantity.text = "\(0)"
        }
        else{
            quantity.text = "\(quantityValue! - 1)"
        }
    }
    @IBAction func cancelProduct(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func deleteItem(_ sender: Any) {
        
        let alert = UIAlertController(title: "Delete", message: "Are you sure you want to remove product", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default,handler: {_ in
            self.ref.child(self.titleHeader.text!).removeValue()
            self.dismiss(animated: true)
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
       
        alert.addAction(action)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
      
        
        
    }
    
    
    @IBAction func done(_ sender: Any) {
        self.ref.child(self.titleHeader.text!).updateChildValues(["quantity" : quantity.text])
        
        self.dismiss(animated: true)
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
