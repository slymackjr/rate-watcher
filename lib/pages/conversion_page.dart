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

  String _baseCurrency = 'USD'; // Default base currency
  String _targetCurrency = 'TZS'; // Default target currency

  final List<String> _supportedCurrencies = [
    'USD', 'EUR', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF'
  ];

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
                  labelText: 'Enter Amount',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: _baseCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _baseCurrency = newValue!;
                    });
                  },
                  items: _supportedCurrencies.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.compare_arrows),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: _targetCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _targetCurrency = newValue!;
                    });
                  },
                  items: _supportedCurrencies.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
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
                    setState(() {
                      _controller.clear();
                    });
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
            _conversionResult.isNotEmpty
                ? Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  _conversionResult,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget buildNumericButton(String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _controller.text += label;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(label),
    );
  }
}
