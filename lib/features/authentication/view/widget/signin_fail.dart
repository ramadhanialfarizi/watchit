import 'package:flutter/material.dart';

class SigninFail extends StatelessWidget {
  const SigninFail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Image.asset('assets/images/signin_error.png'),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Sign in failed. make sure your email and password has correctly',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xFFF44E42),
              ),
            ),
            child: const Text(
              'Try Again',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
