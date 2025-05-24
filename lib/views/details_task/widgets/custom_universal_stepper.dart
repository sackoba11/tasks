import 'package:flutter/material.dart';
import 'package:universal_stepper/universal_stepper.dart';

import '../../../models/sub_task.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CustomUniversalStepper extends StatelessWidget {
  const CustomUniversalStepper({
    super.key,
    required this.subtasks,
    required this.width,
  });

  final List<SubTask> subtasks;
  final double width;

  @override
  Widget build(BuildContext context) {
    return UniversalStepper(
      elementCount: subtasks.length,
      stepperDirection: Axis.vertical,
      elementBuilder: (context, index) {
        return Expanded(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * .77,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subtasks[index].title,
                            style: Theme.of(context).textTheme.bodyLarge,
                            overflow: TextOverflow.clip,
                          ),

                          Icon(
                            subtasks[index].isDone
                                ? Icons.check_circle_outline
                                : Icons.circle_outlined,
                            color:
                                subtasks[index].isDone
                                    ? TColors.success
                                    : TColors.darkGrey,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: TSizes.sm),
                    SizedBox(
                      width: width * .77,
                      child: Text(
                        subtasks[index].description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
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
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: FittedBox(
            child: Icon(Icons.check_circle_outline_sharp, color: TColors.white),
          ),
        );
      },
      pathBuilder: (context, index) {
        return Container(
          color:
              index == subtasks.length
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
              index == subtasks.length - 1
                  ? Colors.transparent
                  : TColors.success,
          width: 4,
        );
      },
    );
  }
}
