import './transaction.dart';
import './address.dart';

class Account {
  //If name is empty, then name should be equal to the address key
  //If name is not empty, then it can be whatever
  String accountName;
  Address accountAddress;
  double accountBalance;
  List<Transaction> transactions;

  Account(String _accountName, Address _accountAddress, double _accountBalance, List<Transaction> _transactions) {
    this.accountName = _accountName;
    this.accountAddress = _accountAddress;
    if (this.accountName.length == 0) this.accountName = this.accountAddress.key;
    this.accountBalance = _accountBalance;
    this.transactions = _transactions;
  }

  Account.address(Address _accountAddress) {
    this.accountAddress = _accountAddress;
    this.accountName = _accountAddress.key;
    this.accountBalance = 0.0;
    this.transactions = new List<Transaction>();
  }

  Account.empty() {
    this.accountAddress = new Address.empty();
    this.accountName = this.accountAddress.key;
    this.accountBalance = 0.0;
    this.transactions = [new Transaction.empty()];
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}