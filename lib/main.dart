/*
import 'package:flutter/material.dart'; // Importing the material package from Flutter
import 'package:rate_watcher/pages/navpages/main_page.dart';

import 'package:rate_watcher/pair_conversion.dart'; // Importing the PairConversion class
import 'package:rate_watcher/standard_response.dart'; // Importing the StandardResponse class
import 'package:rate_watcher/supported_code.dart';
import 'package:rate_watcher/pages/welcome_page.dart';
import 'package:rate_watcher/themes/ratewatcher_theme.dart'; // Importing the SupportedCode class

void main() {
  // 1
  runApp(const MyApp()); // Running the app with MyApp as the root widget
}

class MyApp extends StatelessWidget {
  // 2
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Create Theme
    // TODO: Apply home widget
    // 3
    //final ThemeData theme = ThemeData(); // Creating a theme for the app
    final theme = RateWatcherTheme.dark();

    return MaterialApp( // Creating the MaterialApp widget for the app
      // TODO: Add theme
      title: 'Rate Watcher', // Setting the app title
      theme: theme,
      */
/*theme: theme.copyWith( // Copying the theme and customizing it
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue, // Setting the primary color to blue
        ),
        secondaryHeaderColor: Colors.white, // Setting the secondary header color to white
      ),
      // 4*//*

      home: const MyHomePage(title: 'Rate Watcher')//const WelcomePage() //const MainPage() //const MyHomePage(title: 'Rate Watcher'), // Setting MyHomePage as the home page
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PairConversion? pairConversion; // Creating an instance variable for PairConversion
  StandardResponse? standardResponse; // Creating an instance variable for StandardResponse
  SupportedCode? supportedCode; // Creating an instance variable for SupportedCode

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetching data when the state is initialized
  }

  Future<void> fetchData() async {
    String apiKey = 'd18ab53713e43aec5f97c9f2'; // Setting the API key
    String baseCode = 'EUR'; // Setting the base code
    String targetCode = 'GBP'; // Setting the target code

    try {
      pairConversion = await PairConversion.fetchData(apiKey, baseCode, targetCode); // Fetching pair conversion data
      standardResponse = await StandardResponse.fetchData(apiKey, baseCode); // Fetching standard response data
      supportedCode = await SupportedCode.fetchData(apiKey); // Fetching supported code data
      setState(() {}); // Triggering a rebuild to show the fetched data
    } catch (error) {
      print(error); // Handling errors
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = RateWatcherTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'Rate Watcher',
      home: Scaffold( // Creating a scaffold for the home page
        appBar: AppBar( // Creating an app bar
          //backgroundColor: Theme.of(context).colorScheme.primary, // Setting the app bar color
          //foregroundColor: Theme.of(context).secondaryHeaderColor, // Setting the app bar text color
          title: Center( // Centering the title
            child: Text(widget.title), // Displaying the title
          ),
        ),
        body: SafeArea( // Creating a safe area for the body content
          child: ListView( // Creating a list view for the body content
            children: [
              if (pairConversion != null) // Checking if pair conversion data is available
                rateWatcherCard( // Building a card to display pair conversion rate
                  'Pair Conversion Rate: ${pairConversion!.conversionRate}',
                ),
              if (standardResponse != null) // Checking if standard response data is available
                ...standardResponse!.conversionRates.entries.map( // Mapping over the conversion rates
                      (entry) {
                    if (entry.key == 'EUR' || // Checking if the currency is one of the specified ones
                        entry.key == 'USD' ||
                        entry.key == 'TZS' ||
                        entry.key == 'GBP') {
                      return rateWatcherCard( // Building a card to display the conversion rate
                        '${entry.key}: ${entry.value}',
                      );
                    } else {
                      return const SizedBox.shrink(); // Skipping if the currency is not specified
                    }
                  },
                ),
              if (supportedCode != null) // Checking if supported code data is available
                ...supportedCode!.supportedCodes.map( // Mapping over the supported codes
                      (code) {
                    if (code.contains('EUR') || // Checking if the code is one of the specified ones
                        code.contains('USD') ||
                        code.contains('TZS') ||
                        code.contains('GBP')) {
                      return rateWatcherCard( // Building a card to display the supported code
                        'Supported Code: $code',
                      );
                    } else {
                      return const SizedBox.shrink(); // Skipping if the code is not specified
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget rateWatcherCard(String text) { // Method to build a card widget
    final theme = RateWatcherTheme.dark();
    return Card( // Creating a card widget
      elevation: 2.0, // Setting the elevation of the card
      shape: RoundedRectangleBorder( // Setting the shape of the card
        borderRadius: BorderRadius.circular(10.0), // Setting border radius
      ),
      child: Padding( // Adding padding to the card content
        padding: const EdgeInsets.all(16.0), // Setting padding
        child: Column( // Creating a column to organize the card content vertically
          children: <Widget>[
            const SizedBox(height: 8.0), // Adding empty space
            Text( // Adding text widget to display the content
              text, // Setting the text to be displayed
              style: theme.textTheme.displayMedium,
              */
/*style: const TextStyle( // Setting the text style
                fontSize: 16.0, // Setting font size
                fontWeight: FontWeight.w400, // Setting font weight
              ),*//*

            ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rate_watcher/pages/account_page.dart';
import 'package:rate_watcher/pages/exchange_page.dart';
import 'package:rate_watcher/pages/conversion_page.dart';
import 'package:rate_watcher/themes/ratewatcher_theme.dart';

import 'currency_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CurrencyProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = RateWatcherTheme.dark();

    return MaterialApp(
      title: 'Rate Watcher',
      theme: theme,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const AccountPage(),
    const ExchangePage(),
    const ConversionPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Exchange',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Conversion',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onItemTapped,
      ),
    );
  }
}

