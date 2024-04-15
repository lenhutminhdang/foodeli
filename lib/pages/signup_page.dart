import 'package:ct484_project/components/logo.dart';
import 'package:flutter/material.dart';
import 'package:ct484_project/components/form/button.dart';
import 'package:ct484_project/components/form/input.dart';
import 'package:ct484_project/services/auth/auth_service.dart';

class SignupPage extends StatefulWidget {
    final void Function()? onTap;

  const SignupPage({super.key, required this.onTap});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signup() async {
    // get auth service
    final authService = AuthService();

    // password match => create user
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(emailController.text, passwordController.text);
      }
      catch(e) {
        showDialog(
          context: context, 
          builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }

    // password dont match => show error
    else {
      showDialog(
          context: context, 
          builder: (context) => const AlertDialog(
          title: Text('Password must match!'),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Logo(), 
        centerTitle: true
      ),
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Đăng Ký', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.grey.shade700)),
            
            const SizedBox(height: 24),

            // User Input
            Input(
              controller: emailController, 
              placeHolder: 'Email', 
              obscureText: false
            ),
            const SizedBox(height: 12),
            Input(
              controller: passwordController, 
              placeHolder: 'Mật khẩu', 
              obscureText: true
            ),
            const SizedBox(height: 12),
            Input(
              controller: confirmPasswordController, 
              placeHolder: 'Xác nhận mật khẩu', 
              obscureText: true
            ),
            const SizedBox(height: 12),

            Button(label: 'Đăng ký', onTap: signup),

            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bạn đã có tài khoản? ', style: TextStyle(fontSize: 16),),

                  // Click -> go to Sign Up page
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('Đăng nhập ngay', style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}