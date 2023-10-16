abstract class SigninState{}

class SigninInitialState extends SigninState{

}
class SigninInvalidState extends SigninState{

}
class SigninValidState extends SigninState{

}
class SigninEmailErrorState extends SigninState{
 final String errormsg;
  SigninEmailErrorState(this.errormsg);
}
class SigninPasswordErrorState extends SigninState{
 final String errorMsg;
  SigninPasswordErrorState(this.errorMsg);
}

class SiginLoadingState extends SigninState{}