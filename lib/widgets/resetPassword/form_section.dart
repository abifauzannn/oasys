import 'package:flutter/material.dart';
import 'package:oasys/api/auth_api.dart';
import 'dart:convert';

class FormSection extends StatefulWidget {
  const FormSection({Key? key}) : super(key: key);

  @override
  _FormSectionState createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordCurrentVisible = false;
  bool _isPasswordNewVisible = false;
  bool _isPasswordConfirmVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Widget buildTitle() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Reset Password',
        style: TextStyle(
          fontFamily: 'poppins',
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  Widget buildCurrentPasswordTextField() {
    return TextFormField(
      obscureText: !_isPasswordCurrentVisible,
      controller: _currentPasswordController,
      decoration: InputDecoration(
        labelText: 'Current Password',
        filled: true,
        fillColor: const Color(0xFFF6F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordCurrentVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black45,
          ),
          onPressed: () {
            setState(() {
              _isPasswordCurrentVisible = !_isPasswordCurrentVisible;
            });
          },
        ),
      ),
    );
  }

  Widget buildNewPasswordTextField() {
    return TextFormField(
      obscureText: !_isPasswordNewVisible,
      controller: _newPasswordController,
      decoration: InputDecoration(
        labelText: 'New Password',
        filled: true,
        fillColor: const Color(0xFFF6F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordNewVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black45,
          ),
          onPressed: () {
            setState(() {
              _isPasswordNewVisible = !_isPasswordNewVisible;
            });
          },
        ),
      ),
    );
  }

  Widget buildConfirmPasswordTextField() {
    return TextFormField(
      obscureText: !_isPasswordConfirmVisible,
      controller: _confirmPasswordController,
      validator: _validateConfirmPassword,
      decoration: InputDecoration(
        labelText: 'Confirm New Password',
        filled: true,
        fillColor: const Color(0xFFF6F7FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black),
        ),
        labelStyle: const TextStyle(
          color: Colors.black45,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordConfirmVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.black45,
          ),
          onPressed: () {
            setState(() {
              _isPasswordConfirmVisible = !_isPasswordConfirmVisible;
            });
          },
        ),
      ),
    );
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter confirm password';
    }

    if (value != _newPasswordController.text) {
      return 'Confirm password does not match new password';
    }

    return null;
  }

  void showErrorSnackBar(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red[50],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.red),
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.error, color: Colors.red),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Error!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'poppins',
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    error,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: 'poppins',
                      fontSize: 12,
                    ),
                    maxLines: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green[50],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.green),
        ),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: MediaQuery.of(context).size.width * 0.05),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Success!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'poppins',
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    message,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: 'poppins',
                      fontSize: 12,
                    ),
                    maxLines: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

void handleResetButtonPressed() async {
  String currentPassword = _currentPasswordController.text;
  String newPassword = _newPasswordController.text;
  String confirmPassword = _confirmPasswordController.text;

  if (_formKey.currentState!.validate()) {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await AuthApi.changePassword(
        currentPassword,
        newPassword,
        confirmPassword,
      );

      // Akses pesan dari respons
      final message = response.message;

      if (message != null && message.isNotEmpty) {
        showSuccessSnackBar(message);
      } else {
        showErrorSnackBar(message);
      }
    } catch (e) {
      // Tampilkan pesan error langsung dari pengecualian yang ditangkap (e)
      showErrorSnackBar('Failed to change password: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}







  @override
  Widget build(BuildContext context) {
    final screenHeigt = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: screenHeigt * 0.03),
                    buildTitle(),
                    SizedBox(height: screenHeigt * 0.03),
                    buildCurrentPasswordTextField(),
                    SizedBox(height: screenHeigt * 0.03),
                    buildNewPasswordTextField(),
                    SizedBox(height: screenHeigt * 0.03),
                    buildConfirmPasswordTextField(),
                    SizedBox(height: screenHeigt * 0.03),
                    ElevatedButton(
                      onPressed: _isLoading ? null : handleResetButtonPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 9, 78, 134),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 16),
                        minimumSize: const Size(double.infinity, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadowColor: Colors.black.withOpacity(0.2),
                        elevation: 5,
                      ),
                      child: _isLoading
                          ? CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey,
                            )
                          : const Text(
                              'Change Password',
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
