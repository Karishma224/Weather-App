import 'package:flutter/material.dart';
import 'package:weather/utils/constants.dart';
import 'package:weather/view/widgets/components/frosted_container.dart';

import '../../../utils/constants.dart';
import 'frosted_container.dart';

class VerticalContainer extends StatelessWidget {
  final String label, value;
  final String imagePath;

  const VerticalContainer(
      {super.key,
        required this.label,
        required this.value,
        required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return FrostedContainer(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
            ),
            Flexible( // Makes the text widget flexible
              child: Text(
                label,
                style: lightTitleTextStyle,
                overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow visually
              ),
            ),
            Flexible( // Makes the text widget flexible
              child: Text(
                value,
                style: titleTextStyle,
                overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow visually
              ),
            ),
          ],
        ),
      ),
    );
  }
}