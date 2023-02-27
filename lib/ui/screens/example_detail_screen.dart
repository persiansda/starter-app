import 'package:flutter/material.dart';
import 'package:starter/ui/shared/widgets/empty.dart';
import 'package:starter/ui/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ExmDetailScreen extends StatelessWidget {
  final String slug;
  const ExmDetailScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text(AppLocalizations.of(context)!.example),
      ),
      body: Scaffold(
        body: EmptyWidget(text: AppLocalizations.of(context)!.example),
      ),
    );
  }
}
