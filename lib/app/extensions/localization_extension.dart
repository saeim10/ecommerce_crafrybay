

import 'package:ecommerce_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension Localization on BuildContext{
  AppLocalizations get localization{
    return AppLocalizations.of(this)!;
  }
}