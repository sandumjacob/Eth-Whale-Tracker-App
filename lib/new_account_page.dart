import 'package:eth_whale_tracker/account.dart';
import 'package:eth_whale_tracker/address.dart';
import 'package:eth_whale_tracker/data_controller.dart';
import 'package:eth_whale_tracker/data_fetcher.dart';
import 'package:flutter/material.dart';
//This builds a user interface that the user enters an address into, and then the data fetcher class fetches the data from an API.
//The user confirms the data received by the fetcher, and the fetched data is plugged into the data controller for storage.s
class NewAccountPage extends StatefulWidget {
  DataController dataController;
  Function callback;
  DataFetcher dataFetcher;
  NewAccountPage(DataController _dataController, Function _callback) {
    this.dataController = _dataController;
    this.callback = _callback;
  }

  @override
  _NewAccountPageState createState() => _NewAccountPageState(this.dataController, this.callback);

}

class _NewAccountPageState extends State<NewAccountPage> {
  DataController dataController;
  DataFetcher dataFetcher;
  TextEditingController editingController;
  Function callback;
  _NewAccountPageState(DataController dataController, Function _callback) {
    this.dataController = dataController;
    this.editingController = TextEditingController();
    //this.editingController.addListener(onAddressSubmitted(context, this.dataController));
    this.callback = _callback;
  }
  onAddressSubmitted(BuildContext context) {
    dataController.addAccount(callback, new Address(editingController.text));
    Navigator.pop(context);
    print("onAddressSubmitted");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New Account Page")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Center "),
            TextField(
              controller: editingController,
              decoration: new InputDecoration(
                labelText: "Enter Account Address"
              ),
              maxLength: 42,
              //controller: this.editingController,
              //onSubmitted: onAddressSubmitted(context, dataController),
            ),
            RaisedButton(
              onPressed: () => onAddressSubmitted(context),
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }

}