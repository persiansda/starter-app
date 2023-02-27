import 'package:freezed_annotation/freezed_annotation.dart';

part 'example.freezed.dart';
part 'example.g.dart';

@freezed
class Example with _$Example {
  const Example._();
  const factory Example({
    required String name,
  }) = _Example;

  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);
}
