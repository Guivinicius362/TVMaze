import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'TV Maze'**
  String get appTitle;

  /// The search button text
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// The shows title
  ///
  /// In en, this message translates to:
  /// **'Shows'**
  String get shows;

  /// The favorites title
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// The seasons title
  ///
  /// In en, this message translates to:
  /// **'Seasons'**
  String get seasons;

  /// The episodes title
  ///
  /// In en, this message translates to:
  /// **'Episodes'**
  String get episodes;

  /// The airs on label
  ///
  /// In en, this message translates to:
  /// **'Airs on'**
  String get airsOn;

  /// The runtime label
  ///
  /// In en, this message translates to:
  /// **'Runtime'**
  String get runtime;

  /// The status label
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// The genres label
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres;

  /// The premiered label
  ///
  /// In en, this message translates to:
  /// **'Premiered'**
  String get premiered;

  /// The schedule label
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// The rating label
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// The summary label
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// The no summary available label
  ///
  /// In en, this message translates to:
  /// **'No summary available'**
  String get noSummary;

  /// The no episodes available label
  ///
  /// In en, this message translates to:
  /// **'No episodes available'**
  String get noEpisodes;

  /// The language label
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// The see more label
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seemore;

  /// The see less label
  ///
  /// In en, this message translates to:
  /// **'See less'**
  String get seeLess;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
