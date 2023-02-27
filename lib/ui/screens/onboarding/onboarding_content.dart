import 'package:flutter/cupertino.dart';
import 'package:starter/ui/screens/onboarding/widgets/page_section.dart';
import 'package:starter/ui/screens/onboarding/widgets/language_section.dart';

final List<Widget> slides = [
  const PageSectionWidget(
    title: 'Articles',
    description: 'Read bible stories',
  ),
  const LanguageSection(),
];
