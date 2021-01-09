extension StringExtension on String {
  String intrlliTrim(int size) {
    return this.length > size ? '${this.substring(0, size)}...' : this;
  }
}
