// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<PageController> scrollController = PageController().obs;

  final List<String> _pages = [
    'home',
    'about',
    'contact',
    'location',
    'pricing',
  ];

  void createScrollController() {
    final index = (!_pages.contains(Get.parameters['section']!))
        ? 0
        : _pages.indexOf(Get.parameters['section']!);

    scrollController.value = PageController(initialPage: index);

    scrollController.value.addListener(() {
      if (scrollController.value.page!.round() != index) {
        final pageIndex = (scrollController.value.page ?? 0).round();
        html.window.history.pushState(null, 'none', '#/${_pages[pageIndex]}');
      }
    });
  }

  void goTo(int index) {
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.value.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
