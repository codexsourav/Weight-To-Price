import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/commision.dart';
import 'package:flutter_application_1/Pages/discount.dart';
import 'package:flutter_application_1/Pages/pricetonote.dart';
import 'package:flutter_application_1/Pages/pricetoweight.dart';
import 'package:flutter_application_1/widgets/MyDrawer.dart';
import 'package:flutter_application_1/widgets/TabTexts.dart';
import 'package:flutter_application_1/widgets/Tabs.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Pages/anyweighttoprice.dart';
import 'Pages/cashcount.dart';
import 'Pages/weighttoprice.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? _bannerAd;

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3072759372946465/5221394673'
      : 'ca-app-pub-3940256099942544/2934735716';

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          setState(() {
            _bannerAd = null;
          });
        },
      ),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabText.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0.0,
          toolbarHeight: 60,
          backgroundColor: Colors.white,
          title: const Text(
            'Weight To Price',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          bottom: TabMenu(),
          actions: [
            IconButton(
                onPressed: () {
                  launchUrl(
                      mode: LaunchMode.externalApplication,
                      Uri.parse(
                          'https://play.google.com/store/apps/details?id=com.codexsourav.weighttoprice&hl=en&gl=US'));
                },
                icon: const Icon(Icons.star_rate_rounded)),
            IconButton(
                onPressed: () {
                  launchUrl(
                      mode: LaunchMode.externalApplication,
                      Uri.parse(
                          'whatsapp://send?text=Weight To Price Converter Tool \n Download Now : https://play.google.com/store/apps/details?id=com.codexsourav.weighttoprice&hl=en&gl=US'));
                },
                icon: const Icon(
                  Icons.share,
                  size: 18,
                )),
          ],
        ),
        drawer: MyDrawer(),
        body: const TabBarView(
          children: [
            Weighttoprice(),
            Pricetoweight(),
            Anyweighttoprice(),
            Pricetonote(),
            CashCount(),
            Discount(),
            Commision(),
          ],
        ),
        bottomNavigationBar: _bannerAd != null
            ? Container(
                color: Colors.white,
                height: _bannerAd?.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
              )
            : const SizedBox(height: 0),
      ),
    );
  }
}
