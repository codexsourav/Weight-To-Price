import 'package:flutter/material.dart';
import '../widgets/InputBox.dart';
import '../widgets/PriceBox.dart';
import '../widgets/SubmitBtn.dart';

class Anyweighttoprice extends StatefulWidget {
  const Anyweighttoprice({super.key});

  @override
  State<Anyweighttoprice> createState() => _AnyweighttopriceState();
}

class _AnyweighttopriceState extends State<Anyweighttoprice> {
  // ignore: prefer_typing_uninitialized_variables
  var totalrs;
  var canvertlogic = '';

  TextEditingController anyKG = TextEditingController();
  TextEditingController totalweightPrice = TextEditingController();
  TextEditingController convertWeight = TextEditingController();

  ConverterPrice() {
    double mainKg =
        double.tryParse(anyKG.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ?? 0;
    double kgPrice = double.tryParse(
            totalweightPrice.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ??
        0;
    double convertKg = double.tryParse(
            convertWeight.text.replaceAll(RegExp(r'[^0-9\.]'), '')) ??
        0;

    setState(() {
      canvertlogic = "($kgPrice RS x $convertKg KG)  /  $mainKg KG";
      totalrs = (kgPrice * convertKg) / mainKg;
    });
  }

  RestetEntey() {
    setState(() {
      totalrs = null;
      anyKG.clear();
      totalweightPrice.clear();
      convertWeight.clear();
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
              title: 'Any Weight',
              hint: 'E: 9.58 KG',
              subtext: 'KG',
              controller: anyKG,
            ),
            InputBox(
              title: 'This Weight Price',
              hint: 'E: 35 RS',
              subtext: 'RS',
              controller: totalweightPrice,
            ),
            InputBox(
              title: 'Convert Weight',
              hint: 'E: 3 KG',
              subtext: 'KG',
              controller: convertWeight,
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
