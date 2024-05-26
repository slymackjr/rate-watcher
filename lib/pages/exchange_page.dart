/*
import 'package:flutter/material.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

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
            const ExchangeRateTile(currencyPair: 'USD -> EUR', rate: '0.91 €', change: '+0.2%'),
            const ExchangeRateTile(currencyPair: 'USD -> GBP', rate: '0.71 £', change: '-0.1%'),
            const ExchangeRateTile(currencyPair: 'USD -> PLN', rate: '3.73 zł', change: '+0.3%'),
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
          'Exchange',
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
        ),
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}

class ExchangeRateTile extends StatelessWidget {
  final String currencyPair;
  final String rate;
  final String change;

  const ExchangeRateTile({
    required this.currencyPair,
    required this.rate,
    required this.change,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        tileColor: Colors.white24,
        leading: const Icon(Icons.attach_money, color: Colors.white),
        title: Text(currencyPair, style: const TextStyle(color: Colors.white)),
        subtitle: Text('Change: $change', style: const TextStyle(color: Colors.white60)),
        trailing: Text(rate, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';

import '../standard_response.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final String apiKey = 'd18ab53713e43aec5f97c9f2';
  final String conversionFor = 'USD';
  late Future<Map<String, double>> _conversionRates;

  @override
  void initState() {
    super.initState();
    _conversionRates = fetchConversionRates();
  }

  Future<Map<String, double>> fetchConversionRates() async {
    try {
      final response = await StandardResponse.fetchData(apiKey, conversionFor);
      return response.getConversionRatesFor(['EUR', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF']);
    } catch (e) {
      throw Exception('Failed to load conversion rates');
    }
  }

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
            Expanded(
              child: FutureBuilder<Map<String, double>>(
                future: _conversionRates,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  } else {
                    final rates = snapshot.data!;
                    return ListView(
                      children: rates.entries.map((entry) {
                        return ExchangeRateTile(
                          currencyPair: 'USD -> ${entry.key}',
                          rate: '${entry.value.toStringAsFixed(2)} ${entry.key}',
                          change: '', // Placeholder for change, could be updated if change data is available
                        );
                      }).toList(),
                    );
                  }
                },
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
          'Exchange',
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
        ),
        IconButton(
          icon: const Icon(Icons.refresh, color: Colors.white),
          onPressed: () {
            setState(() {
              _conversionRates = fetchConversionRates();
            });
          },
        ),
      ],
    );
  }
}

// ExchangeRateTile class
class ExchangeRateTile extends StatelessWidget {
  final String currencyPair;
  final String rate;
  final String change;

  const ExchangeRateTile({
    required this.currencyPair,
    required this.rate,
    required this.change,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        tileColor: Colors.white24,
        leading: const Icon(Icons.attach_money, color: Colors.white),
        title: Text(currencyPair, style: const TextStyle(color: Colors.white)),
        subtitle: Text('Change: $change', style: const TextStyle(color: Colors.white60)),
        trailing: Text(rate, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import '../standard_response.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final String apiKey = 'd18ab53713e43aec5f97c9f2';
  final String conversionFor = 'USD';
  late Future<Map<String, double>> _conversionRates;

  @override
  void initState() {
    super.initState();
    _conversionRates = fetchConversionRates();
  }

  Future<Map<String, double>> fetchConversionRates() async {
    try {
      final response = await StandardResponse.fetchData(apiKey, conversionFor);
      return response.getConversionRatesFor(['EUR', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF']);
    } catch (e) {
      throw Exception('Failed to load conversion rates');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 56), // Space for the top bar
                Expanded(
                  child: FutureBuilder<Map<String, double>>(
                    future: _conversionRates,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
                      } else {
                        final rates = snapshot.data!;
                        return ListView(
                          children: rates.entries.map((entry) {
                            return ExchangeRateTile(
                              currencyPair: 'USD -> ${entry.key}',
                              rate: '${entry.value.toStringAsFixed(2)} ${entry.key}',
                              change: '', // Placeholder for change, could be updated if change data is available
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Exchange',
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() {
                _conversionRates = fetchConversionRates();
              });
            },
          ),
        ],
      ),
    );
  }
}

// ExchangeRateTile class
class ExchangeRateTile extends StatelessWidget {
  final String currencyPair;
  final String rate;
  final String change;

  const ExchangeRateTile({
    required this.currencyPair,
    required this.rate,
    required this.change,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        tileColor: Colors.white24,
        leading: const Icon(Icons.attach_money, color: Colors.white),
        title: Text(currencyPair, style: const TextStyle(color: Colors.white)),
        subtitle: Text('Change: $change', style: const TextStyle(color: Colors.white60)),
        trailing: Text(rate, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart'; // Assuming you have a package for displaying country flags

import '../standard_response.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  _ExchangePageState createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final String apiKey = 'd18ab53713e43aec5f97c9f2';
  final String conversionFor = 'USD';
  late Future<Map<String, double>> _conversionRates;

  @override
  void initState() {
    super.initState();
    _conversionRates = fetchConversionRates();
  }

  Future<Map<String, double>> fetchConversionRates() async {
    try {
      final response = await StandardResponse.fetchData(apiKey, conversionFor);
      return response.getConversionRatesFor(['EUR', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF']);
    } catch (e) {
      throw Exception('Failed to load conversion rates');
    }
  }

  // Mapping currency codes to country codes
  final Map<String, String> currencyToCountry = {
    'EUR': 'FR',
    'GBP': 'GB',
    'PLN': 'PL',
    'KES': 'KE',
    'BIF': 'BI',
    'ZMW': 'ZM',
    'TZS': 'TZ',
    'MWK': 'MW',
    'RWF': 'RW',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 56), // Space for the top bar
                Expanded(
                  child: FutureBuilder<Map<String, double>>(
                    future: _conversionRates,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.white)));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(child: Text('No data available', style: TextStyle(color: Colors.white)));
                      } else {
                        final rates = snapshot.data!;
                        return ListView(
                          children: rates.entries.map((entry) {
                            return ExchangeRateTile(
                              currencyPair: 'USD -> ${entry.key}',
                              rate: '${entry.value.toStringAsFixed(2)} ${entry.key}',
                              change: '', // Placeholder for change, could be updated if change data is available
                              countryCode: currencyToCountry[entry.key] ?? 'US', // Default to 'US' if no mapping found
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildTopBar(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Exchange',
            style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() {
                _conversionRates = fetchConversionRates();
              });
            },
          ),
        ],
      ),
    );
  }
}

// ExchangeRateTile class
class ExchangeRateTile extends StatelessWidget {
  final String currencyPair;
  final String rate;
  final String change;
  final String countryCode;

  const ExchangeRateTile({
    required this.currencyPair,
    required this.rate,
    required this.change,
    required this.countryCode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        tileColor: Colors.white24,
        leading: CountryFlag.fromCountryCode(
          countryCode, // Pass the country code as a positional argument
          height: 30, // Adjust the height as needed
          width: 30, // Adjust the width as needed
          borderRadius: 8.0, // Optional: Add border radius
        ),
        title: Text(currencyPair, style: const TextStyle(color: Colors.white)),
        subtitle: Text('Change: $change', style: const TextStyle(color: Colors.white60)),
        trailing: Text(rate, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}


