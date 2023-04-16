import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/authentication/view/widget/signin_fail.dart';
import 'package:movie_app/features/authentication/view_model/signin_provider.dart';
import 'package:provider/provider.dart';

class SigninPages extends StatefulWidget {
  const SigninPages({super.key});

  @override
  State<SigninPages> createState() => _SigninPagesState();
}

class _SigninPagesState extends State<SigninPages> {
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                    scale: 3,
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const Text(
                    'Welcome to Watchit',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Consumer<SigninProvider>(
                      builder: (context, signinProvider, _) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
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
                            obscureText: signinProvider.obscurePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              suffixIcon: InkWell(
                                onTap: () {
                                  context
                                      .read<SigninProvider>()
                                      .changeObsecurePassword();
                                },
                                child: signinProvider.obscurePassword
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
                                'Sign in',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color(0xFFF44E42),
                                ),
                              ),
                              onPressed: () async {
                                var validForm =
                                    formKey.currentState!.validate();

                                if (validForm) {
                                  await context.read<SigninProvider>().signIn(
                                      email: emailController.text,
                                      password: passwordController.text);

                                  if (signinProvider.error == true) {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10),
                                      )),
                                      context: context,
                                      builder: (context) => const SigninFail(),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Signin success!!'),
                                        duration: Duration(milliseconds: 800),
                                      ),
                                    );

                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  }
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          signUpButton(),
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

  Widget signUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("don't have account?"),
        TextButton(
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFFF44E42),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/signup');
          },
        ),
      ],
    );
  }
}
