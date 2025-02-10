import 'package:bloc/bloc.dart';
import 'package:takeed/Features/Auth/Presentation/Logic/LoginCubit/loginState.dart';

class Logincubit extends Cubit<Loginstate> {
  String? selectChoice;
  Logincubit() : super(Iinital());

  void selectEmailOrPhoneLogin({required String selected}) {
    selectChoice = selected;

    emit(LoginItemSelected(selected: selected));
  }
}
