import 'package:book_shop/app/data/models/user/user.dart';
import 'package:book_shop/app/data/providers/sign_in_provider.dart';
import 'package:book_shop/app/data/providers/sign_up_provider.dart';
import 'package:book_shop/app/routes/app_pages.dart';
import 'package:book_shop/app/utils/cofigs/helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthMode { Signup, Login }

class SignInController extends GetxController
    with SingleGetTickerProviderMixin {
  final _authMode = AuthMode.Login.obs;

  set authMode(value) => _authMode.value = value;

  get authMode => _authMode.value;

  final _isLoading = false.obs;

  set isLoading(value) => _isLoading.value = value;

  get isLoading => _isLoading.value;

  final _nameController = TextEditingController().obs;

  get nameController => _nameController.value;

  set nameController(val) => _nameController.value = val;

  final _emailController = TextEditingController().obs;

  get emailController => _emailController.value;

  set emailController(val) => _emailController.value = val;

  final _passwordController = TextEditingController().obs;

  get passwordController => _passwordController.value;

  set passwordController(val) => _passwordController.value = val;

  final _confirmPasswordController = TextEditingController().obs;

  get confirmPasswordController => _confirmPasswordController.value;

  set confirmPasswordController(val) => _confirmPasswordController.value = val;

  final _formKey = GlobalKey<FormState>().obs;

  get formKey => _formKey.value;

  set formKey(val) => _formKey.value = val;

  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Animation<double> opacityAnimation;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.5),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    animationController.dispose();
  }

  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? emailValidation(String? value) {
    final isEmail = Helper().emailValidate(value!);
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!isEmail) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty || value.length < 7) {
      return 'Password must be least 7 characters long.';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value != passwordController.text) {
      return 'Password do not match.';
    }
    return null;
  }

  Future<void> initAnimationController() async {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  void submitLoginForm(BuildContext context) {
    final bool isValid = formKey.currentState.validate();
    if (isValid) {
      if (authMode == AuthMode.Login) {
        loginWithEmailPassword(context);
      } else {
        signUpWithEmailPassword(context);
      }
    }
  }

  void loginWithEmailPassword(BuildContext context) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final Map<String, String> data = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };
        final User response = await SignInProvider().onSingIn(data);
        await prefs.setInt('memberId', response.id);
        await prefs.setBool('isLoggedIn', true);
        Get.offAllNamed(AppRoutes.HOME);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Cannot sign up please try again.'),
        duration: const Duration(seconds: 1),
      ));
    }
  }

  void signUpWithEmailPassword(BuildContext context) async {
    try {
      final Map<String, String> data = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };

      await SignUpProvider().onSingUp(data);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Sign up success.'),
        duration: const Duration(seconds: 1),
      ));
      switchAuthMode();

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Cannot sign up please try again.'),
        duration: const Duration(seconds: 1),
      ));
    }
  }

  void switchAuthMode() {
    if (_authMode.value == AuthMode.Login) {
      authMode = AuthMode.Signup;
      animationController.forward();
      update();
    } else {
      authMode = AuthMode.Login;
      animationController.reverse();
      update();
    }
    animationController.reverse();
    update();
  }
}
