import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../../view_model/controller/global_controller.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/current_temp_widget.dart';
import '../widgets/footer_widget.dart';
import '../widgets/info_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController());

  Future<void> _refreshData() async {
    await globalController.getLocationAndFetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator.adaptive(
        onRefresh: _refreshData,
        child: Obx(
              () => globalController.checkLoading().isTrue
              ? const Center(
            child: CircularProgressIndicator(),
          )
              : Container(
            decoration: BoxDecoration(
              gradient:
              Utils.getBackgroundGradient(globalController.weatherMain),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                children: const [
                  AppbarWidget(),
                  CurrentTempWidget(),
                  InfoWidget(),
                  FooterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}