import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Email', enabledBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: height/20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Password', enabledBorder: OutlineInputBorder()),
              ),
              SizedBox(
                height: height/20,
              ),
              MaterialButton(
                onPressed: (){
                  Navigator.popAndPushNamed(context, "/");
                }
              ,
                color: Theme.of(context).colorScheme.primary,
                child: Text('LOGIN',style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
