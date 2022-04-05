import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/custom_menu.dart';

import 'about_view.dart';
import 'contact_view.dart';
import 'home_view.dart';
import 'location_view.dart';
import 'pricing_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.createScrollController();

    return Scaffold(
      body: Container(
        decoration: _buildBoxDecoration(),
        child: Stack(
          children: const <Widget>[
            _HomeBody(),
            Positioned(
              right: 20,
              top: 20,
              child: CustomMenu(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5],
          colors: [
            Colors.pink,
            Colors.deepOrange,
          ],
        ),
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController _controller = Get.find();

    return PageView(
      controller: _controller.scrollController.value,
      scrollDirection: Axis.vertical,
      children: const <Widget>[
        HomeView(),
        AboutView(),
        ContactView(),
        LocationView(),
        PricingView(),
      ],
    );
  }
}
