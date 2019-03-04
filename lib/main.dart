import 'package:eth_whale_tracker/account.dart';
import 'package:eth_whale_tracker/data_controller.dart';
import 'package:eth_whale_tracker/details_page.dart';
import 'package:eth_whale_tracker/new_account_page.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
DataController dataController = new DataController();
class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eth Whale Tracker',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Eth Whale Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  void _addAccount() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      dataController.accounts.add(new Account.empty());
    });
  }

  void _onTapAddAccount(BuildContext context, DataController _dataController) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new NewAccountPage(_dataController)),
    );
  }

  void _onTapDetails(BuildContext context, int _index, DataController _dataController) {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new DetailsPage(_index, _dataController)),
    );
  }

  void _onTapSettings() {

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: _onTapSettings,
          )
        ],
      ),
        body: Column(children: [
          new Expanded(
            child: new ListView.builder(
              itemCount: dataController.accounts.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                    child: Column(
                        children: <Widget>[
                          //Name Text Widget
                          Text(dataController.accounts[index].accountName, style: TextStyle(color: Colors.blue)),
                          //Address Text Widget
                          Text(dataController.accounts[index].accountAddress.key, style:  TextStyle(color: Colors.blue)),
                          //Balance Text Widget
                          Text(dataController.accounts[index].accountBalance.toString(), style: TextStyle(color: Colors.blue)),
                          //Number of Transactions Text Widget
                          Text('# of Transactions: ' + dataController.accounts[index].transactions.length.toString(), style: TextStyle(color: Colors.blue)),
                          ListTile(
                            title: const Center(
                              child: Text('Details'),
                            ),
                            onTap: () => _onTapDetails(context, index, dataController)
                          )
                        ]
                    )
                );
              }
            )
          )
        ]),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _onTapAddAccount(context, dataController),
        tooltip: 'Add',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
