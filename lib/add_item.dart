import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/provider_usage.dart';

import 'item.dart';
import 'main.dart';

class AddItem extends StatefulWidget with ChangeNotifier {
  AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController productName = TextEditingController();

  TextEditingController productId = TextEditingController();

  bool checkedValue = false;
  bool newValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Item'),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Product Name'),
                controller: productName,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Product Id'),
                keyboardType: TextInputType.number,
                controller: productId,
              ),
              CheckboxListTile(
                title: Text("In good condition?"),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue =newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
              OutlinedButton(onPressed:(){
                Provider.of<ProviderUsage>(context, listen: false).addItem(Item(name:productName.text,id:int.parse(productId.text),isGood: checkedValue));
                Navigator.pop(context);
              }, child: Text('SAVE'))
            ],
          ),
        ));
  }
}
