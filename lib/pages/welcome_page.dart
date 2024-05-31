import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rate_watcher/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  Timer? _timer;

  final List<Map<String, String>> splashData = [
    {
      "title": "Effortless Currency Management",
      "description": "Stay informed and manage your currencies effortlessly with Rate Watcher.",
      "image": 'assets/image-1.jpg',
    },
    {
      "title": "Secure and Reliable Transactions",
      "description": "Rest easy knowing that your transactions are secure and reliable.",
      "image": 'assets/image-2.jpg',
    },
    {
      "title": "Insightful Currency Analytics",
      "description": "Gain valuable insights into currency trends and fluctuations with Rate Watcher.",
      "image": 'assets/image-3.jpg',
    },
  ];



  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % splashData.length;
        });
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
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
                  splashData[index]['image'] ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Image not found', style: TextStyle(color: Colors.red)));
                  },
                ),
              ),
              Positioned(
                top: 150,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      splashData[index]['title'] ?? '',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 50, // Customize the font size here
                        fontWeight: FontWeight.bold, // Adjust font weight
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      splashData[index]['description'] ?? '',
                      style: const TextStyle(
                        fontSize: 26, // Customize the font size here
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                bottom: 100,
                right: 20,
                child: ResponsiveButton(
                  width: 120,
                  onPressed: () {
                    context.go('/main');
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
