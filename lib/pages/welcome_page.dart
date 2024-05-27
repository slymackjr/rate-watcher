import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rate_watcher/widgets/app_large_text.dart';
import 'package:rate_watcher/widgets/app_text.dart';
import 'package:rate_watcher/widgets/responsive_button.dart';

import '../main.dart';

class WelcomePage extends StatefulWidget {

  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  List<Map<String, String>> splashData = [
    {
      "title": "Easy Cryptocurrency Exchange",
      "description": "Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nibh euismod.",
      "image": 'assets/image-1.jpg',
    },
    {
      "title": "Secure Transactions",
      "description": "Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nibh euismod.",
      "image": 'assets/image-2.jpg',
    },
    {
      "title": "Best Currency Analytics",
      "description": "Lorem ipsum Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nibh euismod.",
      "image": 'assets/image-3.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_currentIndex < splashData.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        setState(() {
          _currentIndex = 0;
        });
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: splashData.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (_, index) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  splashData[index]['image']!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: splashData[index]['title']!, color: Colors.white),
                    const SizedBox(height: 10),
                    AppText(text: splashData[index]['description']!, size: 18, color: Colors.white),
                  ],
                ),
              ),
              Positioned(
                bottom: 100,
                right: 20,
                child: ResponsiveButton(
                  width: 120,
                  text: '',
                  onPressed: () {
                    context.go('/main');
                    //const MainPage();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}





