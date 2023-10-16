import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/screens/bloc/signin_event_bloc.dart';
import 'package:form_validation/screens/bloc/signin_state_bloc.dart';

class SignBloc extends Bloc<SignInEvent, SigninState>{
  SignBloc(): super(SigninInitialState()){
    on<SignInChangedEvent>((event, emit) => {
      if(EmailValidator.validate(event.emailvalue)== false){
        emit(SigninEmailErrorState('Please enter valid email'))
      }
      else if(event.Passwordvalue.length<8){
        emit(SigninPasswordErrorState('please enter valid password'))
      }
      else{
        emit(SigninValidState())
      }
    });
    on<SignSubmittedEvent>((event, emit) {
      emit(SiginLoadingState());
    });
  }

}