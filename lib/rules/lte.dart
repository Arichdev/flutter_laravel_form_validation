import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class LessThanOrEqual implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  LessThanOrEqual(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? tryValidate() {
    final parsedValue = num.tryParse(value);
    final parsedExtra = num.tryParse(extra);
    if (parsedValue == null || parsedExtra == null) return "Not a valid number";
    if (!(parsedValue <= parsedExtra)) {
      if (customMessage == null) {
        return buildMessage(tryValidateStrings.lte, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => LessThanOrEqual(value: value, extra: extra);
}
