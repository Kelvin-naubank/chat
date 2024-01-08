import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

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
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // auth_2_Create
  {
    'hikxqsms': {
      'en': 'flow.io',
      'es': 'flujo.io',
    },
    'ix1sirrr': {
      'en': 'Get Started',
      'es': 'Empezar',
    },
    'q3g7o0r3': {
      'en': 'Create an account by using the form below.',
      'es': 'Cree una cuenta utilizando el siguiente formulario.',
    },
    'xrodmia5': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'cnumyw3j': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'ybmkd4ar': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'tpqyz3xj': {
      'en': 'Or sign up with',
      'es': 'O regístrate con',
    },
    '1ryxg46n': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
    },
    'yeeaq5fh': {
      'en': 'Continue with Apple',
      'es': 'Continuar con Apple',
    },
    'vzxvbh8s': {
      'en': 'Already have an account? ',
      'es': '¿Ya tienes una cuenta?',
    },
    't1iyrm1y': {
      'en': 'Sign in here',
      'es': 'Firme aquí',
    },
    'r9amgmqe': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // auth_2_Login
  {
    'nb76ks10': {
      'en': 'flow.io',
      'es': 'flujo.io',
    },
    'r2fivb4e': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
    },
    '2omi54tc': {
      'en': 'Fill out the information below in order to access your account.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
    },
    'g5u0fv91': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'a2sxsp46': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    '56y2qsu6': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    'xayak2lu': {
      'en': 'Or sign in with',
      'es': 'O inicia sesión con',
    },
    'vigo7me2': {
      'en': 'Continue with Google',
      'es': 'Continuar con Google',
    },
    'z3a7wkf2': {
      'en': 'Continue with Apple',
      'es': 'Continuar con Apple',
    },
    'h6e3vonp': {
      'en': 'Don\'t have an account?  ',
      'es': '¿No tienes una cuenta?',
    },
    'uinnbxkh': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'xtww6o3x': {
      'en': 'Forgot password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '456b3j45': {
      'en': 'Login',
      'es': 'Hogar',
    },
  },
  // auth_2_ForgotPassword
  {
    '0c6auxy7': {
      'en': 'flow.io',
      'es': 'flujo.io',
    },
    'o03d3y49': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
    },
    'cgzftx51': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'es':
          'Complete su correo electrónico a continuación para recibir un enlace para restablecer la contraseña.',
    },
    'i12u61y2': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    '0wdnl4jk': {
      'en': 'Send Reset Link',
      'es': 'Enviar enlace de reinicio',
    },
    'g1mzgqk6': {
      'en': 'Restore',
      'es': 'Hogar',
    },
  },
  // auth_2_createProfile
  {
    'mn0m5abh': {
      'en': 'flow.io',
      'es': 'flujo.io',
    },
    'rhkuhz4p': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // auth_2_Profile
  {
    'bceocc5z': {
      'en': 'Your Account',
      'es': 'Su cuenta',
    },
    'zunoifpj': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
    },
    'p1ifo65v': {
      'en': 'App Settings',
      'es': 'Ajustes de Aplicacion',
    },
    'kpjzl9rq': {
      'en': 'Support',
      'es': 'Apoyo',
    },
    'ankd0pld': {
      'en': 'Terms of Service',
      'es': 'Términos de servicio',
    },
    '4jw35qiu': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
    },
    'ea10gj7f': {
      'en': 'profile',
      'es': 'Hogar',
    },
  },
  // auth_2_EditProfile
  {
    'k8t6zd9u': {
      'en': 'Edit',
      'es': 'Hogar',
    },
  },
  // chat_2_Details
  {
    'vhmof3gm': {
      'en': 'Group Chat',
      'es': 'Grupo de chat',
    },
    '9zk4jikx': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // chat_2_main
  {
    '5hqst8s7': {
      'en': 'Below are your chats and group chats',
      'es': 'A continuación se muestran tus chats y chats grupales.',
    },
    'tgs7fze9': {
      'en': 'Group Chat',
      'es': 'Grupo de chat',
    },
    'ef5u43u8': {
      'en': 'My Chats',
      'es': 'Mis Chats',
    },
    'qb42tnn9': {
      'en': 'Chats',
      'es': '__',
    },
  },
  // chat_2_InviteUsers
  {
    '2vnkkx0a': {
      'en': 'Invite Friends',
      'es': 'Invitar a amigos',
    },
    'frpfuv54': {
      'en': 'Selected',
      'es': 'Seleccionado',
    },
    '2oie6g9x': {
      'en': 'Invite Friends',
      'es': 'Invitar a amigos',
    },
    'io1r510n': {
      'en': 'Select users from below to start a chat.',
      'es': 'Seleccione usuarios de abajo para iniciar un chat.',
    },
    'kha4dfk5': {
      'en': 'Add',
      'es': 'Hogar',
    },
  },
  // image_Details
  {
    'pnius7cf': {
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // GraphPage
  {
    'kz3wikqv': {
      'en': 'Home',
      'es': '',
    },
  },
  // editProfile_auth_2
  {
    'brtvpict': {
      'en': 'Adjust the content below to update your profile.',
      'es': 'Ajuste el contenido a continuación para actualizar su perfil.',
    },
    'at8cowlx': {
      'en': 'Change Photo',
      'es': 'Cambiar foto',
    },
    'tyzwqlh6': {
      'en': 'Full Name',
      'es': 'Nombre completo',
    },
    'bk8tkhpw': {
      'en': 'Your full name...',
      'es': 'Tu nombre completo...',
    },
    'b6i634k0': {
      'en': 'Owner/Founder',
      'es': 'Propietario/Fundador',
    },
    '5nbyqsfo': {
      'en': 'Director',
      'es': 'Director',
    },
    'eg93e6mc': {
      'en': 'Manager',
      'es': 'Gerente',
    },
    '7ksvv279': {
      'en': 'Mid-Manager',
      'es': 'Gerente medio',
    },
    'wn3vnd1e': {
      'en': 'Employee',
      'es': 'Empleado',
    },
    '3wffgnzn': {
      'en': 'Your Role',
      'es': 'Tu rol',
    },
    'xr3iasg0': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    '4crba6sh': {
      'en': 'Short Description',
      'es': 'Breve descripción',
    },
    'jf8xqx6t': {
      'en': 'A little about you...',
      'es': 'Un poco sobre ti...',
    },
  },
  // chat_DetailsOverlay
  {
    '6jirv945': {
      'en': 'Group Chat ID: ',
      'es': 'ID de chat grupal:',
    },
    'i9ulrj08': {
      'en': 'In this chat',
      'es': 'en esta charla',
    },
    '1xxr41ss': {
      'en': 'Close',
      'es': 'Cerca',
    },
  },
  // chat_ThreadComponent
  {
    '81i98p5n': {
      'en': 'Start typing here...',
      'es': 'Empieza a escribir aquí...',
    },
    'wse1wynv': {
      'en': 'You must enter a message...',
      'es': 'Debes ingresar un mensaje...',
    },
    'gjlz5i3e': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // user_ListSmall
  {
    'wgqsfzrn': {
      'en': 'ME',
      'es': 'A MÍ',
    },
  },
  // deleteDialog
  {
    'it0guau7': {
      'en': 'Options',
      'es': 'Opciones',
    },
    'jvtktmha': {
      'en': 'Invite Users',
      'es': 'Invitar usuarios',
    },
    '55mdqusm': {
      'en': 'Delete Chat',
      'es': 'Eliminar chat',
    },
    'ij3biewu': {
      'en': 'Confirm Delete',
      'es': 'Confirmar eliminación',
    },
    'wog8kcw8': {
      'en': 'You can\'t undo this action.',
      'es': 'No puedes deshacer esta acción.',
    },
    '11nae8yi': {
      'en': 'Delete',
      'es': 'Borrar',
    },
  },
  // Miscellaneous
  {
    'vdotavo0': {
      'en': '',
      'es': '',
    },
    'w6rvko9y': {
      'en': '',
      'es': '',
    },
    'kv5gdhdk': {
      'en': '',
      'es': '',
    },
    'vkl07ep5': {
      'en': '',
      'es': '',
    },
    'onzlsgjk': {
      'en': '',
      'es': '',
    },
    '3fqohwmc': {
      'en': '',
      'es': '',
    },
    '9kylqeyg': {
      'en': '',
      'es': '',
    },
    '3h37nkuo': {
      'en': '',
      'es': '',
    },
    'or2kvadb': {
      'en': '',
      'es': '',
    },
    'xtihxoaf': {
      'en': '',
      'es': '',
    },
    'c2ie1eq3': {
      'en': '',
      'es': '',
    },
    '1inqvj07': {
      'en': '',
      'es': '',
    },
    '3n9pcy44': {
      'en': '',
      'es': '',
    },
    'hekqmenz': {
      'en': '',
      'es': '',
    },
    'sxx8wa6q': {
      'en': '',
      'es': '',
    },
    'ija6qwic': {
      'en': '',
      'es': '',
    },
    'jrwxg4z9': {
      'en': '',
      'es': '',
    },
    'cwwf7298': {
      'en': '',
      'es': '',
    },
    'd3iintkj': {
      'en': '',
      'es': '',
    },
    'cgdmhcki': {
      'en': '',
      'es': '',
    },
    'nf12ilqb': {
      'en': '',
      'es': '',
    },
    'sa9ne9i7': {
      'en': '',
      'es': '',
    },
    'tnil5ytq': {
      'en': '',
      'es': '',
    },
    'd9j970yk': {
      'en': '',
      'es': '',
    },
    'e8zmleso': {
      'en': '',
      'es': '',
    },
    'vc95gsti': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
