import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @downloadCv.
  ///
  /// In en, this message translates to:
  /// **'View CV'**
  String get downloadCv;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get subject;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @yourEmail.
  ///
  /// In en, this message translates to:
  /// **'contact@you.com'**
  String get yourEmail;

  /// No description provided for @yourMessage.
  ///
  /// In en, this message translates to:
  /// **'Please write your Message'**
  String get yourMessage;

  /// No description provided for @takeALookAtMyPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Take a look at my portfolio'**
  String get takeALookAtMyPortfolio;

  /// No description provided for @portfolioDescription.
  ///
  /// In en, this message translates to:
  /// **'Here are a few of my completed projects, showcasing my skills in mobile development. I have several other projects currently in development that will be added soon. Stay tuned for updates as I continue to build and refine my portfolio.'**
  String get portfolioDescription;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get readMore;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @availableForFreelance.
  ///
  /// In en, this message translates to:
  /// **'Available for Freelance'**
  String get availableForFreelance;

  /// No description provided for @freelanceDescription.
  ///
  /// In en, this message translates to:
  /// **'Looking for a freelance mobile developer? I\'m available for hire! Let\'s work together to bring your app ideas to life. Get in touch!'**
  String get freelanceDescription;

  /// No description provided for @pages.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get pages;

  /// No description provided for @framework.
  ///
  /// In en, this message translates to:
  /// **'Framework'**
  String get framework;

  /// No description provided for @platforms.
  ///
  /// In en, this message translates to:
  /// **'Platforms'**
  String get platforms;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @visit.
  ///
  /// In en, this message translates to:
  /// **'Visit'**
  String get visit;

  /// No description provided for @projectOverview.
  ///
  /// In en, this message translates to:
  /// **'Project Overview'**
  String get projectOverview;

  /// No description provided for @execution.
  ///
  /// In en, this message translates to:
  /// **'Execution'**
  String get execution;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @digitalPortfolio.
  ///
  /// In en, this message translates to:
  /// **'Digital Portfolio'**
  String get digitalPortfolio;

  /// No description provided for @waitAMoment.
  ///
  /// In en, this message translates to:
  /// **'Wait a moment...'**
  String get waitAMoment;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2024 Mido. All rights reserved.'**
  String get copyright;

  /// No description provided for @hiIAm.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'am'**
  String get hiIAm;

  /// No description provided for @pleaseEnterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email address'**
  String get pleaseEnterEmail;

  /// No description provided for @exNewProject.
  ///
  /// In en, this message translates to:
  /// **'Ex. New Project'**
  String get exNewProject;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @errorOccurred.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get errorOccurred;

  /// No description provided for @cannotOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Cannot open this link'**
  String get cannotOpenLink;

  /// No description provided for @cvOpen.
  ///
  /// In en, this message translates to:
  /// **'Opening CV...'**
  String get cvOpen;

  /// No description provided for @noServices.
  ///
  /// In en, this message translates to:
  /// **'No services available'**
  String get noServices;

  /// No description provided for @noProjects.
  ///
  /// In en, this message translates to:
  /// **'No projects yet'**
  String get noProjects;

  /// No description provided for @projectSaved.
  ///
  /// In en, this message translates to:
  /// **'Project saved!'**
  String get projectSaved;

  /// No description provided for @contentSaved.
  ///
  /// In en, this message translates to:
  /// **'Content saved!'**
  String get contentSaved;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @seeAllProjects.
  ///
  /// In en, this message translates to:
  /// **'See All Projects'**
  String get seeAllProjects;

  /// No description provided for @featuredProjects.
  ///
  /// In en, this message translates to:
  /// **'Featured Projects'**
  String get featuredProjects;

  /// No description provided for @greetingHi.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m '**
  String get greetingHi;

  /// No description provided for @heroEyebrow.
  ///
  /// In en, this message translates to:
  /// **'// flutter & mobile developer'**
  String get heroEyebrow;

  /// No description provided for @yearsExperience.
  ///
  /// In en, this message translates to:
  /// **'years experience'**
  String get yearsExperience;

  /// No description provided for @projectsShipped.
  ///
  /// In en, this message translates to:
  /// **'projects shipped'**
  String get projectsShipped;

  /// No description provided for @platformsCount.
  ///
  /// In en, this message translates to:
  /// **'platforms'**
  String get platformsCount;

  /// No description provided for @letsBuild.
  ///
  /// In en, this message translates to:
  /// **'Let\'s build something together'**
  String get letsBuild;

  /// No description provided for @availableLabel.
  ///
  /// In en, this message translates to:
  /// **'available'**
  String get availableLabel;

  /// No description provided for @switchLangToIndo.
  ///
  /// In en, this message translates to:
  /// **'Switch to Indonesian'**
  String get switchLangToIndo;

  /// No description provided for @switchLangToEng.
  ///
  /// In en, this message translates to:
  /// **'Switch to English'**
  String get switchLangToEng;

  /// No description provided for @switchThemeToLight.
  ///
  /// In en, this message translates to:
  /// **'Switch to light mode'**
  String get switchThemeToLight;

  /// No description provided for @switchThemeToDark.
  ///
  /// In en, this message translates to:
  /// **'Switch to dark mode'**
  String get switchThemeToDark;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @editorLabel.
  ///
  /// In en, this message translates to:
  /// **'Editor'**
  String get editorLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
