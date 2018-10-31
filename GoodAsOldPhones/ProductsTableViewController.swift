

import UIKit

class ProductsTableViewController: UITableViewController {
  fileprivate var products: [Product]?
  fileprivate let identifer = "productCell"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    products = [
        Product(name: "Pizza", cellImageName: "pizza", fullscreenImageName: "full-pizza", price: 80000, amount: nil),
        Product(name: "Chicken", cellImageName: "chicken", fullscreenImageName: "full-chicken", price: 50000, amount: nil),
        Product(name: "hamburger", cellImageName: "hamburger", fullscreenImageName: "full-hamburger", price:  40000, amount: nil),
        Product(name: "hot dog", cellImageName: "hot dog", fullscreenImageName: "full-hotdog", price: 30000, amount: nil),
        Product(name: "matcha ice-cream", cellImageName: "matcha ice-cream", fullscreenImageName: "full-matcha", price: 35000, amount: nil),
      Product(name: "noodles", cellImageName: "noodles", fullscreenImageName: "full-noodles",price: 35000, amount: nil),
      Product(name: "pancake", cellImageName: "pancake", fullscreenImageName: "full-pancake",price: 15000, amount: nil),
      Product(name: "sandwich", cellImageName: "sandwich", fullscreenImageName: "full-sandwich",price: 15000, amount: nil),
      Product(name: "spagetti", cellImageName: "spagetti", fullscreenImageName: "full-spagetti",price: 35000, amount: nil)
    ]
  }
  
  // MARK: - UITableViewDataSource
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return products?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath)
    guard let products = products else { return cell }
    
    cell.textLabel?.text = products[(indexPath as NSIndexPath).row].name
    
    if let imageName = products[(indexPath as NSIndexPath).row].cellImageName {
      cell.imageView?.image = UIImage(named: imageName)
    }
    
    return cell;
  }
  
  // MARK: - View Transfer
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showProduct" {
      if let cell = sender as? UITableViewCell,
        let indexPath = tableView.indexPath(for: cell),
        let productVC = segue.destination as? ProductViewController {
        productVC.product = products?[(indexPath as NSIndexPath).row]
      }
    }
  }
}
