import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/res/images/image_assets.dart';
import 'package:weather/view/widgets/components/frosted_container.dart';
import 'package:weather/view/widgets/components/horizontal_container.dart';
import 'package:weather/view/widgets/components/info_row.dart';
import 'package:weather/view/widgets/components/vertical_container.dart';
import 'package:weather/view_model/controller/global_controller.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(GlobalController());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: VerticalContainer(
                      label: 'Sunrise',
                      value: globalController.sunriseTime(),
                      imagePath: ImageAssets.sunrise,
                    ),
                  ),
                  SizedBox(width: 8), // Added SizedBox for spacing
                  Expanded(
                    child: VerticalContainer(
                      label: 'Sunset',
                      value: globalController.sunsetTime(),
                      imagePath: ImageAssets.sunset,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8), // Added SizedBox for spacing
              HorizontalContainer(
                label: globalController.windDirection(),
                value: globalController.windSpeed(),
                imagePath: ImageAssets.wind,
              ),
            ],
          ),
        ),
        SizedBox(width: 8), // Added SizedBox for spacing
        Expanded(
          child: FrostedContainer(
            height: 170,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoRow(
                      label: 'Real Feel',
                      value: '${globalController.feelsLike()} °C',
                    ),
                    InfoRow(
                      label: 'Pressure',
                      value: globalController.pressure(),
                    ),
                    InfoRow(
                      label: 'Humidity',
                      value: globalController.humidity(),
                    ),
                    InfoRow(
                      label: 'Visibility',
                      value: globalController.visibility(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
