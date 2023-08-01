abstract class SigninState{}

class SigninInitialState extends SigninState{

}
class SigninInvalidState extends SigninState{

}
class SigninValidState extends SigninState{

}
class SigninErrorState extends SigninState{
 final String errorMsg;
  SigninErrorState(this.errorMsg);
}

class SiginLoadingState extends SigninState{}