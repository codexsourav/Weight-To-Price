import 'package:flutter/material.dart';

import '../widgets/InputBox.dart';
import '../widgets/PriceBox.dart';
import '../widgets/SubmitBtn.dart';

class Pricetoweight extends StatefulWidget {
  const Pricetoweight({super.key});

  @override
  State<Pricetoweight> createState() => _PricetoweightState();
}

class _PricetoweightState extends State<Pricetoweight> {
  var totalrs;
  var canvertlogic = '';

  TextEditingController parkgrs = TextEditingController();
  TextEditingController totalweightkg = TextEditingController();

  ConverterPrice() {
    double rupis =
        double.tryParse(parkgrs.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ?? 0;
    double kgRs = double.tryParse(
            totalweightkg.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ??
        0;

    setState(() {
      totalrs = (1000 / rupis) * (kgRs / 1000);
      canvertlogic = "(1KG / ${rupis}RS) x (${kgRs}RS / 1KG)";
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
              title: 'Total Price Convert',
              hint: 'E: 12 RS',
              subtext: 'RS',
              controller: totalweightkg,
            ),
            SubmitBtn(context, ontap: ConverterPrice, text: 'Calculate Weight'),
            SubmitBtn(context, text: 'Reset', ontap: RestetEntey, reset: true),
            const SizedBox(height: 60),
            totalrs != null
                ? PriceBox(
                    context,
                    title: 'TOTAL WEIGHT',
                    math: canvertlogic,
                    price: '${totalrs.toStringAsFixed(2)} KG',
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
