import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Drawer build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            accountEmail: const Text(
              'Calculate In Smart Way',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            accountName: const Text(
              'Weight To Price',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            currentAccountPicture: Image.asset(
              'assets/logo.png',
              width: 80,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.apps_rounded),
            title: const Text('More Apps'),
            onTap: () {
              launchUrl(
                  mode: LaunchMode.externalApplication,
                  Uri.parse(
                      'https://play.google.com/store/apps/dev?id=7846146618868740188&hl=en&gl=US'));
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.star_border_rounded),
            title: const Text('Rate This App'),
            onTap: () {
              launchUrl(
                  mode: LaunchMode.externalApplication,
                  Uri.parse(
                      'https://play.google.com/store/apps/details?id=com.codexsourav.weighttoprice&hl=en&gl=US'));
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.update_rounded),
            title: const Text('Chack Update'),
            onTap: () {
              launchUrl(
                  mode: LaunchMode.externalApplication,
                  Uri.parse(
                      'https://play.google.com/store/apps/details?id=com.codexsourav.weighttoprice&hl=en&gl=US'));
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shield_rounded),
            title: const Text('Privacy Policy'),
            onTap: () {
              launchUrl(
                  mode: LaunchMode.externalApplication,
                  Uri.parse('https://weighttopriceconverter.blogspot.com'));
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('Contact US'),
            onTap: () {
              launchUrl(
                  mode: LaunchMode.externalApplication,
                  Uri.parse('https://codexsourav.vercel.app/contact'));
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
