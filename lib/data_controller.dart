import 'package:eth_whale_tracker/account.dart';
import 'package:eth_whale_tracker/address.dart';
import 'package:eth_whale_tracker/data_fetcher.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
class DataController {
  //This class is fed the APi data and stores it for the app to use.
  final String apiKey = 'JGVDZS2EHQTBE57N3KX7VPB4HBK5A2E6X6';
  List<Account> accounts = [];
  var client;
  var url = "https://api.etherscan.io/api?module=account&action=balance&address=0xddbd2b932c763ba5b1b7ae3b362eac3e8d40121a&tag=latest&apikey=JGVDZS2EHQTBE57N3KX7VPB4HBK5A2E6X6";

  DataController() {
    client = new http.Client();
  }

  void addAccount(Function callback, Address address) {
    Account newAccount = new Account.address(address);
    this.accounts.add(newAccount);
    //DataFetcher.fetchAccountData(this, this.accounts.length-1, callback);
    DataFetcher.fetchAccountsData(this, callback); //Change this to the single address function once its implemented
  }

  void deleteAccount(int index) {
    this.accounts.removeAt(index);
  }

  void main() {

  }

  storeData() {

  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}