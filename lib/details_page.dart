import 'package:eth_whale_tracker/account.dart';
import 'package:eth_whale_tracker/data_controller.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  int index;
  DataController dataController;
  Account selectedAccount;
  DetailsPage(int _index, DataController _dataController) {
    this.index = _index;
    this.dataController = _dataController;
    this.selectedAccount = dataController.accounts[index];
  }

  void _onTapViewTransactionLog(BuildContext context, int _index, DataController _dataController) {

  }

  void _onTapDeleteAccount(BuildContext context) {
    dataController.deleteAccount(index);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Details Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () =>_onTapDeleteAccount(context)
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Name of Account"),
            Text(selectedAccount.accountName),
            Text("Account Address"),
            Text(selectedAccount.accountAddress.key),
            Text("Account Balance"),
            Text(selectedAccount.accountBalance.toString()),
            Text("# of Transactions"),
            Text(selectedAccount.transactions.length.toString()),
            RaisedButton( //Maybe instead of a seperate page just a listview below all of these deatils....
              onPressed: () => _onTapViewTransactionLog(context, this.index, this.dataController),
              child: const Text('View Transaction Log'),
            )
          ],
      )
      )
    );
  }

}