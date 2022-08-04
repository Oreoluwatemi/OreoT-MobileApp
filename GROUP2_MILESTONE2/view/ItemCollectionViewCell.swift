//
//  ItemCollectionViewCell.swift
//  GROUP2_MILESTONE2
//
//  Created by Oreoluwa Lawal on 2022-07-11.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleItem: UILabel!
    
    @IBOutlet weak var itemImage: UIImageView!
    
    @IBOutlet weak var stock: UILabel!
    
    @IBOutlet weak var expiry: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = UIColor(red: 255/255.0, green: 206/255.0, blue: 80/255.0, alpha: 1.0)
      
        
    }

}
