//
//  ProductDetailsViewController.swift
//  ProductsApp
//
//  Created by Angelo John Cruz on 2/12/26.
//

import UIKit
import Kingfisher

class ProductDetailsViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var shippingInformationLabel: UILabel!
    
    var productDetails: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imageView.kf.setImage(with: URL(string: productDetails?.images.first ?? ""))
//        print(productDetails)
        priceLabel.text = "Price: \(productDetails?.price ?? 0)"
        categoryLabel.text = "Category: \(productDetails?.category.rawValue ?? "")"
        shippingInformationLabel.text = "Shipping information: \(productDetails?.shippingInformation ?? "")"
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
