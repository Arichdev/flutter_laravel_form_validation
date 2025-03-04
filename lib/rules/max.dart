import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class Max implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  Max(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? tryValidate() {
    final parsedExtra = num.tryParse(extra);
    if (parsedExtra == null) return "Max value not a valid number";
    if (value.length > parsedExtra) {
      if (customMessage == null) {
        return buildMessage(tryValidateStrings.max, attribute, extra);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => Max(value: value, extra: extra);
}
