import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class TaskCompletedScreen extends StatelessWidget {
  const TaskCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: TSizes.spaceAppBar,
            top: TSizes.spaceAppBar,
          ),
          child: Text(
            'Tâches Terminées',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
        
      ],),
      ),
    );
  }
}
