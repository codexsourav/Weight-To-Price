import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/PriceBox.dart';
import 'package:flutter_application_1/widgets/SubmitBtn.dart';

import '../widgets/cashCountInput.dart';

class CashCount extends StatefulWidget {
  const CashCount({super.key});

  @override
  State<CashCount> createState() => _CashCountState();
}

class _CashCountState extends State<CashCount> {
  double total = 0;
  List<double> cashList = [
    2000,
    500,
    200,
    100,
    50,
    20,
    10,
    5,
    2,
    1,
  ];
  List<double> cashListTotal = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  TextEditingController rs2000 = TextEditingController();
  TextEditingController rs500 = TextEditingController();
  TextEditingController rs200 = TextEditingController();
  TextEditingController rs100 = TextEditingController();
  TextEditingController rs50 = TextEditingController();
  TextEditingController rs20 = TextEditingController();
  TextEditingController rs10 = TextEditingController();
  TextEditingController rs5 = TextEditingController();
  TextEditingController rs2 = TextEditingController();
  TextEditingController rs1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> cashcontrollerList = [
      rs2000,
      rs500,
      rs200,
      rs100,
      rs50,
      rs20,
      rs10,
      rs5,
      rs2,
      rs1
    ];

    getTotalNumber(index) {
      double num = double.tryParse(cashcontrollerList[index]
              .text
              .replaceAll(RegExp(r'[^0-9\.]'), '')) ??
          0;
      cashListTotal[index] = cashList[index] * num;
    }

    countTotal() {
      double gtotal = 0;
      for (var i = 0; i < cashList.length; i++) {
        getTotalNumber(i);
        gtotal = cashListTotal[i] + gtotal;
      }
      setState(() {
        total = gtotal;
      });
    }

    resetAll() {
      total = 0;
      for (var i = 0; i < cashcontrollerList.length; i++) {
        cashcontrollerList[i].clear();
      }
      cashListTotal = [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ];
      setState(() {});
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Column(
              children: List.generate(
                cashList.length,
                (index) => cashCountWidget(
                  rupi: cashList[index].toString(),
                  controller: cashcontrollerList[index],
                  onchenge: (val) {
                    countTotal();
                  },
                  total: cashListTotal[index].toString(),
                ),
              ),
            ),
            PriceBox(context, title: 'TOTAL CASH', price: total.toString()),
            SubmitBtn(context, reset: true, text: 'CLEAR ALL', ontap: () {
              resetAll();
            }),
          ],
        ),
      ),
    );
  }
}
