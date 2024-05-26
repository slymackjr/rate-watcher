/*
import 'package:flutter/material.dart';

class ConversionPage extends StatelessWidget {
  const ConversionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'USD',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'GBP',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.white),
              ),
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Convert'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Currency Exchange',
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
*/
/*import 'package:flutter/material.dart';


class ConversionPage extends StatelessWidget {
  const ConversionPage({super.key});

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
            // Input field for currency (USD)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter USD',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                // Add your logic to handle input changes
              ),
            ),
            // Numeric keypad (you can customize this further)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNumericButton('1'),
                buildNumericButton('2'),
                buildNumericButton('3'),
              ],
            ),
            // Add more rows of numeric buttons as needed
            const SizedBox(height: 16),
            // Convert button
            ElevatedButton(
              onPressed: () {
                // Add your conversion logic here
                // For example, convert USD to EUR
              },
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create numeric buttons
  Widget buildNumericButton(String label) {
    return ElevatedButton(
      onPressed: () {
        // Add your logic to handle numeric button presses
      },
      child: Text(label),
    );
  }
}*/
/*import 'package:flutter/material.dart';

import '../pair_conversion.dart';
class ConversionPage extends StatefulWidget {
  const ConversionPage({super.key});

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  final TextEditingController _controller = TextEditingController();
  String _conversionResult = '';
  final String _apiKey = 'd18ab53713e43aec5f97c9f2';
  final String _baseCurrency = 'USD';
  final String _targetCurrency = 'EUR';

  void _convertCurrency() async {
    final double? amount = double.tryParse(_controller.text);
    if (amount != null) {
      try {
        final PairConversion conversion = await PairConversion.fetchData(_apiKey, _baseCurrency, _targetCurrency);
        final double result = amount * conversion.conversionRate;
        setState(() {
          _conversionResult = '$amount $_baseCurrency = ${result.toStringAsFixed(2)} $_targetCurrency';
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
                buildNumericButton('.'),
                buildNumericButton('0'),
                buildNumericButton('C'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertCurrency,
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
        if (label == 'C') {
          _controller.clear();
        } else {
          _controller.text += label;
        }
      },
      child: Text(label),
    );
  }
}*/
/*
import 'package:flutter/material.dart';

import '../pair_conversion.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({Key? key}) : super(key: key);

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  final TextEditingController _controller = TextEditingController();
  String _conversionResult = '';
  final String _apiKey = 'd18ab53713e43aec5f97c9f2';
  final String _baseCurrency = 'USD';
  final String _targetCurrency = 'EUR';

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
                buildNumericButton('.'),
                buildNumericButton('0'),
                buildNumericButton('C'),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convertCurrency,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor, // Use the theme's primary color
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
        if (label == 'C') {
          _controller.clear();
        } else {
          _controller.text += label;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor, // Use the theme's primary color
      ),
      child: Text(label),
    );
  }
}
*/
/*import 'package:flutter/material.dart';

import '../pair_conversion.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({Key? key}) : super(key: key);

  @override
  _ConversionPageState createState() => _ConversionPageState();
}

class _ConversionPageState extends State<ConversionPage> {
  final TextEditingController _controller = TextEditingController();
  String _conversionResult = '';
  final String _apiKey = 'd18ab53713e43aec5f97c9f2';
  final String _baseCurrency = 'USD';
  final String _targetCurrency = 'EUR';

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
                buildNumericButton('.'),
                buildNumericButton('0'),
                buildNumericButton('C'),
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
        if (label == 'C') {
          _controller.clear();
        } else {
          _controller.text += label;
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      child: Text(label),
    );
  }
}*/
import 'package:flutter/material.dart';

import '../pair_conversion.dart';

class ConversionPage extends StatefulWidget {
  const ConversionPage({Key? key}) : super(key: key);

  @override
  _ConversionPageState createState() => _ConversionPageState();
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



