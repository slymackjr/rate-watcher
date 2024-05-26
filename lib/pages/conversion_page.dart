import 'package:flutter/material.dart';

import '../pair_conversion.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({super.key});

  @override
  State<ConversionPage> createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  final TextEditingController _controller = TextEditingController();
  String _conversionResult = '';
  final String _apiKey = 'd18ab53713e43aec5f97c9f2';
  final String _baseCurrency = 'USD';
  final String _targetCurrency = 'TZS';

  void _convertCurrency() async {
    final double? amount = double.tryParse(_controller.text);
    if (amount != null) {
      try {
        final PairConversion conversion =
        await PairConversion.fetchData(_apiKey, _baseCurrency, _targetCurrency);
        final double result = amount * conversion.conversionRate;
        setState(() {
          _conversionResult =
          '$amount $_baseCurrency = ${result.toStringAsFixed(2)} $_targetCurrency';
        });
      } catch (e) {
        setState(() {
          _conversionResult = 'Error fetching conversion rate';
        });
      }
    } else {
      setState(() {
        _conversionResult = 'Invalid input';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: _controller,
                readOnly: true, // Disable editing and keyboard input
                decoration: const InputDecoration(
                  labelText: 'Enter USD',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNumericButton('1'),
                buildNumericButton('2'),
                buildNumericButton('3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNumericButton('4'),
                buildNumericButton('5'),
                buildNumericButton('6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNumericButton('7'),
                buildNumericButton('8'),
                buildNumericButton('9'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.text.isNotEmpty) {
                        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('⌫'), // Unicode for Backspace
                ),
                buildNumericButton('0'),
                ElevatedButton(
                  onPressed: () {
                    _controller.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('C'), // Clear all input
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertCurrency,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text('Convert'),
            ),
            const SizedBox(height: 16),
            Text(
              _conversionResult,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNumericButton(String label) {
    return ElevatedButton(
      onPressed: () {
        if (label != 'C' && label != '⌫') {
          _controller.text += label;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(label),
    );
  }
}






