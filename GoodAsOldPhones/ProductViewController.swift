
import UIKit
import Toast_Swift

class ProductViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet var productImageView: UIImageView!
  @IBOutlet var productNameLabel: UILabel!
  @IBOutlet var priceLable: UILabel!
  @IBOutlet weak var amountField: UITextField?
  @IBOutlet var totalLable: UILabel!
  
  var product: Product?
 
    
  override func viewDidLoad() {
    super.viewDidLoad()
    
    productNameLabel.text = product?.name
    
    if let imageName = product?.fullscreenImageName {
      productImageView.image = UIImage(named: imageName)
    }
    if let foodPrice = product?.price{
        priceLable.text = "\(String(foodPrice)) vnđ"
    }
    totalLable.text = "0 vnđ"
    
    
//    let total = ((product?.price)! * (product?.amount ?? 0) )
//    totalLable.text = "\(String(total))vnđ"
  }

  @IBAction func addToCartButtonDidTap(_ sender: AnyObject) {
    self.view.makeToast("Add to cart successfully")
  }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("begin")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) -> Bool {
        print("done")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Int {
        print("done")
        amountField?.resignFirstResponder()
        let amount = Int((amountField?.text)!)
        return amount ?? 0
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        amountField?.resignFirstResponder()
        totalLable.text =  "\(String((textFieldShouldReturn(amountField!) ) * (product?.price ?? 0))) vnđ"
        print(amountField?.text as Any)
        print(product?.price as Any)
        return true
    }

    
    
}
