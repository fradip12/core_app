import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_response.freezed.dart';
part 'base_response.g.dart';

@Freezed(fromJson: true, toJson: true, genericArgumentFactories: true)
class BaseResponse<T> with _$BaseResponse<T> {
  const BaseResponse._();
  const factory BaseResponse({
    int? count,
    int? code,
    String? message,
    T? results,
  }) = _BaseResponse;

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) {
    return _$BaseResponseFromJson(json, fromJsonT);
  }
}
