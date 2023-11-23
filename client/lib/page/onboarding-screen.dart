import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:social_media_with_chatgpt/constants.dart';
import 'package:social_media_with_chatgpt/page/registration-screen.dart';

import 'login-screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: kTitle1,
            body: kBodyText1,
            image: kImageLogo,
            decoration: const PageDecoration(
              pageColor: Colors.white,
              titleTextStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              bodyTextStyle: TextStyle(color: Colors.green, fontSize: 24),
              imagePadding: EdgeInsets.all(10),
            ),
          ),
          PageViewModel(
            title: kTitle2,
            bodyWidget: const Column(
              children: [
                Text(
                  kBodyText2,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 180,
                  child: LoginButton(),
                ),
                SizedBox(
                  width: 180,
                  child: RegistrationButton(),
                )
              ],
            ),
            image: kImageLogo,
            decoration: const PageDecoration(
                pageColor: Colors.white,
                titleTextStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                imagePadding: EdgeInsets.all(10),
                bodyPadding: EdgeInsets.all(10)),
          ),
          PageViewModel(
            title: kTitle3,
            bodyWidget: const Column(
              children: [
                Text(
                  kBodyText3,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 180,
                  child: LoginButton(),
                ),
                SizedBox(
                  width: 180,
                  child: RegistrationButton(),
                  ),

              ],
            ),
            image: kImageLogo,
            decoration: const PageDecoration(
                pageColor: Colors.white,
                titleTextStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                imagePadding: EdgeInsets.all(10),
                bodyPadding: EdgeInsets.all(10)),
          ),
        ],
        showDoneButton: false,
        showNextButton: false,
        showSkipButton: false,
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.green,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        ),
      ),
    );
  }
}

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationScreen()),
        );
      },
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(Colors.grey),
      ),
      child: const Text("Đăng ký"),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      style: const ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Colors.greenAccent),
      ),
      child: const Text("Đăng nhập"),
    );
  }
}
