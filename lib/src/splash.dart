import 'package:flutter/material.dart';

import '../auth.dart';

class SplashAnimationScreen extends StatefulWidget {
  @override
  _SplashAnimationScreenState createState() => _SplashAnimationScreenState();
}

class _SplashAnimationScreenState extends State<SplashAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // 애니메이션 지속 시간 설정
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.1), // 시작 위치
      end: Offset(0, -0.2), // 종료 위치
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut, // 애니메이션 곡선 설정
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward(); // 애니메이션 시작

    // 3초 후에 AuthScreen으로 이동
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthGate()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // 애니메이션 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: FractionalTranslation(
              translation: _slideAnimation.value,
              child: Center(
                child: Image.asset('assets/Logo.png'), // 스플래시 이미지 경로
              ),
            ),
          );
        },
      ),
    );
  }
}
