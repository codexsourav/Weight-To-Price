import 'package:flutter/material.dart';

import '../widgets/InputBox.dart';
import '../widgets/PriceBox.dart';
import '../widgets/SubmitBtn.dart';

class Commision extends StatefulWidget {
  const Commision({super.key});

  @override
  State<Commision> createState() => _CommisionState();
}

class _CommisionState extends State<Commision> {
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
              title: 'Total Selling Amount ',
              hint: 'E: 1200 RS',
              subtext: 'RS',
              controller: totalRs,
            ),
            InputBox(
              title: 'Commission Percentage',
              hint: 'E: 10 %',
              subtext: '%',
              controller: persentg,
            ),
            SubmitBtn(context,
                ontap: ConverterPrice, text: 'Calculate Commission'),
            SubmitBtn(context, text: 'Reset', ontap: RestetEntey, reset: true),
            const SizedBox(height: 60),
            totalrs != null
                ? PriceBox(
                    context,
                    title: 'Your Commission',
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
