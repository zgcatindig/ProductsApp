//
//  ViewController.swift
//  ProductsApp
//
//  Created by Aira Nicole Natividad on 2/12/26.
//

import UIKit

struct Products {
    let productName: String
    let productDescription: String
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var productModel = [
        Products(productName: "Apple Macbook Pro", productDescription: "Latest generation model"),
        Products(productName: "Apple iPhone", productDescription: "Latest generation model"),
        Products(productName: "Samsung Galaxy", productDescription: "Latest generation model"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
    }
}

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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(productModel[indexPath.row].productName)
    }
}
