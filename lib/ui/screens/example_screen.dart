import 'package:flutter/material.dart';
import 'package:starter/ui/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ExmScreen extends StatelessWidget {
  const ExmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(AppLocalizations.of(context)!.example),
      ),
      body: Center(
          child: Text(AppLocalizations.of(context)!.example),
        ),
    );
  }
}
