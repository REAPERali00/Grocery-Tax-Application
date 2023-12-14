import 'package:flutter/material.dart';

class NumberInput extends StatefulWidget {
  final Function(String) add_cost;
  const NumberInput({super.key, required this.add_cost});

  @override
  State<NumberInput> createState() => NumberInputState();
}

class NumberInputState extends State<NumberInput> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void submit(String val) {
    widget.add_cost(val);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Enter the price: ',
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
      ),
      style: const TextStyle(color: Colors.white),
      onSubmitted: submit,
    );
  }
}
