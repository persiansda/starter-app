part of 'example_cubit.dart';

@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState({
    required String name,
  }) = EexampleState;

  factory ExampleState.initial() => const ExampleState(
        name: '',
      );
}
