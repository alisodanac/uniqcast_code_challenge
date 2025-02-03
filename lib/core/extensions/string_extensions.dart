extension StringExtension on String {
  bool get isUrlLink  {
    final urlPattern = RegExp(
      r'^(https?:\/\/)?' 
      r'(([a-zA-Z0-9$-_@.&+!*"(),]|%[0-9a-fA-F]{2})+)' 
      r'(\.[a-zA-Z]{2,})+' 
      r'(:\d{2,5})?' 
      r'(\/[^\s]*)?$', 
      caseSensitive: false,
    );
    return urlPattern.hasMatch(this);
  }
}