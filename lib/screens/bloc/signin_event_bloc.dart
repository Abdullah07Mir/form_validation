abstract class SignInEvent{}

class SignInChangedEvent extends SignInEvent{
final String emailvalue;
final String Passwordvalue;
SignInChangedEvent(this.emailvalue, this.Passwordvalue);
}

class SignSubmittedEvent extends SignInEvent{
final String email;
final String Password;
SignSubmittedEvent(this.email, this.Password);
}