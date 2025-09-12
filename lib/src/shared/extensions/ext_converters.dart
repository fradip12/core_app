import 'package:freezed_annotation/freezed_annotation.dart';

class IntegerConverter implements JsonConverter<int, dynamic> {
  const IntegerConverter();

  @override
  int fromJson(dynamic json) => int.tryParse(json.toString()) ?? 0;

  @override
  dynamic toJson(int object) => object;
}

class NonEmptyStringConverter implements JsonConverter<String?, dynamic> {
  const NonEmptyStringConverter();

  @override
  String? fromJson(json) => json is String && json.isNotEmpty ? json : null;

  @override
  toJson(String? object) => object;
}

class DoubleConverter implements JsonConverter<double, dynamic> {
  const DoubleConverter();

  @override
  double fromJson(json) => double.tryParse(json.toString()) ?? 0.0;

  @override
  toJson(double object) => object;
}

class ReadStatusConverter implements JsonConverter<bool, dynamic> {
  const ReadStatusConverter();

  @override
  bool fromJson(dynamic json) => json is bool
      ? json
      : json.toString() == '1' ||
          json.toString() == 'true' ||
          json.toString() == 'YES';

  @override
  dynamic toJson(bool object) => object;
}
