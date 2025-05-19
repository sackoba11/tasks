import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:tasks/utils/constants/text_strings.dart';
import 'package:universal_stepper/universal_stepper.dart';

import '../../models/task.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/routes.dart';
import '../../utils/constants/sizes.dart';
import '../add_task/widgets/custom_text_form_field.dart';
import 'widgets/custom_row_item.dart';

class DetailsTask extends StatelessWidget {
  const DetailsTask({super.key, required this.task});

  final Task task;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return WillPopScope(
      onWillPop: () async {
        context.go(Routes.home);
        return false;
      },
      child: Scaffold(
        backgroundColor: TColors.cardTaskColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Iconsax.arrow_left_copy, color: TColors.black),
            onPressed: () => context.go(Routes.home),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.share_outlined, color: TColors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Iconsax.edit_2_copy, color: TColors.black),
              onPressed: () {},
            ),
          ],
          actionsPadding: EdgeInsets.only(right: TSizes.spaceAppBar),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: SizedBox(
                height: size.height * 0.34,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Center(
                      child: Text(
                        task.title,
                        style: Theme.of(context).textTheme.headlineMedium!
                            .copyWith(color: TColors.black),
                      ),
                    ),
                    CustomRowItem(
                      title: 'Date Debut: ',
                      value:
                          '${TTexts.days[task.createdAt.weekday - 1]}, ${task.createdAt.day} ${TTexts.month[task.createdAt.month - 1]} ${task.createdAt.year}',
                    ),

                    CustomRowItem(
                      title: 'Date Fin : ',
                      value:
                          '${TTexts.days[task.dueDate.weekday - 1]}, ${task.dueDate.day} ${TTexts.month[task.dueDate.month - 1]} ${task.dueDate.year}',
                    ),
                    CustomRowItem(
                      title: 'Temps',
                      value:
                          '${task.createdAt.hour}:${task.createdAt.minute} - ${task.dueDate.copyWith(hour: 20).hour}:${task.dueDate.minute} ${task.dueDate.timeZoneName}',
                    ),
                    CustomRowItem(
                      title: 'Étiquette :',
                      value: '${task.tags.map((tag) => tag.name).toList()}',
                    ),
                    SizedBox(height: size.height * 0.02),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.5478,
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: TSizes.spaceBtwSections),
                      Text(
                        'Description',
                        style: Theme.of(context).textTheme.bodySmall!,
                      ),
                      CustomTextFormField(
                        labelText: task.description,
                        hintText: '',
                        enable: false,
                        maxLines: 5,
                        style: Theme.of(context).textTheme.bodyMedium,
                        keyboardType: TextInputType.multiline,
                      ),
                      SizedBox(height: TSizes.spaceBtwItems),
                      UniversalStepper(
                        elementCount: task.subtasks.length,
                        stepperDirection: Axis.vertical,
                        elementBuilder: (context, index) {
                          return Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 10,
                                    top: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        task.subtasks[index].title,
                                        style:
                                            Theme.of(
                                              context,
                                            ).textTheme.labelLarge,
                                        overflow: TextOverflow.clip,
                                      ),
                                      SizedBox(
                                        width: size.width * .64,
                                        child: Text(
                                          task.subtasks[index].description,
                                          style:
                                              Theme.of(
                                                context,
                                              ).textTheme.bodySmall,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // IconButton(
                                //   onPressed: () {
                                //     setState(() {
                                //       stepperData.removeAt(index);
                                //     });
                                //   },
                                //   icon: Icon(Iconsax.close_circle_copy, size: 32),
                                // ),
                              ],
                            ),
                          );
                        },
                        badgeBuilder: (context, index) {
                          return Container(
                            width: 30,
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: TColors.success,
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: FittedBox(
                              child: Icon(
                                Icons.check_circle_outline_sharp,
                                color: TColors.white,
                              ),
                            ),
                          );
                        },
                        pathBuilder: (context, index) {
                          return Container(
                            color:
                                index == task.subtasks.length
                                    ? Colors.transparent
                                    : index == 0
                                    ? Colors.transparent
                                    : TColors.success,
                            width: 4,
                          );
                        },
                        subPathBuilder: (context, index) {
                          return Container(
                            color:
                                index == task.subtasks.length - 1
                                    ? Colors.transparent
                                    : TColors.success,
                            width: 4,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
