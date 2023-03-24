import 'package:flutter/material.dart';

Widget SubmitBtn(context,
    {text = 'Calculate Price', ontap = null, reset = false}) {
  return GestureDetector(
    onTap: () {
      ontap();
      FocusScope.of(context).unfocus();
    },
    child: Container(
      width: MediaQuery.of(context).size.width - 20,
      height: 60,
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      )),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: reset
            ? Color.fromARGB(255, 189, 73, 65)
            : Color.fromARGB(255, 36, 36, 36),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
