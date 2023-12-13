class Item {
  final double tax = 0.13;
  bool isTaxed = false;
  double price = 0;
  Item(this.price, this.isTaxed);
  double getPrice() {
    return isTaxed ? price + price * tax : price;
  }

  void flipTaxSelection() {
    isTaxed = !isTaxed;
  }
}
