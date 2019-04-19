import './address.dart';
class Transaction {
  Address toAddress;
  Address fromAddress;
  double amount;
  double transactionTimeStamp;
  double blockNumber;

  Transaction(Address _toAddress, Address _fromAddress, double _amount, double _transactionTimeStamp, double _blockNumber) {
    this.toAddress = _toAddress;
    this.fromAddress = _fromAddress;
    this.amount = _amount;
    this.transactionTimeStamp = _transactionTimeStamp;
    this.blockNumber = _blockNumber;
  }

  Transaction.empty() {
    this.toAddress = new Address.empty();
    this.fromAddress = new Address.empty();
    this.amount = 0.0;
    this.transactionTimeStamp = 0;
    this.blockNumber = 0;
  }

  @override
  String toString() {
    String output = "toAddress: $toAddress fromAddress: $fromAddress amount: $amount transactionTimeStamp: $transactionTimeStamp blockNumber $blockNumber";
    return output;
  }
  /*factory Transaction.fromJson(Map<String, dynamic> parsedJson) {
    return Transaction(
      toAddress: parsedJson['']
    )
  }*/
}