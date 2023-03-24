import 'package:flutter/material.dart';

Widget InputBox(
    {title = 'Enter Price', hint = '', subtext = 'RS', controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Text(title),
      ),
      TextField(
        controller: controller,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: Color.fromARGB(255, 238, 238, 238),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 14),
            counter: Text(subtext)),
      ),
    ],
  );
}
