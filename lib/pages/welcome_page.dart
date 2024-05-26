import 'package:flutter/material.dart';
import 'package:rate_watcher/widgets/app_large_text.dart';
import 'package:rate_watcher/widgets/app_text.dart';
import 'package:rate_watcher/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'assets/image-1.jpg',
    'assets/image-2.jpg',
    'assets/image-3.jpg',
    'assets/image-4.jpg',
    'assets/image-5.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_,index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  images[index]
                ),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Rate Watcher"),
                      AppText(text: "Exchange Rates", size: 30, color: Colors.white,),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text: "Currency Exchange Rates and more to explore, get ready",
                          color: Colors.white,
                          size: 18,),
                      ),
                      const SizedBox(height: 40,),
                      ResponsiveButton(width: 120,)
                    ],
                  ),
                  Column(
                    children: List.generate(5, (indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: 9,
                        height: index == indexDots ? 40 : 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots ?Colors.deepOrange : Colors.deepOrange.withOpacity(0.3)
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
