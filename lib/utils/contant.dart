bool isValidEmail(String email) {
  final RegExp emailRegExp = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(co|in|com)$",
  );
  return emailRegExp.hasMatch(email);
}
