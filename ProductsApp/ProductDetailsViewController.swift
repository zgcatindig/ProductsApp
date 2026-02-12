//
//  ProductDetailsViewController.swift
//  ProductsApp
//
//  Created by Aira Nicole Natividad on 2/12/26.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var shippingInformationLabel: UILabel!
    
    var priceText: String = ""
    var categoryText: String = ""
    var shippingInformationText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceLabel.text = priceText
        categoryLabel.text = categoryText
        shippingInformationLabel.text = shippingInformationText
        // Do any additional setup after loading the view.
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
