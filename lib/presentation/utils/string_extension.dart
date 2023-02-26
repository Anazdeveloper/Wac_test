extension StringExtensions on String{
  bool containsIgnoreCase(String secondString) => this.toLowerCase().contains(secondString.toLowerCase());
  bool equalsIgnoreCase(String string2) {
    return this.toLowerCase() == string2.toLowerCase();
  }

}