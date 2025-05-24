import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../common/widgets/custom_text_form_field.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            'Profile',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: TSizes.spaceBtwSections),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(TImages.user),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Center(
              child: Text(
                'Sacko Badra',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections),
            Text('Général', style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'Total des tâches :',
                    style: Theme.of(context).textTheme.titleMedium,
                    hintText: '',
                    enable: false,
                    prefixIcon: Icon(Icons.all_inbox_sharp),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: TSizes.defaultSpace - 8),
                      child: Text(
                        '140',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'Tâches en cours :',
                    style: Theme.of(context).textTheme.titleMedium,
                    hintText: '',
                    enable: false,
                    prefixIcon: Icon(Iconsax.calendar_1_copy),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: TSizes.defaultSpace - 8),
                      child: Text(
                        '30',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'Tâches en Attente :',
                    style: Theme.of(context).textTheme.titleMedium,
                    hintText: '',
                    enable: false,
                    prefixIcon: Icon(Icons.pending_outlined),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: TSizes.defaultSpace - 8),
                      child: Text(
                        '40',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'Tâches Terminées :',
                    style: Theme.of(context).textTheme.titleMedium,
                    hintText: '',
                    enable: false,
                    prefixIcon: Icon(Icons.done_all_sharp),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(top: TSizes.defaultSpace - 8),
                      child: Text(
                        '70',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
