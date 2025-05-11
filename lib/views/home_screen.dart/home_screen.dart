import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tasks/utils/constants/enums.dart';
import 'package:tasks/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            Text('Salue', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(width: 5),
            Text('SackoBA 👋', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        actions: [
          IconButton(
            style: Theme.of(context).iconButtonTheme.style,
            onPressed: () {},
            icon: Icon(
              Iconsax.notification_copy,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Text('Welcome to the Home Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
