function Bill(){
  this.items = [];
}

Bill.prototype.addItem = function(item){
  this.items.push(item);
}

Bill.prototype.total = function(){
  var total = 0;
  for (i=0; i < this.items.length; i++) {
    var price = this.items[i].convert_price();
    total += price;
  }
  return total;
};

Bill.prototype.clear = function(){
  this.items.length = 0;
}
