import 'package:flutter/material.dart';

Widget cashCountWidget({rupi = '2000', controller, total = 0, onchenge}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(' $rupi ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        Text(' x ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          width: 65,
          child: TextField(
            keyboardType: TextInputType.number,
            controller: controller,
            onChanged: onchenge,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              border: InputBorder.none,
              filled: true,
              fillColor: Color.fromARGB(255, 236, 236, 236),
            ),
          ),
        ),
        Text('   =  ',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        Text('$total RS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ],
    ),
  );
}
