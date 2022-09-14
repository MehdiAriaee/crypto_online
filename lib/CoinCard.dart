import 'package:flutter/material.dart';

class CoinCard extends StatelessWidget {
  CoinCard({
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.change,
    required this.changePercentage,
  });
  String name;
  String symbol;
  String imageUrl;
  double price;
  double change;
  double changePercentage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Color(0xFFFFFC090),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFFFB1D7B4),
                offset: Offset(4, 4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Color(0xFFF7FB77E),
                offset: Offset(-4, -4),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ]),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 60,
                width: 60,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image(
                      image: AssetImage('images/${symbol}.png'),
                    )),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        name,
                        style: TextStyle(
                            color: Color(0xFFFF7F6DC),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      symbol,
                      style: TextStyle(
                        color: Color(0xFFFF7F6DC),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price.toDouble().toStringAsFixed(2),
                    style: TextStyle(
                        color: Color(0xFFFF7F6DC),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    change.toDouble() < 0
                        ? '-' + change.toDouble().toStringAsFixed(2) + '%'
                        : '+' + change.toDouble().toStringAsFixed(2) + '%',
                    style: TextStyle(
                      color: change.toDouble() < 0 ? Colors.red : Colors.green,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    changePercentage.toDouble() < 0
                        ? '-' +
                            changePercentage.toDouble().toStringAsFixed(2) +
                            '%'
                        : '+' +
                            changePercentage.toDouble().toStringAsFixed(2) +
                            '%',
                    style: TextStyle(
                      color: changePercentage.toDouble() < 0
                          ? Colors.red
                          : Colors.green,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
