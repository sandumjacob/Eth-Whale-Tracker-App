import 'dart:io';
import 'dart:convert';

import 'package:eth_whale_tracker/account.dart';
import 'package:eth_whale_tracker/address.dart';
import 'package:eth_whale_tracker/data_controller.dart';

class TransactionModel {
  double blockNumber;
  double timeStamp;
  String fromAddress;
  String toAddress;
  double amount;

  TransactionModel({
   this.blockNumber,
   this.timeStamp,
   this.fromAddress,
   this.toAddress,
   this.amount
  });

  //factory TransactionModel
}