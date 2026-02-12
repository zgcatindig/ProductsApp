//
//  ProductTableViewCell.swift
//  ProductsApp
//
//  Created by Angelo John Cruz on 2/12/26.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    // MARK: Initializations
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Functions
    func bind(productName: String, productDescription: String) {
        productNameLabel.text = productName
        productDescriptionLabel.text = productDescription
    }
}
