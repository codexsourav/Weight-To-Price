import 'package:flutter/material.dart';

import '../widgets/InputBox.dart';
import '../widgets/PriceBox.dart';
import '../widgets/SubmitBtn.dart';

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  State<Discount> createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
  var totalrs;
  var canvertlogic = '';

  TextEditingController totalRs = TextEditingController();
  TextEditingController persentg = TextEditingController();

  ConverterPrice() {
    double rupis =
        double.tryParse(totalRs.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ?? 0;
    double pers =
        double.tryParse(persentg.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ?? 0;

    setState(() {
      totalrs = (pers / 100) * rupis;
      canvertlogic = "$rupis RS  %  $pers";
    });
  }

  RestetEntey() {
    setState(() {
      totalrs = null;
      totalRs.clear();
      persentg.clear();
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
              title: 'Total Amount ',
              hint: 'E: 1200 RS',
              subtext: 'RS',
              controller: totalRs,
            ),
            InputBox(
              title: 'Discount Percentage',
              hint: 'E: 10 %',
              subtext: '%',
              controller: persentg,
            ),
            SubmitBtn(context,
                ontap: ConverterPrice, text: 'Calculate Discount'),
            SubmitBtn(context, text: 'Reset', ontap: RestetEntey, reset: true),
            const SizedBox(height: 60),
            totalrs != null
                ? PriceBox(
                    context,
                    title: 'DISCOUNT',
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
