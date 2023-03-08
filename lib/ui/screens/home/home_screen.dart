import 'package:flutter/material.dart';
import 'package:starter/ui/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:starter/ui/router/arguments/example_argument.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(AppLocalizations.of(context)!.appName),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    '/example/detail',
                    arguments: ExampleArguments('example'),
                  ),
                  child: const Text('Go deep'),
                ),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/example/error'),
                  child: const Text('Error'),
                ),
                ElevatedButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  child: const Text('Open Drawer'),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
