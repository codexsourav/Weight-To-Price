import 'package:flutter/material.dart';

import '../widgets/InputBox.dart';
import '../widgets/SubmitBtn.dart';

class Pricetonote extends StatefulWidget {
  const Pricetonote({super.key});

  @override
  State<Pricetonote> createState() => _PricetonoteState();
}

class _PricetonoteState extends State<Pricetonote> {
  TextEditingController AmmountCon = TextEditingController();
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
    0.50,
    0.25
  ];
  List<double> useCash = [];
  List<double> useCashFilter = [];

  removeFromCashList(index) {
    setState(() {
      cashList.remove(index);
    });
  }

  getCahSolit() {
    useCash = [];
    double amount =
        double.tryParse(AmmountCon.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ??
            0;
    splitCash(avCash: amount);

    setState(() {});
  }

  splitCash({
    double avCash = 0.0,
  }) {
    int cashChack = 0;

    while (0 <= avCash) {
      if (cashList[cashChack] <= avCash) {
        avCash = avCash - cashList[cashChack];
        useCash.add(cashList[cashChack]);
      } else {
        cashChack++;
        if (cashChack == cashList.length) {
          break;
        }
      }
    }
    useCashFilter = useCash.toSet().toList();
    return useCash;
  }

  countCashNote(find) {
    int count = 0;
    for (var element in useCash) {
      if (find == element) {
        count++;
      }
    }
    return count;
  }

  RestetEntey() {
    useCash = [];
    useCashFilter = [];
    AmmountCon.clear();
    cashList = [2000, 500, 200, 100, 50, 20, 10, 5, 2, 1, 0.50, 0.25];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          cashListView(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              children: [
                InputBox(
                  title: 'Enter Amount',
                  hint: 'E: 100000 RS',
                  subtext: 'RS',
                  controller: AmmountCon,
                ),
                SubmitBtn(context,
                    text: 'Split Cash Amount', ontap: getCahSolit),
                SubmitBtn(context,
                    text: 'Reset', ontap: RestetEntey, reset: true),
                const SizedBox(height: 20),
                ListView.builder(
                  itemCount: useCashFilter.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${useCashFilter[index]} RS',
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              '${countCashNote(useCashFilter[index])} ',
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          ]),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cashListView() {
    return SizedBox(
      height: 55.0,
      child: ListView.builder(
        itemCount: cashList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Chip(
              // backgroundColor: Colors.black,
              // deleteIconColor: Colors.white,
              // labelStyle: const TextStyle(color: Colors.white),
              label: Text(cashList[index].toString()),
              onDeleted: () {
                removeFromCashList(cashList[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
