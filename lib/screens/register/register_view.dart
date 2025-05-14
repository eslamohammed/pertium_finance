import 'package:flutter/material.dart';
import 'package:pretium_finance/Widgets/form_container_widget.dart';
import 'package:pretium_finance/utils/color_manager.dart';

import '../../utils/routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      appBar: AppBar(
        leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(Routes.loginRoute);
              },
              icon:  Icon(
                Icons.arrow_back,
                color: ColorManager.darkgreen,
              ),),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Simplify your crypto payments with us',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 32),
          
              // Custom Input Fields
              FormContainerWidget(
                controller: _firstNameController,
                labelText: 'First Name',
                icon: Icons.person,
              ),
              const SizedBox(height: 16),
          
              FormContainerWidget(
                controller: _lastNameController,
                labelText: 'Last Name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
          
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
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacementNamed(Routes.loginRoute);
                      },
                      child: Text(
                        "Login",
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
