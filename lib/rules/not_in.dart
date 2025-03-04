import 'package:flutter_laravel_form_validation/constants/strings.dart';
import 'package:flutter_laravel_form_validation/helper.dart';
import 'package:flutter_laravel_form_validation/rules/rule_protocol.dart';

class NotIn implements RuleProtocol {
  @override
  final String value;
  final String? attribute;
  final String? customMessage;
  final String extra;
  NotIn(
      {required this.value,
      this.attribute,
      this.customMessage,
      required this.extra});

  @override
  String? tryValidate() {
    assert(extra.isNotEmpty, "Values to check from is required");
    final extraToList = extra.split(",");
    if (extraToList.contains(value)) {
      if (customMessage == null) {
        return buildMessage(tryValidateStrings.notIn, attribute);
      }
      return customMessage;
    }
    return null;
  }

  @override
  RuleProtocol get instance => NotIn(value: value, extra: extra);
}
