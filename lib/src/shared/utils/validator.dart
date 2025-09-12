// import 'package:flutter/widgets.dart';

// import '../extensions/ext_misc.dart';

// /// Validates a phone number string
// /// Returns null if valid, or an error message if invalid

// extension ValidatorX on BuildContext {
//   String? validatePhone(String? value) {
//     if (value == null || value.isEmpty) {
//       return l10n.phoneNumberNotCorrect;
//     }
//     final String phoneNum = value.replaceAll('-', '');

//     if (phoneNum.startsWith('010') && phoneNum.length < 11) {
//       return l10n.phoneNumberNotCorrect;
//     }

//     if (phoneNum.startsWith('02') && phoneNum.length < 10) {
//       return l10n.phoneNumberNotCorrect;
//     }
//     if (!phoneNum.startsWith('010') && !phoneNum.startsWith('02')) {
//       return l10n.phoneNumberNotCorrect;
//     }
//     return null;
//   }
// }
