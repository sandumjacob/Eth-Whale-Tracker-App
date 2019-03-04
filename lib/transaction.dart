import './address.dart';
class Transaction {
  Address toAddress;
  Address fromAddress;
  double amount;
  DateTime transactionDateTime;

  Transaction(Address _toAddress, Address _fromAddress, double _amount, DateTime _transactionDateTime) {
    this.toAddress = _toAddress;
    this.fromAddress = _fromAddress;
    this.amount = _amount;
    this.transactionDateTime = _transactionDateTime;
  }

  Transaction.empty() {
    this.toAddress = new Address.empty();
    this.fromAddress = new Address.empty();
    this.amount = 0.0;
    this.transactionDateTime = DateTime.now();
  }
}