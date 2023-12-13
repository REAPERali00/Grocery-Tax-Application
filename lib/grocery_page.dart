import 'package:flutter/material.dart';
import 'package:practice/shopping_list.dart';
import 'datastorage.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Grocery extends StatefulWidget {
  const Grocery({super.key});

  @override
  State<Grocery> createState() => GgroceryState();
}

class GgroceryState extends State<Grocery> {
  List<String> _names = ['Eggs', 'Flour'];

  @override
  void initState() {
    super.initState();
    loadNames().then((names) {
      setState(() {
        _names = names;
      });
    });
  }

  void _addName(String name) {
    setState(() {
      _names.add(name);
    });
    saveNames(_names);
  }

  void _clearNames() {
    setState(() {
      _names.clear();
    });
    saveNames(_names);
  }

  List<Product> _getProducts() {
    return _names.map((name) => Product(name: name)).toList();
  }

  void _addNameDialog(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter a name: '),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: "name"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  _addName(_textController.text);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShoppingList(products: _getProducts()),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add),
            label: 'Add a name',
            onTap: () => _addNameDialog(context),
          ),
          SpeedDialChild(
            child: const Icon(Icons.clear),
            label: 'Clear All names',
            onTap: () => _clearNames(),
          ),
        ],
      ),
    );
  }
}
