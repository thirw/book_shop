import 'package:book_shop/app/modules/signin/controllers/signin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInCard extends GetView<SignInController> {
  final SignInController _signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
        child: GetBuilder<SignInController>(
          assignId: true,
          builder: (_) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
            // height: _signInController.authMode == AuthMode.Signup ? 320 : 260,
            constraints: BoxConstraints(
              minHeight:
                  _signInController.authMode == AuthMode.Signup ? 320 : 260,
            ),
            width: deviceSize.width * 0.75,
            padding: EdgeInsets.all(16),
            child: Form(
              key: _signInController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                      visible: _signInController.authMode == AuthMode.Signup,
                      child: TextFormField(
                        controller: _signInController.nameController,
                        validator: _signInController.nameValidation,
                        decoration: InputDecoration(labelText: 'Name'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                    ),
                    TextFormField(
                      controller: _signInController.emailController,
                      validator: _signInController.emailValidation,
                      decoration: InputDecoration(labelText: 'E-mail'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      controller: _signInController.passwordController,
                      validator: _signInController.passwordValidator,
                      decoration: InputDecoration(labelText: 'Password'),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                    ),
                    Visibility(
                      visible: _signInController.authMode == AuthMode.Signup,
                      child: TextFormField(
                        controller: _signInController.confirmPasswordController,
                        validator: _signInController.confirmPasswordValidator,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration:
                            InputDecoration(labelText: 'Confirm Password'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _signInController.submitLoginForm(context);
                      },
                      child: Text(_signInController.authMode == AuthMode.Login
                          ? 'LOGIN'
                          : 'SIGN UP'),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        _signInController.switchAuthMode();
                      },
                      style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(_signInController.authMode == AuthMode.Login
                          ? 'SIGN UP'
                          : 'LOG IN'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
