//
//  ViewController.swift
//  ProductsApp
//
//  Created by Aira Nicole Natividad on 2/12/26.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
//    var productModel = []
    
    // MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        fetch()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetails" {
            let destinationVC = segue.destination as? ProductDetailsViewController
            destinationVC?.priceText = "Price: 100"
            destinationVC?.categoryText = "Phones"
            destinationVC?.shippingInformationText = "Ships in 3 days"
        }
    }
    
    // MARK: Functions
    func fetch() {
        let urlString = "https://dummyjson.com/products"
        let url = URL(string: urlString)
        guard let unwrappedURL = url else { return }
        let urlRequest = URLRequest(url: unwrappedURL)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                print("ERROR: \(err)")
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let productModel = try JSONDecoder().decode(Products.self, from: data)
                print(productModel)
            } catch {
                print("Error decoding \(error)")
            }
        }.resume()
        
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return productModel.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductTableViewCell
//        cell?.bind(productName: productModel[indexPath.row].productName, productDescription: productModel[indexPath.row].productDescription)
//        return cell ?? UITableViewCell()
        return UITableViewCell()
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showProductDetails", sender: nil)
    }
}
