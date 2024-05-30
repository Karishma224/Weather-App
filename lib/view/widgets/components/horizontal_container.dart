import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import 'frosted_container.dart';

class HorizontalContainer extends StatelessWidget {
  final String label, value;
  final String imagePath;

  const HorizontalContainer({
    Key? key, // Add Key parameter
    required this.label,
    required this.value,
    required this.imagePath,
  }) : super(key: key); // Pass the key to super constructor

  @override
  Widget build(BuildContext context) {
    return FrostedContainer(
      height: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded( // Wrap Image.asset with Expanded
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(width: 20), // Add some space between the image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: lightTitleTextStyle,
                ),
                Text(
                  value,
                  style: titleTextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
