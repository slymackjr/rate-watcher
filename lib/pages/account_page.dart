import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import '../supported_code.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  SupportedCode? supportedCode; // Creating an instance variable for SupportedCode
  String _selectedCurrency = 'USD';
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
    fetchData(); // Fetching data when the state is initialized
  }

  Future<void> fetchData() async {
    String apiKey = 'd18ab53713e43aec5f97c9f2'; // Setting the API key

    // Disable SSL certificate verification
    // HttpClient().badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    try {
      SupportedCode supportedCode = await SupportedCode.fetchData(apiKey);

      String usdData = supportedCode.getNameForKey('USD');
      String eurData = supportedCode.getNameForKey('EUR');
      String gbpData = supportedCode.getNameForKey('GBP');
      String plnData = supportedCode.getNameForKey('PLN');

// Additional countries
      String kesData = supportedCode.getNameForKey('KES');
      String bifData = supportedCode.getNameForKey('BIF');
      String zmwData = supportedCode.getNameForKey('ZMW');
      String tzsData = supportedCode.getNameForKey('TZS');
      String mwkData = supportedCode.getNameForKey('MWK');
      String rwfData = supportedCode.getNameForKey('RWF');

// Update currencyInfo with fetched data
      setState(() {
        currencyInfo['USD']['country'] = usdData.isNotEmpty ? usdData : 'N/A';
        currencyInfo['EUR']['country'] = eurData.isNotEmpty ? eurData : 'N/A';
        currencyInfo['GBP']['country'] = gbpData.isNotEmpty ? gbpData : 'N/A';
        currencyInfo['PLN']['country'] = plnData.isNotEmpty ? plnData : 'N/A';

        // Additional countries
        currencyInfo['KES']['country'] = kesData.isNotEmpty ? kesData : 'N/A';
        currencyInfo['BIF']['country'] = bifData.isNotEmpty ? bifData : 'N/A';
        currencyInfo['ZMW']['country'] = zmwData.isNotEmpty ? zmwData : 'N/A';
        currencyInfo['TZS']['country'] = tzsData.isNotEmpty ? tzsData : 'N/A';
        currencyInfo['MWK']['country'] = mwkData.isNotEmpty ? mwkData : 'N/A';
        currencyInfo['RWF']['country'] = rwfData.isNotEmpty ? rwfData : 'N/A';
      });


    } catch (error) {
      print(error); // Handling errors
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
            _buildCurrencySelector(context),
            const SizedBox(height: 16),
            _buildBalanceCircle(context),
            const SizedBox(height: 16),
            Text(
              'Overview',
              style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            _buildCurrencyOverview(context),
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
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
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

    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          final currency = currencies[index];
          final isSelected = _selectedCurrency == currency;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCurrency = currency;
              });
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
                    )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBalanceCircle(BuildContext context) {
    final currencyData = currencyInfo[_selectedCurrency];
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
          Column(
            children: [
              Text(
                _selectedCurrency,
                style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${currencyData['balance']}',
                    style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(width: 6),
                  CountryFlag.fromCountryCode(
                    currencyData['countryCode'], // Pass the country code as a positional argument
                    height: 30, // Adjust the height as needed
                    width: 30, // Adjust the width as needed
                    borderRadius: 8.0, // Optional: Add border radius
                  ),

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyOverview(BuildContext context) {
    final currencyData = currencyInfo[_selectedCurrency];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country: ${currencyData['country']}',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: 4),
        // Displaying flag image instead of text
        Center(
          child: CountryFlag.fromCountryCode(
            currencyData['countryCode'], // Pass the country code to display the flag
            height: 150, // Adjust the height as needed
            width: 150, // Adjust the width as needed
            borderRadius: 8.0, // Optional: Add border radius
          ),
        ),
      ],
    );
  }

}
