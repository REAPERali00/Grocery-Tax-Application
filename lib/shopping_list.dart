import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.grey : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return const TextStyle(fontSize: 20);

    return const TextStyle(
      color: Colors.grey,
      decoration: TextDecoration.lineThrough,
      fontSize: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      child: ListTile(
        onTap: () => onCartChanged(product, inCart),
        leading: CircleAvatar(
          backgroundColor: _getColor(context),
          foregroundColor: Colors.white,
          child: Text(product.name[0].toUpperCase()),
        ),
        title: Text(
          product.name,
          style: _getTextStyle(context),
        ),
        trailing: Icon(
          inCart ? Icons.check_box : Icons.check_box_outline_blank,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, super.key});

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
          style: TextStyle(
            color: Color.fromARGB(255, 42, 7, 48),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/shopping.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: widget.products.length,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemBuilder: (context, index) {
            var product = widget.products[index];
            return ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged,
            );
          },
        ),
      ),
    );
  }
}
