library utils;

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:happy_money/app/services/shared_storage/shared_storage.dart';
import 'package:happy_money/app/utils/extensions/date_time.dart';
import 'package:happy_money/app/utils/utils.dart';
import 'package:happy_money/l10n/app_localizations.dart';
import 'package:path_provider/path_provider.dart' as path_store;
import 'package:wakelock_plus/wakelock_plus.dart';

import '../../l10n/app_localizations.dart';

part 'extensions/context.dart';
part 'date_utils.dart';
part 'debounce.dart';
part 'extensions/enums.dart';
part 'extensions/int.dart';
part 'extensions/list.dart';
part 'extensions/object.dart';
part 'extensions/placemark.dart';
part 'extensions/string.dart';
part 'file_utils.dart';
part 'image_util.dart';
part 'input_formatters/hash_tag_formatter.dart';
part 'keyboard_util.dart';
part 'locale_util.dart';
part 'regex/app_link_regex.dart';
part 'regex/detectable_tag_regex.dart';
part 'responsive/responsive.dart';
part 'semaphore.dart';
part 'wakelock_util.dart';

/// Returns true if the app runs on a phone,
/// Returns false if the app runs on a tablet
bool get isMobile => Responsive.isMobile;

/// Returns true if the app runs on a tablet,
/// Returns false if the app runs on a phone
bool get isTablet => Responsive.isTablet;
