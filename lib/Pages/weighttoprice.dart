import 'dart:convert';

import 'package:flutter/material.dart';

import '../widgets/InputBox.dart';
import '../widgets/PriceBox.dart';
import '../widgets/SubmitBtn.dart';

class Weighttoprice extends StatefulWidget {
  const Weighttoprice({super.key});

  @override
  State<Weighttoprice> createState() => _WeighttopriceState();
}

class _WeighttopriceState extends State<Weighttoprice> {
  var totalrs;
  var canvertlogic = '';

  TextEditingController parkgrs = TextEditingController();
  TextEditingController totalweightkg = TextEditingController();

  ConverterPrice() {
    double rupis =
        double.tryParse(parkgrs.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ?? 0;
    double kgweight = double.tryParse(
            totalweightkg.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ??
        0;

    setState(() {
      totalrs = kgweight * rupis;
      canvertlogic = "${kgweight} KG  X  ${rupis} RS";
    });
  }

  RestetEntey() {
    setState(() {
      totalrs = null;
      parkgrs.clear();
      totalweightkg.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputBox(
              title: 'Price Of 1 KG Fix ',
              hint: 'E: 10 RS',
              subtext: 'RS',
              controller: parkgrs,
            ),
            InputBox(
              title: 'Total Weight Convert',
              hint: 'E: 25 KG',
              subtext: 'KG',
              controller: totalweightkg,
            ),
            SubmitBtn(context, ontap: ConverterPrice),
            SubmitBtn(context, text: 'Reset', ontap: RestetEntey, reset: true),
            const SizedBox(height: 60),
            totalrs != null
                ? PriceBox(
                    context,
                    math: canvertlogic,
                    price: '${totalrs.toStringAsFixed(2)} RS',
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
