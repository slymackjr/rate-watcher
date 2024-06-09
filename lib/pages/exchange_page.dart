import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_flags/country_flags.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../standard_response.dart';
import '../currency_provider.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({super.key});

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  final String apiKey = 'd18ab53713e43aec5f97c9f2';
  late Future<Map<String, double>> _conversionRates;
  bool _isRefreshing = false;

  @override
  void initState() {
    super.initState();
    _conversionRates = fetchConversionRates();
  }

  Future<Map<String, double>> fetchConversionRates() async {
    String conversionFor = context.read<CurrencyProvider>().selectedCurrency;
    try {
      final response = await StandardResponse.fetchData(apiKey, conversionFor);
      return response.getConversionRatesFor(['EUR', 'USD', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF']);

    } catch (e) {
      throw Exception('Failed to load conversion rates');
    }
  }

  final Map<String, String> currencyToCountry = {
    'EUR': 'FR',
    'USD': 'US',
    'GBP': 'GB',
    'PLN': 'PL',
    'KES': 'KE',
    'BIF': 'BI',
    'ZMW': 'ZM',
    'TZS': 'TZ',
    'MWK': 'MW',
    'RWF': 'RW',
  };

  void _refreshRates() async {
    setState(() {
      _isRefreshing = true;
    });

    try {
      final newRates = await fetchConversionRates();
      setState(() {
        _conversionRates = Future.value(newRates);
        _isRefreshing = false;
      });
    } catch (e) {
      setState(() {
        _conversionRates = Future.error(e);
        _isRefreshing = false;
      });
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
                const SizedBox(height: 56),
                Expanded(
                  child: FutureBuilder<Map<String, double>>(
                    future: _conversionRates,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                          child: Text(
                            'No data available',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else {
                        final rates = snapshot.data!;
                        return ListView(
                          children: rates.entries.map((entry) {
                            return ExchangeRateTile(
                              currencyPair:
                              '${context.read<CurrencyProvider>().selectedCurrency} -> ${entry.key}',
                              rate: '${entry.value.toStringAsFixed(2)} ${entry.key}',
                              change: '', // Placeholder for change, could be updated if change data is available
                              countryCode:
                              currencyToCountry[entry.key] ?? 'US', // Default to 'US' if no mapping found
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
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          _isRefreshing
              ? const CircularProgressIndicator(color: Colors.white)
              : IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _refreshRates,
          ),
        ],
      ),
    );
  }
}

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
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: ClipOval(
            child: CountryFlag.fromCountryCode(
              countryCode,
              height: 40,
              width: 40,
            ),
          ),
          title: Row(
            children: [
              Text(
                currencyPair.split(' -> ')[0],
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const FaIcon(
                FontAwesomeIcons.rightLeft,
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                currencyPair.split(' -> ')[1],
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          subtitle: Text('Change: $change', style: const TextStyle(color: Colors.white60)),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              rate,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
