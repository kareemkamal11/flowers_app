import 'package:flowers/core/navigation_app.dart';
import 'package:flowers/core/app_text.dart';
import 'package:flutter/material.dart';

class AppDrawerWidget extends StatelessWidget {
  const AppDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text(AppText.home),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),          // product details
          ListTile(
            title: const Text(AppText.confirmOrder),
            onTap: () {
              Navigator.of(context).push(AppNavigator.checkoutScreen());
            },
          ),
        ],
      ),
    );
  }
}
