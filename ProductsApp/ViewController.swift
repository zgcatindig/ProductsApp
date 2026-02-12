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
    var productModel: [Product] = []
    
    // MARK: Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        let urlString = "https://dummyjson.com/products"
        fetchData(from: urlString) { [weak self] result in
            switch result {
            case .success(let products):
                self?.productModel = products
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            case .failure(let err):
                print("ERROR \(err)")
            }
        }
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProductDetails" {
            let destinationVC = segue.destination as? ProductDetailsViewController
            destinationVC?.productDetails = sender as? Product
        }
    }
    
    // MARK: Functions
    func fetchData(from urlString: String, completionHandler: @escaping (Result<[Product], Error>) -> Void) {
        
        let url = URL(string: urlString)
        guard let unwrappedURL = url else { return }
        let urlRequest = URLRequest(url: unwrappedURL)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                completionHandler(.failure(err))
            }
            
            guard let data = data else {
                completionHandler(.failure(NSError(domain: "Error object is nil", code: -1)))
                return
            }
            
            do {
                let productModel = try JSONDecoder().decode(Products.self, from: data)
                completionHandler(.success(productModel.products))
            } catch {
                completionHandler(.failure(error))
            }
        }.resume()
    }
}

// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductTableViewCell
        cell?.bind(productName: productModel[indexPath.row].title, productDescription: productModel[indexPath.row].description)
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
}

// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetail = productModel[indexPath.row]
        performSegue(withIdentifier: "showProductDetails", sender: productDetail)
    }
}

// MARK: ProductTableViewCellDelegate
extension ViewController: ProductTableViewDelegate {
    func showAddToCartSuccess(productName: String) {
        let alertController = UIAlertController(title: "Add to Cart Success!", message: "Added \(productName) to cart", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Got it", style: .default) { [weak self] _ in
            guard let self else { return }
            dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true)
    }
}
