import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi', 'te'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
    String? teText = '',
  }) =>
      [enText, hiText, teText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Loginpage
  {
    '1co3mwos': {
      'en': 'HeritageHues',
      'hi': 'हेरिटेजह्यूज़',
      'te': 'హెరిటేజ్ హ్యూస్',
    },
    'nl93x7fx': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'te': 'ప్రవేశించండి',
    },
    'p6j13i3p': {
      'en': 'Email',
      'hi': 'ईमेल',
      'te': 'ఇమెయిల్',
    },
    '0905nxu1': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'te': 'పాస్వర్డ్',
    },
    '1qax5pv4': {
      'en': 'Login',
      'hi': 'लॉग इन करें',
      'te': 'ప్రవేశించండి',
    },
    'comgqdka': {
      'en': 'Or login with',
      'hi': 'या फिर लॉगिन करें',
      'te': 'లేదా దీనితో లాగిన్ అవ్వండి',
    },
    'k8bc64we': {
      'en': 'Don\'t have an account?  ',
      'hi': 'कोई खाता नहीं है?',
      'te': 'ఖాతా లేదా?',
    },
    '5whfqhv3': {
      'en': 'Sign Up here',
      'hi': 'यहां साइन अप करें',
      'te': 'ఇక్కడ సైన్ అప్ చేయండి',
    },
    '8nfbs3xj': {
      'en': 'Sign in as guest',
      'hi': 'अतिथि के रूप में साइन इन करें',
      'te': 'అతిథిగా సైన్ ఇన్ చేయండి',
    },
    '2iinfy6k': {
      'en': 'Forgot password?',
      'hi': 'पासवर्ड भूल गए?',
      'te': 'పాస్‌వర్డ్ మర్చిపోయారా?',
    },
    'i42wkq3w': {
      'en': 'Home',
      'hi': 'घर',
      'te': 'హోమ్',
    },
  },
  // Forgotpassword
  {
    '1skcgdwt': {
      'en': 'Back',
      'hi': 'पीछे',
      'te': 'వెనుకకు',
    },
    'xd7n2ond': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
      'te': 'పాస్‌వర్డ్ మర్చిపోయాను',
    },
    '0hn80kxc': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'hi':
          'हम आपको आपका पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबंधित ईमेल दर्ज करें।',
      'te':
          'మేము మీ పాస్‌వర్డ్‌ని రీసెట్ చేయడానికి లింక్‌తో మీకు ఇమెయిల్ పంపుతాము, దయచేసి మీ ఖాతాతో అనుబంధించబడిన ఇమెయిల్‌ను దిగువన నమోదు చేయండి.',
    },
    '22cxnolg': {
      'en': 'Your email address...',
      'hi': 'आपका ईमेल पता...',
      'te': 'మీ ఇమెయిల్ చిరునామా...',
    },
    'p41cjugh': {
      'en': 'Enter your email...',
      'hi': 'अपना ईमेल दर्ज करें...',
      'te': 'మీ ఇమెయిల్‌ని నమోదు చేయండి...',
    },
    '0b0niqu7': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
      'te': 'లింక్ పంపండి',
    },
    'ciyywl4e': {
      'en': 'Back',
      'hi': 'पीछे',
      'te': 'వెనుకకు',
    },
    'xb905ft7': {
      'en': 'Home',
      'hi': 'घर',
      'te': 'హోమ్',
    },
  },
  // signuppage
  {
    'ru0hmgez': {
      'en': 'HeritageHues',
      'hi': 'हेरिटेजह्यूज़',
      'te': 'హెరిటేజ్ హ్యూస్',
    },
    'fblhorxf': {
      'en': 'Get Started',
      'hi': 'शुरू हो जाओ',
      'te': 'ప్రారంభించడానికి',
    },
    'scqrlubl': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': 'आइए नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
      'te': 'దిగువ ఫారమ్‌ను పూరించడం ద్వారా ప్రారంభిద్దాం.',
    },
    '52o53dhl': {
      'en': 'Email',
      'hi': 'ईमेल',
      'te': 'ఇమెయిల్',
    },
    'b07407az': {
      'en': 'Password',
      'hi': 'पासवर्ड',
      'te': 'పాస్వర్డ్',
    },
    '99lwrssa': {
      'en': 'Confirm Password',
      'hi': 'पासवर्ड की पुष्टि कीजिये',
      'te': 'పాస్‌వర్డ్‌ని నిర్ధారించండి',
    },
    'ccdbx68k': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
      'te': 'ఖాతాను సృష్టించండి',
    },
    'v2guw6m0': {
      'en': 'Or ',
      'hi': 'या',
      'te': 'లేదా',
    },
    '8iye0zvk': {
      'en': 'Sign in as guest',
      'hi': 'अतिथि के रूप में साइन इन करें',
      'te': 'అతిథిగా సైన్ ఇన్ చేయండి',
    },
    '21kwd2lh': {
      'en': 'Already have an account?  ',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
      'te': 'ఖాతా కలిగి ఉన్నారా?',
    },
    'yy9d0ylt': {
      'en': 'Sign In here',
      'hi': 'यहां साइन इन करो',
      'te': 'ఇక్కడ సైన్ ఇన్ చేయండి',
    },
    'airz5aku': {
      'en': 'Home',
      'hi': 'घर',
      'te': 'హోమ్',
    },
  },
  // MainPage
  {
    'm68nznhr': {
      'en': 'Translate',
      'hi': '',
      'te': '',
    },
    'fn8l8jvc': {
      'en': 'Plan Trip',
      'hi': '',
      'te': '',
    },
    'tc22i422': {
      'en': 'Tourist Places',
      'hi': 'पर्यटक स्थल',
      'te': 'పర్యాటక ప్రదేశాలు',
    },
    'p17ep3w5': {
      'en': 'Cultures & Traditions',
      'hi': 'संस्कृतियाँ और परंपराएँ',
      'te': 'సంస్కృతులు & సంప్రదాయాలు',
    },
    'z7rzys6j': {
      'en': 'Button',
      'hi': '',
      'te': '',
    },
    'go5anw8r': {
      'en': 'Home',
      'hi': 'घर',
      'te': 'హోమ్',
    },
  },
  // searchpage
  {
    'xbzvebu0': {
      'en': 'search',
      'hi': 'खोज',
      'te': 'వెతకండి',
    },
    'x89edqiv': {
      'en': 'Search here...',
      'hi': 'यहां तलाश करो...',
      'te': 'ఇక్కడ వెతకండి...',
    },
    '3iuc55is': {
      'en': 'Option 1',
      'hi': 'विकल्प 1',
      'te': 'ఎంపిక 1',
    },
    '9jfcpefe': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
      'te': 'హలో వరల్డ్',
    },
    'jkc5qtyt': {
      'en': 'Hello World',
      'hi': 'हैलो वर्ल्ड',
      'te': 'హలో వరల్డ్',
    },
    '8whdvyrw': {
      'en': 'search',
      'hi': 'खोज',
      'te': 'వెతకండి',
    },
  },
  // profilepage
  {
    '2g4z1rg3': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
      'te': 'ప్రొఫైల్',
    },
    'mnih8qvo': {
      'en': 'Logout',
      'hi': 'लॉग आउट',
      'te': 'లాగ్అవుట్',
    },
    'qtehm44z': {
      'en': 'profile',
      'hi': 'प्रोफ़ाइल',
      'te': 'ప్రొఫైల్',
    },
  },
  // Toursiplacelist
  {
    '1yth0mql': {
      'en': 'Tourism Spots',
      'hi': 'पर्यटन स्थल',
      'te': 'పర్యాటక ప్రదేశాలు',
    },
    'sh9zix0b': {
      'en': 'Visits',
      'hi': 'दौरा',
      'te': 'సందర్శనలు',
    },
  },
  // Cultureslistpage
  {
    'o4jrbhiq': {
      'en': 'Button',
      'hi': 'बटन',
      'te': 'బటన్',
    },
    'vveoss72': {
      'en': 'Page Title',
      'hi': 'पृष्ठ का शीर्षक',
      'te': 'పుట శీర్షిక',
    },
    '8n79yob1': {
      'en': 'Cultures ',
      'hi': 'संस्कृति',
      'te': 'సంస్కృతులు',
    },
  },
  // detailspage
  {
    '33328dco': {
      'en': 'Get Route ',
      'hi': '',
      'te': '',
    },
    'uldo1pf2': {
      'en': 'Food near by',
      'hi': '',
      'te': '',
    },
    'j734au3r': {
      'en': 'Youtube ref',
      'hi': '',
      'te': '',
    },
    'l8oguolc': {
      'en': 'Travel',
      'hi': '',
      'te': '',
    },
    'k8jblsfm': {
      'en':
          'Charminar Rd, Char Kaman, Ghansi Bazaar, Hyderabad, Telangana 500002',
      'hi': '',
      'te': '',
    },
    'pe0crdvf': {
      'en': 'History :',
      'hi': '',
      'te': '',
    },
    'cdg2hbzo': {
      'en': 'Detail',
      'hi': 'घर',
      'te': 'హోమ్',
    },
  },
  // Toursitspotsdetailspage
  {
    'h546zvt2': {
      'en': 'Page Title',
      'hi': 'पृष्ठ का शीर्षक',
      'te': 'పుట శీర్షిక',
    },
    'bhor65ob': {
      'en': 'Home',
      'hi': 'घर',
      'te': 'హోమ్',
    },
  },
  // profilepagee
  {
    '2j0ygo0p': {
      'en': '[Username]',
      'hi': '[उपयोगकर्ता नाम]',
      'te': '[యూజర్ పేరు]',
    },
    'mtt2e46z': {
      'en': '[Email_Address]',
      'hi': '[मेल पता]',
      'te': '[ఇమెయిల్_చిరునామా]',
    },
    'o9m9hwi8': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
      'te': 'ప్రొఫైల్‌ని సవరించండి',
    },
    'qd6ds872': {
      'en': 'Change Password',
      'hi': 'पासवर्ड बदलें',
      'te': 'పాస్‌వర్డ్ మార్చండి',
    },
    '6operf6y': {
      'en': 'Dark Mode',
      'hi': 'डार्क मोड',
      'te': 'డార్క్ మోడ్',
    },
    '3r1848ee': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
      'te': 'లాగ్ అవుట్ చేయండి',
    },
    'ay5vj5xu': {
      'en': 'Home',
      'hi': 'घर',
      'te': 'హోమ్',
    },
  },
  // Cultureslist
  {
    'a7s4sar1': {
      'en': 'Cultures',
      'hi': 'संस्कृति',
      'te': 'సంస్కృతులు',
    },
    '5edw4jd8': {
      'en': 'Cultures',
      'hi': 'संस्कृति',
      'te': 'సంస్కృతులు',
    },
  },
  // CULTURESDETAILSPAGE
  {
    'fe7t5mlu': {
      'en': 'Overview',
      'hi': 'अवलोकन',
      'te': 'అవలోకనం',
    },
    'zyvui6qd': {
      'en': 'history of the page',
      'hi': 'पृष्ठ का इतिहास',
      'te': 'పేజీ యొక్క చరిత్ర',
    },
    'qtjmaf0u': {
      'en': 'Home',
      'hi': 'घर',
      'te': 'హోమ్',
    },
  },
  // foods
  {
    's6eqqpn3': {
      'en': 'Tourism Spots',
      'hi': 'पर्यटन स्थल',
      'te': 'పర్యాటక ప్రదేశాలు',
    },
    'r4echd5l': {
      'en': 'Charminar',
      'hi': 'Charminar',
      'te': 'Charminar',
    },
    's6yo2c50': {
      'en':
          'Laad Bazaar, in Hyderabad, is a vibrant market renowned for its intricate bangles and traditional jewelry. Established during the Nizam era, it continues to enchant shoppers with its rich cultural offerings and bustling atmosphere, providing a delightful experience for those seeking traditional crafts and unique treasures.',
      'hi':
          'Laad Bazaar, in Hyderabad, is a vibrant market renowned for its intricate bangles and traditional jewelry. Established during the Nizam era, it continues to enchant shoppers with its rich cultural offerings and bustling atmosphere, providing a delightful experience for those seeking traditional crafts and unique treasures.',
      'te':
          'Laad Bazaar, in Hyderabad, is a vibrant market renowned for its intricate bangles and traditional jewelry. Established during the Nizam era, it continues to enchant shoppers with its rich cultural offerings and bustling atmosphere, providing a delightful experience for those seeking traditional crafts and unique treasures.',
    },
    'x71y5udu': {
      'en': 'Visits',
      'hi': 'दौरा',
      'te': 'సందర్శనలు',
    },
  },
  // maintile
  {
    'v9b9tw5w': {
      'en': 'HeritageHues',
      'hi': 'हेरिटेजह्यूज़',
      'te': 'హెరిటేజ్ హ్యూస్',
    },
  },
  // detailstile
  {
    'm3pcyyq0': {
      'en': 'placess',
      'hi': 'स्थान',
      'te': 'స్థలాలు',
    },
  },
  // Miscellaneous
  {
    'lyt7io16': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'oxnm0ixz': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '4esg9z65': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '0bhocpm3': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '1ngx53b2': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '05sk193y': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'hikw2p0a': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '4p2ncphn': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'dq3kvrqe': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '6t5fvfuw': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'ise4ox39': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'hmnjb79t': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'gcc7flv2': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '5uqeyjez': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'cu5ygfrg': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'p7rpvz8f': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'utjpkvgq': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '73xawsri': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '2op741dz': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '2jlyivs9': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'mgmjr02j': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'h4ozyfl1': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'dus8dme4': {
      'en': '',
      'hi': '',
      'te': '',
    },
    'bzfxus5a': {
      'en': '',
      'hi': '',
      'te': '',
    },
    '431elon4': {
      'en': '',
      'hi': '',
      'te': '',
    },
  },
].reduce((a, b) => a..addAll(b));
