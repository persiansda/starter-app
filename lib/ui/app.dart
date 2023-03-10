import 'package:flutter/material.dart';
import 'package:starter/ui/shared/drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/ui/shared/bottombar.dart';
import 'package:starter/ui/screens/example_screen.dart';
import 'package:starter/ui/screens/home/home_screen.dart';
import 'package:starter/logic/cubit/navigation/navigation_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(
      length: pages.length,
      initialIndex: context.read<NavigationCubit>().state.currentIndex,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabCtrl.dispose();
  }

  final pages = [
    const HomeScreen(key: PageStorageKey('HomeScreen')),
    const ExmScreen(),
  ];

  final tabs = [
    {
      'index': 0,
      'icon': 'home',
      'label': 'Home',
    },
    {
      'index': 1,
      'icon': 'example',
      'label': 'Example',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: BlocBuilder<NavigationCubit, NavigationState>(
        builder: (context, state) {
          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabCtrl,
            children: pages,
          );
        },
      ),
      bottomNavigationBar: BottomBarWidget(tabController: _tabCtrl, tabs: tabs),
    );
  }
}
