/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rate_watcher/pages/account_page.dart';
import 'package:rate_watcher/pages/exchange_page.dart';
import 'package:rate_watcher/pages/conversion_page.dart';
import 'package:rate_watcher/pages/welcome_page.dart';
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

    return MaterialApp.router(
      title: 'Rate Watcher',
      theme: theme,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/main',
      builder: (BuildContext context, GoRouterState state) {
        return const MainPage();
      },
    ),
  ],
);

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


*/

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rate_watcher/pages/account_page.dart';
import 'package:rate_watcher/pages/exchange_page.dart';
import 'package:rate_watcher/pages/conversion_page.dart';
import 'package:rate_watcher/pages/welcome_page.dart';
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

    return MaterialApp.router(
      title: 'Rate Watcher',
      theme: theme,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
    ),
    GoRoute(
      path: '/main',
      builder: (BuildContext context, GoRouterState state) {
        return const MainPage();
      },
    ),
  ],
);

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  final List<Widget> _pages = [
    const AccountPage(),
    const ExchangePage(),
    const ConversionPage(),
  ];

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  void getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
          (List<ConnectivityResult> results) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && !isAlertSet) {
          showDialogBox();
          setState(() => isAlertSet = true);
        }
      },
    );
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

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

  void showDialogBox() {
    showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('No Connection'),
        content: const Text('Please check your internet connectivity'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'Cancel');
              setState(() => isAlertSet = false);
              isDeviceConnected = await InternetConnectionChecker().hasConnection;
              if (!isDeviceConnected && !isAlertSet) {
                showDialogBox();
                setState(() => isAlertSet = true);
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

