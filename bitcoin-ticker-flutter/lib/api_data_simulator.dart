import 'dart:async';
import 'dart:math';

class ApiDataSimulator {
  final String currency;

  ApiDataSimulator({this.currency});

  Future<int> getExchangeRate(coin, curencyQuantity) async {
    return Random().nextInt(4000) + 1000;
  }

  Future<dynamic> getExchanges(List<String> coins, int curencyQuantity) async {
    var result = {};
    for (var coin in coins) {
      int exchange = await this.getExchangeRate(coin, curencyQuantity);
      result[coin] = exchange;
    }
    return result;
  }
}
