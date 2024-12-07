import 'package:equatable/equatable.dart';

///  A way to intialize the state of the cubit using Freezed package
/// by using tihs code -> flutter pub run build_runner build --delete-conflicting-outputs

// @freezed
// class CubitExampleState with _$CubitExampleState {
//   const factory CubitExampleState.initial() = _Initial;
// }

///  A way to intialize the state of the cubit using Equatable package
abstract class Loginstate extends Equatable {
  const Loginstate();
  @override
  List<Object> get props => [];
}

class LoginItemSelected extends Loginstate {
  final String selected;
  const LoginItemSelected({required this.selected});
}

class Decrement extends Loginstate {}

class Iinital extends Loginstate {}
