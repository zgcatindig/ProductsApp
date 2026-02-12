//
//  ProductTableViewCell.swift
//  ProductsApp
//
//  Created by Aira Nicole Natividad on 2/12/26.
//

import UIKit

protocol ProductTableViewDelegate: AnyObject {
    func showAddToCartSuccess(productName: String)
    
}

class ProductTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    // MARK: Properties
    weak var delegate: ProductTableViewDelegate?
    
    var productNameText: String = "" {
        didSet {
            productNameLabel.text = productNameText
        }
    }
    var prodcutDescriptionText: String = "" {
        didSet {
            productDescriptionLabel.text = prodcutDescriptionText
        }
    }
    
    // MARK: Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Functions
    func bind(productName: String, productDescription: String) {
        productNameText = productName
        prodcutDescriptionText = productDescription
    }

    @IBAction func didTapButton(_ sender: Any) {
        delegate?.showAddToCartSuccess(productName: productNameText)
    }
}
