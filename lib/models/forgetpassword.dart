class ForgetPassword {
  final String status;
  final String message;
  final String reset_token;

  ForgetPassword({
    required this.message,
    required this.status,
    required this.reset_token,
  });

  factory ForgetPassword.fromJson(Map<String, dynamic> json) {
    return ForgetPassword(
      message: json['message'],
      status: json['status'],
      reset_token: json['reset_token'],
    );
  }
}