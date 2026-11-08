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
  /// **'© {year} Agus Rakhmadi Mido'**
  String copyright(String year);

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

  /// No description provided for @allProjects.
  ///
  /// In en, this message translates to:
  /// **'All Projects'**
  String get allProjects;

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
  /// **'// mobile application developer'**
  String get heroEyebrow;

  /// No description provided for @yearsExperience.
  ///
  /// In en, this message translates to:
  /// **'years building apps'**
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
  /// **'Have an app to build or fix?'**
  String get letsBuild;

  /// No description provided for @availableLabel.
  ///
  /// In en, this message translates to:
  /// **'Available for work'**
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

  /// No description provided for @navLogo.
  ///
  /// In en, this message translates to:
  /// **'mido'**
  String get navLogo;

  /// No description provided for @selectedWorks.
  ///
  /// In en, this message translates to:
  /// **'// selected works'**
  String get selectedWorks;

  /// No description provided for @projectsCountDescription.
  ///
  /// In en, this message translates to:
  /// **'6 projects · live on App Store & Play Store'**
  String get projectsCountDescription;

  /// No description provided for @openToProjects.
  ///
  /// In en, this message translates to:
  /// **'Open to new projects'**
  String get openToProjects;

  /// No description provided for @availableForRoles.
  ///
  /// In en, this message translates to:
  /// **'Available for freelance and full-time remote roles'**
  String get availableForRoles;

  /// No description provided for @heroDescription.
  ///
  /// In en, this message translates to:
  /// **'I build with Flutter, React Native and Android Native, and take apps from the first screen to the store release.'**
  String get heroDescription;

  /// No description provided for @liveOnStores.
  ///
  /// In en, this message translates to:
  /// **'apps live on stores'**
  String get liveOnStores;

  /// No description provided for @domains.
  ///
  /// In en, this message translates to:
  /// **'product domains'**
  String get domains;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @howIWork.
  ///
  /// In en, this message translates to:
  /// **'// how i work'**
  String get howIWork;

  /// No description provided for @techStack.
  ///
  /// In en, this message translates to:
  /// **'// tech stack'**
  String get techStack;

  /// No description provided for @aiChat.
  ///
  /// In en, this message translates to:
  /// **'AI Chat'**
  String get aiChat;

  /// No description provided for @fintech.
  ///
  /// In en, this message translates to:
  /// **'Fintech'**
  String get fintech;

  /// No description provided for @telemedicine.
  ///
  /// In en, this message translates to:
  /// **'Telemedicine'**
  String get telemedicine;

  /// No description provided for @eCommerce.
  ///
  /// In en, this message translates to:
  /// **'E-Commerce'**
  String get eCommerce;

  /// No description provided for @realTime.
  ///
  /// In en, this message translates to:
  /// **'Real-time'**
  String get realTime;

  /// No description provided for @gitHub.
  ///
  /// In en, this message translates to:
  /// **'GitHub'**
  String get gitHub;

  /// No description provided for @linkedIn.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn'**
  String get linkedIn;

  /// No description provided for @navWork.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get navWork;

  /// No description provided for @navApproach.
  ///
  /// In en, this message translates to:
  /// **'Approach'**
  String get navApproach;

  /// No description provided for @navStack.
  ///
  /// In en, this message translates to:
  /// **'Stack'**
  String get navStack;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @openMenu.
  ///
  /// In en, this message translates to:
  /// **'Open menu'**
  String get openMenu;

  /// No description provided for @closeMenu.
  ///
  /// In en, this message translates to:
  /// **'Close menu'**
  String get closeMenu;

  /// No description provided for @heroRole.
  ///
  /// In en, this message translates to:
  /// **'Mobile developer · Flutter, React Native, Android'**
  String get heroRole;

  /// No description provided for @ctaContact.
  ///
  /// In en, this message translates to:
  /// **'Email me about your app'**
  String get ctaContact;

  /// No description provided for @workEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Selected work'**
  String get workEyebrow;

  /// No description provided for @workTitle.
  ///
  /// In en, this message translates to:
  /// **'Apps shipped to real users'**
  String get workTitle;

  /// No description provided for @workSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{count} production apps across AI chat, fintech, telemedicine, e-commerce and real-time calls. Each case study covers my role, the stack and what shipped.'**
  String workSubtitle(int count);

  /// No description provided for @domainsLabel.
  ///
  /// In en, this message translates to:
  /// **'Domains I build for'**
  String get domainsLabel;

  /// No description provided for @statusLive.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get statusLive;

  /// No description provided for @statusArchived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get statusArchived;

  /// No description provided for @viewCaseStudy.
  ///
  /// In en, this message translates to:
  /// **'View case study'**
  String get viewCaseStudy;

  /// No description provided for @approachEyebrow.
  ///
  /// In en, this message translates to:
  /// **'How I work'**
  String get approachEyebrow;

  /// No description provided for @approachTitle.
  ///
  /// In en, this message translates to:
  /// **'How I work on your project'**
  String get approachTitle;

  /// No description provided for @stackEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Tech stack'**
  String get stackEyebrow;

  /// No description provided for @stackTitle.
  ///
  /// In en, this message translates to:
  /// **'What I build with'**
  String get stackTitle;

  /// No description provided for @contactEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactEyebrow;

  /// No description provided for @contactDescription.
  ///
  /// In en, this message translates to:
  /// **'Tell me what you\'re working on. I take freelance projects and full-time remote roles.'**
  String get contactDescription;

  /// No description provided for @copyEmail.
  ///
  /// In en, this message translates to:
  /// **'Copy email'**
  String get copyEmail;

  /// No description provided for @emailCopied.
  ///
  /// In en, this message translates to:
  /// **'Email copied to clipboard'**
  String get emailCopied;

  /// No description provided for @backToTop.
  ///
  /// In en, this message translates to:
  /// **'Back to top'**
  String get backToTop;

  /// No description provided for @builtWith.
  ///
  /// In en, this message translates to:
  /// **'Designed & built with Flutter'**
  String get builtWith;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @highlights.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get highlights;

  /// No description provided for @myRole.
  ///
  /// In en, this message translates to:
  /// **'My role & execution'**
  String get myRole;

  /// No description provided for @screenshots.
  ///
  /// In en, this message translates to:
  /// **'Screenshots'**
  String get screenshots;

  /// No description provided for @archivedNotice.
  ///
  /// In en, this message translates to:
  /// **'This app is no longer maintained and has been removed from the stores.'**
  String get archivedNotice;

  /// No description provided for @nextProject.
  ///
  /// In en, this message translates to:
  /// **'Next project'**
  String get nextProject;

  /// No description provided for @notFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get notFoundTitle;

  /// No description provided for @notFoundBody.
  ///
  /// In en, this message translates to:
  /// **'The page you\'re looking for doesn\'t exist or has moved.'**
  String get notFoundBody;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get goHome;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @imageCounter.
  ///
  /// In en, this message translates to:
  /// **'{current} / {total}'**
  String imageCounter(int current, int total);

  /// No description provided for @openScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Open screenshot {index}'**
  String openScreenshot(int index);

  /// No description provided for @getItOn.
  ///
  /// In en, this message translates to:
  /// **'Get it on {store}'**
  String getItOn(String store);

  /// No description provided for @openWebsite.
  ///
  /// In en, this message translates to:
  /// **'Open website'**
  String get openWebsite;

  /// No description provided for @emailMe.
  ///
  /// In en, this message translates to:
  /// **'Send an email'**
  String get emailMe;

  /// No description provided for @portraitAlt.
  ///
  /// In en, this message translates to:
  /// **'Portrait of Agus Rakhmadi Mido'**
  String get portraitAlt;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @aboutEyebrow.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutEyebrow;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'The person behind the apps'**
  String get aboutTitle;

  /// No description provided for @heroGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m {name}'**
  String heroGreeting(String name);

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobile apps, built and shipped end to end.'**
  String get heroTitle;

  /// No description provided for @proofYears.
  ///
  /// In en, this message translates to:
  /// **'{count}+ years'**
  String proofYears(int count);

  /// No description provided for @proofApps.
  ///
  /// In en, this message translates to:
  /// **'{count} apps shipped'**
  String proofApps(int count);

  /// No description provided for @proofInstalls.
  ///
  /// In en, this message translates to:
  /// **'{installs} installs on {app}'**
  String proofInstalls(String installs, String app);

  /// No description provided for @storeInstalls.
  ///
  /// In en, this message translates to:
  /// **'{count} installs'**
  String storeInstalls(String count);

  /// No description provided for @storeRating.
  ///
  /// In en, this message translates to:
  /// **'{rating} rating'**
  String storeRating(String rating);

  /// No description provided for @storeSource.
  ///
  /// In en, this message translates to:
  /// **'Google Play, {date}'**
  String storeSource(String date);

  /// No description provided for @statInstallsOn.
  ///
  /// In en, this message translates to:
  /// **'installs on {app}'**
  String statInstallsOn(String app);
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
