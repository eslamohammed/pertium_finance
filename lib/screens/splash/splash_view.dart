
import 'package:flutter/material.dart';
import 'package:pretium_finance/utils/color_manager.dart';

import '../../utils/assets_manager.dart';
import '../../utils/constants.dart';
import '../../utils/routes.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _startAnimation(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: ColorManager.darkgreen,
        body: Center(
          child: AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget? child) {
                return Image.asset(
                  AssetsManager.splashScreen,
                  width: (size.height > size.width)
                      ? size.width * 0.3 
                      : size.height * 0.3 ,
                  height: (size.height > size.width)
                      ? size.width * 0.3
                      : size.height * 0.3 ,
                );
              }),
        ));
  }

  void _startAnimation(Function callback) {
    _animationController = AnimationController(
        vsync: this,
        duration:  Duration(milliseconds: Constants.splashDelay),
        animationBehavior: AnimationBehavior.preserve);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {
        if (_animationController.status == AnimationStatus.completed) {
          _navigateToHome();
        }
      });
    });
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed(Routes.onBoardingRoute);
  }

  @override
  void dispose() {
    _animationController.stop();
    _animationController.dispose();
    super.dispose();
  }
}

