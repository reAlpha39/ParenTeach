import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parenteach/controllers/login_controller.dart';
import 'package:parenteach/utils/custom_scroll_behavior.dart';
import 'package:parenteach/utils/theme.dart';
import 'package:parenteach/widgets/login_provider.dart';
import 'package:parenteach/widgets/login_textfield.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.find();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () =>
            WidgetsBinding.instance!.focusManager.primaryFocus?.unfocus(),
        child: Align(
          alignment: Alignment.center,
          child: ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Text(
                          'ParenTeach',
                          style: pinkTextBold.copyWith(
                            fontStyle: FontStyle.italic,
                            fontSize: 36,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 150,
                        color: pinkColor,
                      )
                    ],
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Image.asset('assets/saly.png'),
                  ),
                  Container(
                    width: 280,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Login In Your Account',
                            style: blackTextBold,
                          ),
                        ),
                        Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: LoginTextField(
                            textEditingController: _loginController.passSekolah,
                            labelText: 'Password Sekolah',
                          ),
                        ),
                        Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: LoginTextField(
                            textEditingController: _loginController.username,
                            labelText: 'Username/Email',
                          ),
                        ),
                        Container(
                          height: 65,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                          child: LoginTextField(
                            textEditingController: _loginController.password,
                            labelText: 'Password',
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style: blackText.copyWith(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => _loginButton(),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Login With',
                    style: blackText,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    width: 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        LoginProvider(
                          imageAsset: 'assets/google_logo.png',
                        ),
                        LoginProvider(
                          imageAsset: 'assets/google_logo.png',
                        ),
                        LoginProvider(
                          imageAsset: 'assets/google_logo.png',
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have Account? ",
                        style: blackText,
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: Text(
                          "Sign Up",
                          style: blackTextBold.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    bool isEnabled = true;
    if (_loginController.isLoading.value) {
      isEnabled = false;
    } else {
      isEnabled = true;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: _buttonState(),
          ),
        ),
        onPressed:
            isEnabled ? () => _loginController.initializeFirestore() : null,
      ),
    );
  }

  Widget _buttonState() {
    if (_loginController.isLoading.value) {
      return SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.white,
          ),
        ),
      );
    } else {
      return Text(
        "Login",
        style: whiteText.copyWith(fontSize: 16),
      );
    }
  }
}
