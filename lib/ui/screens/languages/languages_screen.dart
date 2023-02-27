import 'package:flutter/material.dart';
import 'package:starter/ui/styles/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter/logic/utils/storage.dart';
import 'package:starter/logic/database/locales.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:starter/logic/cubit/settings/setting_cubit.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1f1f),
        title: Text(AppLocalizations.of(context)!.languages),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemCount: locales.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(locales[index]['native']!),
            subtitle: Text(locales[index]['name']!),
            minLeadingWidth: 0,
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child:
                  Storage.svg('flag/${locales[index]['iso']!}.svg', height: 40),
            ),
            trailing: BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                if (state.locale == locales[index]['iso']) {
                  return Icon(Icons.check_rounded, color: colorPrimary);
                }
                return const SizedBox();
              },
            ),
            onTap: () {
              BlocProvider.of<SettingCubit>(context).setLocale(
                locales[index]['iso']!,
              );
            },
          );
        },
      ),
    );
  }
}
