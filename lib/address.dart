class Address {
  //Ethereum Public Address Keys are 40 characters long
  String key;

  Address(String _key) {
    this.key = _key;
  }

  Address.empty() {
    this.key = "0x0000000000000000000000000000000000000000";
  }



}