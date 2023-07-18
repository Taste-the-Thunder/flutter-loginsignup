import 'package:flutter/material.dart';
import 'package:flutter_login_signup/signup.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Text('Login',
                    style: TextStyle(
                        fontSize: 40
                    ),),
                ),
                CircleAvatar(
                  radius: 120,
                  backgroundImage: AssetImage('assets/thor.jpeg'),
                ),
                TextFormField(
                  validator: (value){
                    print('validation:- ${value}');
                    if(value?.length != 10){
                      return 'Please enter Valide number';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Enter Number',
                    hintText: 'Number'
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        print('hurreee');
                      } else {
                        print('not hurreee');
                      }
                    },
                    child: Text('Login')
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                      MaterialPageRoute(builder: (context)=> SignupPage())
                    );
                  },
                    child: Text(
                      'Sign Up',
                        style: TextStyle(fontSize: 20),
                    )
                )
              ],
            ),
          ),
        ),
      );
  }
}