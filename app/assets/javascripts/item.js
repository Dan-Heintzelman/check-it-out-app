function Item(name, price, merchant_id, item_id){
  this.name = name
  this.price = price
  this.merchant_id = merchant_id
  this.merchant_item_id = item_id
}

Item.prototype.convert_price = function(){
  var new_price = parseInt(this.price * 100, 10)
  return new_price
}
