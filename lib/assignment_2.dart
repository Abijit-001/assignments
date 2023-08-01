class IpFirstGen {
  void printIp() {
    print("It is a first gen ip.");
  }
}

class IpSecGen extends IpFirstGen {
  @override
  void printIp() {
    print("It is a Sec. gen ip.");
  }

  @Deprecated('migration')
  void legacy() {
    print("It is a Sec. gen legacy ip.");
  }
}

class IpThirdGen extends IpSecGen {
  @override
  void printIp() {
    print("It is a Third gen ip.");
  }
}

class IpFourthGen extends IpThirdGen {
  @override
  void printIp() {
    print("It is a Fourth gen ip.");
  }

  @override
  void legacy() {
    super.legacy();
  }
}

main() {
  var a = IpFourthGen();
  a.printIp();
  a.legacy();
}
