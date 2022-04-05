import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

import 'custom_menu_item.dart';

class CustomMenu extends StatefulWidget {
  const CustomMenu({Key? key}) : super(key: key);

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();

    return Container(
      width: 150,
      height: _isOpen ? 308 : 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.black,
      child: Column(
        children: <Widget>[
          _MenuTitle(
            isOpen: _isOpen,
            controller: _controller,
            callback: () => setState(() => _isOpen = !_isOpen),
          ),
          if (_isOpen) ...[
            CustomMenuItem(
              text: 'Home',
              onPressed: () => _homeController.goTo(0),
              delay: 0,
            ),
            CustomMenuItem(
              text: 'About',
              onPressed: () => _homeController.goTo(1),
              delay: 20,
            ),
            CustomMenuItem(
              text: 'Contact',
              onPressed: () => _homeController.goTo(2),
              delay: 40,
            ),
            CustomMenuItem(
              text: 'Location',
              onPressed: () => _homeController.goTo(3),
              delay: 60,
            ),
            CustomMenuItem(
              text: 'Pricing',
              onPressed: () => _homeController.goTo(4),
              delay: 80,
            ),
            const SizedBox(height: 8),
          ]
        ],
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  final bool _isOpen;
  final AnimationController _controller;
  final VoidCallback _callback;

  const _MenuTitle({
    Key? key,
    required bool isOpen,
    required AnimationController controller,
    required VoidCallback callback,
  })  : _isOpen = isOpen,
        _controller = controller,
        _callback = callback,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: <Widget>[
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: _isOpen ? 40 : 0,
          ),
          Text(
            'Menú',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              color: Colors.white,
              progress: _controller,
            ),
            onPressed: () {
              if (_isOpen) {
                _controller.reverse();
              } else {
                _controller.forward();
              }

              _callback();
            },
          ),
        ],
      ),
    );
  }
}
