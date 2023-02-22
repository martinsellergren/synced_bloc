import 'package:flutter/material.dart';
import 'package:umbrella/dependencies.dart';
import 'package:umbrella/pages/account_page.dart';
import 'package:umbrella/pages/home_page.dart';

class CompletelyMigratedFlutterApp extends StatelessWidget {
  final Dependencies dependencies;

  const CompletelyMigratedFlutterApp({
    Key? key,
    required this.dependencies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(
        dependencies: dependencies,
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  final Dependencies dependencies;
  const MainPage({
    Key? key,
    required this.dependencies,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(() {
        switch (tabController.index) {
          case 0:
            return 'Home';
          case 1:
            return 'Account';
          default:
            return 'Theme';
        }
      }())),
      body: TabBarView(
        controller: tabController,
        children: [
          HomePage(dependencies: widget.dependencies),
          AccountPage(
              authBloc: widget.dependencies.authBloc,
              themeBloc: widget.dependencies.themeBloc),
          const Center(child: Text('Theme')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabController.index,
          onTap: (index) {
            tabController.animateTo(index);
          },
          items: <dynamic>[
            ['Home', Icons.home],
            ['Account', Icons.settings],
            ['Theme', Icons.color_lens],
          ]
              .map(
                  (e) => BottomNavigationBarItem(label: e[0], icon: Icon(e[1])))
              .toList()),
    );
  }
}
