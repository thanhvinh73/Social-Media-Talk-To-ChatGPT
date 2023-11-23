import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                  width: 170,
                  height: 170,
                  image: AssetImage("images/logo.png")),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40.0,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green),
                    ),
                    onPressed: () => {},
                    child: Text("Login")),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Forgor Password?',
                textAlign: TextAlign.right,
              ),
              Expanded(
                child: SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        )),
                        SizedBox(
                          width: 7,
                        ),
                        Text("Or login with"),
                        SizedBox(
                          width: 7,
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        )),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                            onPressed: () => {},
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            icon: Image(
                              width: 30,
                              height: 30,
                              image: AssetImage('images/google.png'),
                            ),
                            label: Text(
                              'Google',
                              style: TextStyle(color: Colors.black),
                            )),
                        ElevatedButton.icon(
                            onPressed: () => {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.white),
                            ),
                            icon: Image(
                              width: 30,
                              height: 30,
                              image: AssetImage('images/microsoft.png'),
                            ),
                            label: Text(
                              'Microsoft',
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('Don’t have a Account? '),
                  Text('Sign up',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
