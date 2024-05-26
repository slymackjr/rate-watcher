import 'package:flutter/material.dart';
import 'package:rate_watcher/standard_response.dart';

import 'image_source.dart';

class ExchangeDetail extends StatefulWidget {
  final StandardResponse standardResponse;
  final String countryCode; // Added countryCode to receive the passed value
  const ExchangeDetail({super.key, required this.standardResponse, required this.countryCode});

  @override
  State<ExchangeDetail> createState() => _ExchangeDetailState();
}

class _ExchangeDetailState extends State<ExchangeDetail> {
  late ImageSource imageSource; // Declare imageSource variable

  @override
  void initState() {
    super.initState();
    // Initialize imageSource with the passed countryCode and desired style and size
    imageSource = ImageSource(countryCode: widget.countryCode, style: 'shiny', size: 180);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.standardResponse.baseCode),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: NetworkImage(imageSource.buildUrl()), // Fetch and display the image using buildUrl
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.standardResponse.baseCode,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.standardResponse.conversionRates.length,
                itemBuilder: (BuildContext context, int index) {
                  final rates = widget.standardResponse.conversionRates;
                  return Text(rates.toString());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
