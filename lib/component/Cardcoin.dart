import 'package:flutter/material.dart';

class Cardcoin extends StatelessWidget {
  final String image;
  final String name;
  final int marketCap;
  final double currentPrice;

  const Cardcoin(
      {Key key, this.image, this.name, this.marketCap, this.currentPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white)),
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.network(
              image,
              width: 50,
            ),
            SizedBox(width: 20,),
            Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Expanded(child: Text(marketCap.toString(),
              overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.white))),
            Spacer(),
            Text(currentPrice.toString(), style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
