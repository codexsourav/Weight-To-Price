import 'package:flutter/material.dart';

Widget PriceBox(context, {title = 'TOTAL PRICE', math = '', price = ''}) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(25),
      width: MediaQuery.of(context).size.width - 20,
      height: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 247, 247),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              style: TextStyle(fontSize: 28),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                math,
              ),
              SizedBox(height: 6),
              Text(
                price,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
