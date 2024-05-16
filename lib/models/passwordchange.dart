class PasswordChange {
  final String message;

  PasswordChange({
    required this.message,

  });

  factory PasswordChange.fromJson(Map<String, dynamic> json) {
    return PasswordChange(
      message: json['message'],
    );
  }
}