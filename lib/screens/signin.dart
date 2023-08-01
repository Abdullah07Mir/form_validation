import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/screens/bloc/signin_event_bloc.dart';
import 'package:form_validation/screens/bloc/signin_state_bloc.dart';

import 'bloc/signin_bloc.dart';

class SignInPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SignBloc, SigninState>(
              builder: (context, state) {
                if (state is SigninErrorState) {
                  return Text(
                    state.errorMsg,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: emailController,
              onChanged: (val) {
                BlocProvider.of<SignBloc>(context).add(SignInChangedEvent(emailController.text.trim(), passwordController.text.trim()));
              },
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              onChanged: (val) {
                BlocProvider.of<SignBloc>(context).add(SignInChangedEvent(emailController.text.trim(), passwordController.text.trim()));
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            BlocBuilder<SignBloc, SigninState>(
              builder: (context, state) {
                if(state is SiginLoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }
                return ElevatedButton(
                  onPressed: () {
                    // Handle sign-in action
                    if(state is SigninValidState){
                         BlocProvider.of<SignBloc>(context).add(SignSubmittedEvent(emailController.text.trim(), passwordController.text.trim()));
                    }
                  },
                  child: Text('Sign In'),
                  style: ElevatedButton.styleFrom(backgroundColor: (state is SigninValidState)? Colors.blue : Colors.grey),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
