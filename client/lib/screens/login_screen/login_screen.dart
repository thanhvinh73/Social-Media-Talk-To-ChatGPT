import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_with_chatgpt/routes/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Image(image: AssetImage("assets/images/logo.png")),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.main);
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Forgor Password?',
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
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
                                image: AssetImage('assets/images/google.png'),
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
                                image:
                                    AssetImage('assets/images/microsoft.png'),
                              ),
                              label: Text(
                                'Microsoft',
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an Account? '),
                          GestureDetector(
                            onTap: () => Get.toNamed(Routes.register),
                            child: Text('Sign up',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
