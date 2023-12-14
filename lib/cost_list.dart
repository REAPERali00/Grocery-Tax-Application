import 'package:flutter/material.dart';
import 'item.dart';

class CostList extends StatefulWidget {
  final List<Item> items;
  const CostList({super.key, required this.items});

  @override
  State<CostList> createState() => _CostListState();
}

class _CostListState extends State<CostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        var item = widget.items[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 9),
          elevation: 4.0,
          shadowColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.shopping_cart, color: Colors.green),
              title: Text(
                item.isTaxed
                    ? 'Item ${index + 1}, Tax: ${item.tax * 100}%'
                    : 'Item ${index + 1}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: Text(
                '\$${item.getPrice().toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
