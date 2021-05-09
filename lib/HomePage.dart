import 'dart:convert';

import 'package:crypto_app/component/Cardcoin.dart';
import 'package:crypto_app/model/Coin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get data from when structure API is " [{}] "
  List<Coin> coins = [];

  fetchDataCoin() async {
    String url =
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=idr&order=market_cap_desc&per_page=100&page=1&sparkline=false";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var item in data) {
        Coin coin = Coin(
            id: item['id'],
            name: item['name'],
            symbol: item['symbol'],
            marketCap: item['market_cap'],
            currentPrice: item['current_price'].toString(),
            image: item['image']);
        coins.add(coin);
      }
      print(coins.length);
      setState(() {
        return coins;
      });
    } else {
      print('error');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataCoin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cryptocurrency'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Container(
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: coins.length,
            itemBuilder: (context, i) {
              final x = coins[i];
              return Center(
                child: Row(
                  children: [
                    Cardcoin(
                      image: x.image,
                      name: x.name,
                      marketCap: x.marketCap,
                      currentPrice: double.parse(x.currentPrice),
                    )
                  ],
                ),
              );
            },
          ),
        ));
  }
}
