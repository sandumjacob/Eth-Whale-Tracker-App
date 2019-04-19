import 'dart:io';
import 'dart:convert';

import 'package:eth_whale_tracker/account.dart';
import 'package:eth_whale_tracker/address.dart';
import 'package:eth_whale_tracker/data_controller.dart';
import 'package:eth_whale_tracker/transaction.dart';

class DataFetcher {
  //Function callback;
  static final String apiKey = "JGVDZS2EHQTBE57N3KX7VPB4HBK5A2E6X6";
  //This class handles all the API stuff

  static String formatAddresses(List<Account> _accountList) {
    String appendedAddresses = "";
    for (int i = 0; i < _accountList.length; i++) {
      appendedAddresses += _accountList[i].accountAddress.key;
      if (i != _accountList.length-1) appendedAddresses += ",";
    }
    return appendedAddresses;
  }

  static fetchAccountData(DataController dataController, int index, Function callback) async {
    Account newAccount = new Account.empty();
    Uri formattedURLBalance = Uri.parse("https://api.etherscan.io/api?module=account&action=balance&address="
        + dataController.accounts[index].accountAddress.key
        + "=latest&apikey=$apiKey");
    String rawJSON;
    var request = await HttpClient().getUrl(formattedURLBalance);
    var response = await request.close();

    await for (var contents in response.transform(Utf8Decoder())) {
      rawJSON = contents;
    }

  }

  static fetchAccountsData(DataController dataController, Function callback) async {

    //Account Balances Stuff
    String appendedAddresses = formatAddresses(dataController.accounts);

    Uri formattedURLBalance = Uri.parse("https://api.etherscan.io/api?module=account&action=balancemulti&address="
        + appendedAddresses
        + "&tag=latest&apikey="
        + apiKey);
    //Fetch balances
    print(formattedURLBalance);
    String rawJSON;
    var request = await HttpClient().getUrl(formattedURLBalance);
    var response = await request.close();

    await for (var contents in response.transform(Utf8Decoder())) {
      rawJSON = contents;
    }
    Map<String, dynamic> parsedJSON = jsonDecode(rawJSON);
    List result = parsedJSON['result'];
    for (int i = 0; i < result.length; i++) {
      print(i.toString() + ":" + result[i].toString());
      double balanceResult = double.parse(result[i]['balance']);
      dataController.accounts[i].accountBalance = balanceResult/10e17;
    }

    //Transaction History Stuff
    for (int i = 0; i < dataController.accounts.length; i++) {
      Address address = dataController.accounts[i].accountAddress;
      print("Processing transactions for address: " + address.key);
      Uri formattedURLTransactions =
      Uri.parse("http://api.etherscan.io/api?module=account&action=txlist&address="
          + address.key
          + "&apikey="
          + apiKey);

      String rawJSONTransactions = "";
      var requestTransactionsRequest = await HttpClient().getUrl(formattedURLTransactions);
      var responseTransactions = await requestTransactionsRequest.close();

      //Merge the contents together
      await for (var TransactionContents in responseTransactions.transform(Utf8Decoder())) {
        rawJSONTransactions += TransactionContents;
        print("Contents: " + TransactionContents);
      }

      final parsedJSONTransactions = json.decode(rawJSONTransactions);
      List parsedResultsTransactionsList = parsedJSONTransactions['result'];
      print(parsedJSONTransactions);
      List<Transaction> transactionList = new List<Transaction>();
      for (int j = 0; j < parsedResultsTransactionsList.length; j++) {
        var blockNumber = parsedResultsTransactionsList[j]['blockNumber'];
        var timeStamp = parsedResultsTransactionsList[j]['timeStamp']; //Unix Timestamp
        var fromAddress = parsedResultsTransactionsList[j]['from'];
        var toAddress = parsedResultsTransactionsList[j]['to'];
        var amount = parsedResultsTransactionsList[j]['value'];
        Transaction transaction = new Transaction(
            new Address(toAddress), new Address(fromAddress),
            double.parse(amount), double.parse(timeStamp),
            double.parse(blockNumber));
        print("Transaction: \n" + transaction.toString());
        transactionList.add(transaction);
      }
      dataController.accounts[i].transactions = transactionList;
      print("Transactions in account $i: " + dataController.accounts[i].transactions.length.toString());
    }
    callback();
  }




}