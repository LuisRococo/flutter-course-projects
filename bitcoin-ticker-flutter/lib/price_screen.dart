import 'package:bitcoin_ticker/api_data_simulator.dart';
import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'MXN';
  dynamic exchangeData = new Map();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final ApiDataSimulator apiSimulator =
        ApiDataSimulator(currency: selectedCurrency);

    dynamic exchangeData = await apiSimulator.getExchanges(cryptoList, 1);
    setState(() {
      this.exchangeData = exchangeData;
    });
  }

  DropdownButton androidDropdown() {
    List<DropdownMenuItem<String>> dropdownMenuItems = currenciesList.map((e) {
      return DropdownMenuItem(
        child: Text(e),
        value: e,
      );
    }).toList();

    return DropdownButton(
      items: dropdownMenuItems,
      value: selectedCurrency,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        getData();
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> cupertinoItems = currenciesList.map(
      (e) {
        return Text(e);
      },
    ).toList();

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
        });
        getData();
      },
      children: cupertinoItems,
    );
  }

  Widget getPicker() {
    if (Platform.isIOS) {
      return iOSPicker();
    } else {
      return androidDropdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      "1 BTC = ${exchangeData['BTC'] ?? '?'} $selectedCurrency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      "1 ETH = ${exchangeData['ETH'] ?? '?'} $selectedCurrency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                    child: Text(
                      "1 LTC = ${exchangeData['LTC'] ?? '?'} $selectedCurrency",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getPicker(),
          ),
        ],
      ),
    );
  }
}
