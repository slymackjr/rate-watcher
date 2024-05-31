/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_flags/country_flags.dart';
import '../supported_code.dart';
import '../currency_provider.dart'; // Your provider class file

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  SupportedCode? supportedCode;
  final Map<String, dynamic> currencyInfo = {
    'USD': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/US/flat/64.png',
      'country': '',
      'countryCode': 'US'
    },
    'EUR': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/EU/flat/64.png',
      'country': '',
      'countryCode': 'FR'
    },
    'GBP': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/GB/flat/64.png',
      'country': '',
      'countryCode': 'GB'
    },
    'PLN': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/PL/flat/64.png',
      'country': '',
      'countryCode': 'PL'
    },
    'KES': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/KE/flat/64.png',
      'country': '',
      'countryCode': 'KE'
    },
    'BIF': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/BI/flat/64.png',
      'country': '',
      'countryCode': 'BI'
    },
    'ZMW': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/ZM/flat/64.png',
      'country': '',
      'countryCode': 'ZM'
    },
    'TZS': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/TZ/flat/64.png',
      'country': '',
      'countryCode': 'TZ'
    },
    'MWK': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/MW/flat/64.png',
      'country': '',
      'countryCode': 'MW'
    },
    'RWF': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/RW/flat/64.png',
      'country': '',
      'countryCode': 'RW'
    },
  };

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String apiKey = 'd18ab53713e43aec5f97c9f2'; // Setting the API key

    try {
      SupportedCode supportedCode = await SupportedCode.fetchData(apiKey);

      setState(() {
        currencyInfo.forEach((key, value) {
          String? countryData = supportedCode.getNameForKey(key);
          if (countryData.isNotEmpty) {
            currencyInfo[key]['country'] = countryData;
          } else {
            currencyInfo[key]['country'] = 'N/A';
          }
        });
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      } // Handling errors
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedCurrency = context.watch<CurrencyProvider>().selectedCurrency;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            const SizedBox(height: 16),
            _buildCurrencySelector(context),
            const SizedBox(height: 16),
            _buildBalanceCircle(context, selectedCurrency),
            const SizedBox(height: 16),
            Text(
              'Overview',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            _buildCurrencyOverview(context, selectedCurrency),
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
          'Account',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrencySelector(BuildContext context) {
    final currencies = ['USD', 'EUR', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF'];
    final currencyProvider = context.read<CurrencyProvider>();

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          final currency = currencies[index];
          final isSelected = currencyProvider.selectedCurrency == currency;
          return GestureDetector(
            onTap: () {
              currencyProvider.setSelectedCurrency(currency);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    currency,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4.0),
                      height: 2,
                      width: 20,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBalanceCircle(BuildContext context, String selectedCurrency) {
    final currencyData = currencyInfo[selectedCurrency];
    if (currencyData == null) {
      return const Center(child: Text('Currency data not available', style: TextStyle(color: Colors.white)));
    }
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                  Colors.pink,
                  Colors.blue,
                ],
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown, // This scales down the content to fit within the circle
            child: Column(
              mainAxisSize: MainAxisSize.min, // This makes the column take the minimum space required
              children: [
                Text(
                  selectedCurrency,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${currencyData['balance']}',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 6),
                    CountryFlag.fromCountryCode(
                      currencyData['countryCode'],
                      height: 30,
                      width: 30,
                      borderRadius: 8.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyOverview(BuildContext context, String selectedCurrency) {
    final currencyData = currencyInfo[selectedCurrency];
    if (currencyData == null) {
      return const Center(child: Text('Currency data not available', style: TextStyle(color: Colors.white)));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country: ${currencyData['country']}',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Center(
          child: CountryFlag.fromCountryCode(
            currencyData['countryCode'],
            height: 150,
            width: 150,
            borderRadius: 8.0,
          ),
        ),
      ],
    );
  }
}
*/
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:country_flags/country_flags.dart';
import '../supported_code.dart';
import '../currency_provider.dart'; // Your provider class file

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  SupportedCode? supportedCode;
  final Map<String, dynamic> currencyInfo = {
    'USD': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/US/flat/64.png',
      'country': '',
      'countryCode': 'US'
    },
    'EUR': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/EU/flat/64.png',
      'country': '',
      'countryCode': 'FR'
    },
    'GBP': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/GB/flat/64.png',
      'country': '',
      'countryCode': 'GB'
    },
    'PLN': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/PL/flat/64.png',
      'country': '',
      'countryCode': 'PL'
    },
    'KES': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/KE/flat/64.png',
      'country': '',
      'countryCode': 'KE'
    },
    'BIF': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/BI/flat/64.png',
      'country': '',
      'countryCode': 'BI'
    },
    'ZMW': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/ZM/flat/64.png',
      'country': '',
      'countryCode': 'ZM'
    },
    'TZS': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/TZ/flat/64.png',
      'country': '',
      'countryCode': 'TZ'
    },
    'MWK': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/MW/flat/64.png',
      'country': '',
      'countryCode': 'MW'
    },
    'RWF': {
      'balance': '1',
      'flagUrl': 'https://flagsapi.com/RW/flat/64.png',
      'country': '',
      'countryCode': 'RW'
    },
  };

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String apiKey = 'd18ab53713e43aec5f97c9f2'; // Setting the API key

    try {
      SupportedCode supportedCode = await SupportedCode.fetchData(apiKey);

      setState(() {
        currencyInfo.forEach((key, value) {
          String? countryData = supportedCode.getNameForKey(key);
          if (countryData.isNotEmpty) {
            currencyInfo[key]['country'] = countryData;
          } else {
            currencyInfo[key]['country'] = 'N/A';
          }
        });
      });
    } catch (error) {
      if (kDebugMode) {
        print(error);
      } // Handling errors
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedCurrency = context.watch<CurrencyProvider>().selectedCurrency;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            const SizedBox(height: 16),
            _buildCurrencySelector(context),
            const SizedBox(height: 16),
            _buildBalanceCircle(context, selectedCurrency),
            const SizedBox(height: 16),
            Text(
              'Overview',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            _buildCurrencyOverview(context, selectedCurrency),
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
          'Account',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCurrencySelector(BuildContext context) {
    final currencies = ['USD', 'EUR', 'GBP', 'PLN', 'KES', 'BIF', 'ZMW', 'TZS', 'MWK', 'RWF'];
    final currencyProvider = context.read<CurrencyProvider>();

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          final currency = currencies[index];
          final isSelected = currencyProvider.selectedCurrency == currency;
          return GestureDetector(
            onTap: () {
              currencyProvider.setSelectedCurrency(currency);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    currency,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  if (isSelected)
                    Container(
                      margin: const EdgeInsets.only(top: 4.0),
                      height: 2,
                      width: 20,
                      color: Colors.white,
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBalanceCircle(BuildContext context, String selectedCurrency) {
    final currencyData = currencyInfo[selectedCurrency];
    if (currencyData == null) {
      return const Center(child: Text('Currency data not available', style: TextStyle(color: Colors.white)));
    }
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                  Colors.pink,
                  Colors.blue,
                ],
              ),
            ),
          ),
          FittedBox(
            fit: BoxFit.scaleDown, // This scales down the content to fit within the circle
            child: Column(
              mainAxisSize: MainAxisSize.min, // This makes the column take the minimum space required
              children: [
                Text(
                  selectedCurrency,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${currencyData['balance']}',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 6),
                    CountryFlag.fromCountryCode(
                      currencyData['countryCode'],
                      height: 30,
                      width: 30,
                      borderRadius: 8.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyOverview(BuildContext context, String selectedCurrency) {
    final currencyData = currencyInfo[selectedCurrency];
    if (currencyData == null) {
      return const Center(child: Text('Currency data not available', style: TextStyle(color: Colors.white)));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country: ${currencyData['country']}',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 4),
        Center(
          child: CountryFlag.fromCountryCode(
            currencyData['countryCode'],
            height: 150,
            width: 150,
            borderRadius: 8.0,
          ),
        ),
      ],
    );
  }
}
