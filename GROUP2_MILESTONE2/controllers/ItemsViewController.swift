//
//  ItemsViewController.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-11.
//

import UIKit
import Firebase
import FirebaseStorage

class ItemsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var itemHeader: UILabel!
    let box = UIView()
    @IBOutlet weak var add: UIButton!
    @IBOutlet weak var myCollectionView: UICollectionView!
    //@IBOutlet weak var myCollectionView: ItemCollectionViewCell!
    var size = CGSize(width: 174, height: 202)
    let ref = Database.database().reference(withPath: "grocery-items").child(Auth.auth().currentUser!.uid)
    
    var items: [GroceryItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        myCollectionView?.delegate = self
        myCollectionView?.dataSource = self
        myCollectionView?.translatesAutoresizingMaskIntoConstraints = false;
        // Do any additional setup after loading the view.
        
        add.translatesAutoresizingMaskIntoConstraints = false;
        //add.
        box.frame = CGRect(x: ((view.frame.width / 100 ) * 80), y: ((view.frame.height / 100) * 80), width: 90, height: 90)
        box.layer.zPosition = 1
        view.addSubview(box);
        
        box.addSubview(add)
        //box.backgroundColor = UIColor(red: 178/255.0, green: 189/255.0, blue: 214/255.0, alpha: 1.0)
        add.layer.zPosition = 1
        add.layer.cornerRadius = 8
        ref.queryOrdered(byChild: "name").observe(.value, with: {snapshot in
            var newItems: [GroceryItem] = []
            for child in snapshot.children {
               print(child)
                //MARK: - Create snapshot which will be a child of all of our snapshots
                if let snapshot = child as? DataSnapshot,
                   //MARK: - Create grocery item from downloaded snapshot, add to list
                   let groceryItem = GroceryItem(snapshot: snapshot) {
                    newItems.append(groceryItem)
                }
            }
            //MARK: - Set items in table to newItems
            self.items = newItems
            self.myCollectionView.reloadData()
        })
    }
    
    @IBAction func addItem(_ sender: Any) {
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        
        cell.titleItem.text = items[indexPath.row].name
        cell.stock.text = items[indexPath.row].quantity
        cell.expiry.text = items[indexPath.row].expiry
        let url : String = items[indexPath.row].imgurl
        let q = DispatchQueue.init(label: "myQ")
        let iUrl = URL(string: url)
        
                q.async {
                    let data = try?  Data(contentsOf: iUrl!)
                    
                    DispatchQueue.main.async {
                        let imgUI = UIImage(data: data!)
                        cell.itemImage.image = imgUI
                           }
                }
            
        //cell.itemImage.image = UIImage(data: items[indexPath.row].imgurl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return size;
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "viewproduct"){
           let destinnation = segue.destination as! ProductViewController
            let cell = sender as! ItemCollectionViewCell
            let indexPath = myCollectionView.indexPath(for: cell)
            
            destinnation.itemImg = items[indexPath!.row].imgurl
            destinnation.name =  items[indexPath!.row].name
            destinnation.quant =  items[indexPath!.row].quantity
            destinnation.expiry =  items[indexPath!.row].expiry
            
            
        }
        else{
//            let destination = segue.destination as! SavedCountryViewController
//            let selectedCountry = tableView.indexPathForSelectedRow?.row
//            destination.cName = allCountries[selectedCountry!].name!
//            destination.cCapital = allCountries[selectedCountry!].capital!
//            destination.cPopulation = "\(allCountries[selectedCountry!].population)"
//            destination.cTimezone = allCountries[selectedCountry!].timzone!
//            destination.cCurrency = allCountries[selectedCountry!].currencies!
//            destination.cImage = UIImage(data: allCountries[selectedCountry!].flag!)
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
