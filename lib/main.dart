import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CoinCard.dart';
import 'CoinModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    final response = await http.get(Uri.parse('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));
    if (response.statusCode == 200){
      List<dynamic> values = [];
      values = json.decode(response.body);
      if (values.length > 0){
        for (int i=0; i<15; i++){
          if(values[i] !=null){
            Map<String, dynamic> map = values[i];
            coinList.add(Coin.formJson(map));
          }
        }
        setState((){
          coinList;
        });
      }
      return coinList;
    } else{
      throw Exception('failed to load coins');
    }
  }
  @override
  void initState() {
    fetchCoin();
    Timer.periodic(Duration(seconds: 10), (timer) => fetchCoin());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFB1D7B4),
      appBar: AppBar(
          backgroundColor: Color(0xFFF7FB77E),
          title: Center(
            child: Text(
              'Mehdi Crypto Online',
              style: TextStyle(
                  color: Color(0xFFFF7F6DC),
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: coinList.length,
        itemBuilder: (context, index){
          return CoinCard(
            name: coinList[index].name,
            symbol: coinList[index].symbol,
            imageUrl: coinList[index].imageUrl,
            price: coinList[index].price.toDouble(),
            change: coinList[index].change.toDouble(),
            changePercentage: coinList[index].changePercentage.toDouble(),
          );
        },
      ));
  }
}


