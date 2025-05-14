
import 'package:flutter/material.dart';
import '../../Widgets/form_container_widget.dart';
import '../../utils/assets_manager.dart';
import '../../utils/color_manager.dart';
import '../../utils/routes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _isChecked = false;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
               Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // تحكم بحجم الانحناء
                    child: Image.asset(
                      AssetsManager.login,
                      width: 75, 
                      height: 75  ,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              const SizedBox(height: 8),
              const Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in to continue',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
          
              FormContainerWidget(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),
          
              FormContainerWidget(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                isPasswordField: true,
              ),
              const SizedBox(height: 16),
          
              // Terms & Conditions
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isChecked = !_isChecked;
                  });
                },
                child: Row(
                  children: [
                    Checkbox(value: _isChecked, onChanged: (value) {
                       setState(() {
                        _isChecked = value!;
                      });
                    }),
                    const Text('Accept '),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: Color(0xFF14635B),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
          
              // Create Account Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                            .pushReplacementNamed(Routes.homeScreen);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF14635B),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.registerRoute);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: ColorManager.primary,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
