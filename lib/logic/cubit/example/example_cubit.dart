import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_state.dart';
part 'example_cubit.freezed.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(ExampleState.initial());
}
