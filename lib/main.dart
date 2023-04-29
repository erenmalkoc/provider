import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/provider_usage.dart';

import 'add_item.dart';
import 'item.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProviderUsage())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = Provider.of<ProviderUsage>(context, listen: true).items.length;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Shopping App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item =
              Provider.of<ProviderUsage>(context, listen: true).items[index];
          return Card(
            color: Colors.indigo,
            child:
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start
                  , children: [
              Text(
                  'id:${item.id.toString()}',
                  style: TextStyle(fontSize: 20,color: Colors.white),
              ),
              SizedBox(
                  height: 10,
              ),
              Text(
                  'name:${item.name}',
                  style: TextStyle(fontSize: 20,color: Colors.white),
              ),

                    SizedBox(height: 10,),
                    Text(
                      'is good:${item.isGood ? 'yes':'no'}',
                      style: TextStyle(fontSize: 20,color: Colors.white),
                    ),



            ]),
                ),
          );
        },
        itemCount: length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItem()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
