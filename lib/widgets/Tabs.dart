import 'package:flutter/material.dart';

import 'TabTexts.dart';

PreferredSizeWidget TabMenu() {
  return TabBar(
    isScrollable: true, // Required
    labelColor: Colors.black,
    unselectedLabelColor: const Color.fromARGB(77, 0, 0, 0), // Other tabs color
    labelPadding:
        const EdgeInsets.symmetric(horizontal: 20), // Space between tabs
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(
          color: Color.fromARGB(255, 0, 0, 0), width: 2), // Indicator height
      insets: EdgeInsets.symmetric(horizontal: 48), // Indicator width
    ),
    tabs: TabText,
  );
}
