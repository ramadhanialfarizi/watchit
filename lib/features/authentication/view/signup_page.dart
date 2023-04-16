import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/authentication/view/widget/signup_fail.dart';
import 'package:movie_app/features/authentication/view_model/signup_provider.dart';
import 'package:provider/provider.dart';

class SignupPages extends StatefulWidget {
  const SignupPages({super.key});

  @override
  State<SignupPages> createState() => _SignupPagesState();
}

class _SignupPagesState extends State<SignupPages> {
  final formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/app_icon.png',
                    scale: 5,
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    'Create Your Account',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Consumer<SignupProvider>(
                      builder: (context, signupProvider, _) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                              hintText: 'Username',
                              //border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '* please input your name';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              //border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '* please input your email';
                              } else if (!EmailValidator.validate(value)) {
                                return '* please input your valid email';
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: signupProvider.obscurePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: InkWell(
                                onTap: () {
                                  context
                                      .read<SignupProvider>()
                                      .changeObsecurePassword();
                                },
                                child: signupProvider.obscurePassword
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(Icons.remove_red_eye),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '* please input your Password';
                              } else if (value.length < 8) {
                                return '* Password must be have a 8 character';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: confirmPasswordController,
                            obscureText: signupProvider.obscureConfirmPassword,
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              suffixIcon: InkWell(
                                onTap: () {
                                  context
                                      .read<SignupProvider>()
                                      .changeObscureConfirmPassword();
                                },
                                child: signupProvider.obscureConfirmPassword
                                    ? const Icon(Icons.remove_red_eye_outlined)
                                    : const Icon(Icons.remove_red_eye),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '* please confirm your Password';
                              }
                              if (value.length < 8) {
                                return '* Password must be have a 8 character';
                              }
                              if (confirmPasswordController.text !=
                                  passwordController.text) {
                                return '* Password not matched';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFF44E42),
                                ),
                              ),
                              onPressed: () async {
                                final validLogin =
                                    formKey.currentState!.validate();

                                if (validLogin) {
                                  //const CircularProgressIndicator();
                                  await context.read<SignupProvider>().signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );

                                  if (signupProvider.messageError ==
                                      'Email already in use') {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      )),
                                      context: context,
                                      builder: (context) => const SignupFail(
                                          errorMessage: 'Email already in use'),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Signup success!!'),
                                        duration: Duration(milliseconds: 800),
                                      ),
                                    );

                                    context.read<SignupProvider>().signOut();
                                    Navigator.pop(context);
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          signInButton(),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget signInButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("have account?"),
        TextButton(
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: Color(0xFFF44E42),
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
