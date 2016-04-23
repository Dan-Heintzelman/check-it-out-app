function Item(name, price){
  this.name = name
  this.price = price
}

Item.prototype.convert_price = function(){
  var new_price = parseInt(this.price * 100, 10)
  return new_price
}
