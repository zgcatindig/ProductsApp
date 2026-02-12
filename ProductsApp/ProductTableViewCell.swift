//
//  ProductTableViewCell.swift
//  ProductsApp
//
//  Created by Angelo John Cruz on 2/12/26.
//

import UIKit

protocol ProductTableViewCellDelegate: AnyObject {
    func showAddToCartSuccess(productName: String)
    
}

class ProductTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var productDescriptionLabel: UILabel!
    
    // MARK: Properties
    weak var delegate: ProductTableViewCellDelegate?
    
    private var productNameText: String = "" {
        didSet {
            productNameLabel.text = productNameText
        }
    }
    private var productDescriptionText: String = "" {
        didSet {
            productDescriptionLabel.text = productDescriptionText
        }
    }
    
    // MARK: Initializations
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Functions
    func bind(productName: String, productDescription: String) {
        productNameText = productName
        productDescriptionText = productDescription
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        delegate?.showAddToCartSuccess(productName: productNameLabel.text ?? "")
        
    }
    
}
