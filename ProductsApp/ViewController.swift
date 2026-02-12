//
//  ViewController.swift
//  ProductsApp
//
//  Created by Angelo John Cruz on 2/12/26.
//

import UIKit

struct Products {
    let productName: String
    let productDescription: String
}

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var productModel = [
        Products(productName: "Apple Macbook Pro", productDescription: "Latest generation model"),
        Products(productName: "Apple iPhone", productDescription: "Latest generation model"),
        Products(productName: "Samsung Galaxy", productDescription: "Latest generation model")
    ]
    
    // MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetails" {
            let destinationVC = segue.destination as? ProductDetailsViewController
        }
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductTableViewCell
        cell?.bind(productName: productModel[indexPath.row].productName, productDescription: productModel[indexPath.row].productDescription)
        return cell ?? UITableViewCell()
    }
}

// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProductDetails", sender: nil)
    }
}
