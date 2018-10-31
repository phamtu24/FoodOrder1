

import Foundation

class Product {
  var name: String?
  var cellImageName: String?
  var fullscreenImageName: String?
  var price: Int?
  var amount: Int?
  
    init(name: String?, cellImageName: String?, fullscreenImageName: String?, price: Int?, amount: Int?) {
    self.name = name
    self.cellImageName = cellImageName
    self.fullscreenImageName = fullscreenImageName
    self.price = price
    self.amount = amount
  }
}
