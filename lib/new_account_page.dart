import 'package:eth_whale_tracker/data_controller.dart';
import 'package:flutter/material.dart';
//This builds a user interface that the user enters an address into, and then the data fetcher class fetches the data from an API.
//The user confirms the data received by the fetcher, and the fetched data is plugged into the data controller for storage.s
class NewAccountPage extends StatefulWidget {
  DataController dataController;
  NewAccountPage(DataController _dataController) {
    this.dataController = _dataController;
  }

  @override
  _NewAccountPageState createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New Account Page")
      ),
      body: Center()
    );
  }

}