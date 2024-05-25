/// A class that provides static constant [Duration] for various time intervals.
class Delays {
  static const Duration zero = Duration();
  static const Duration mill100 = Duration(milliseconds: 100);
  static const Duration mill200 = Duration(milliseconds: 200);
  static const Duration mill300 = Duration(milliseconds: 300);
  static const Duration mill500 = Duration(milliseconds: 500);

  static const Duration sec1 = Duration(milliseconds: 1000);
  static const Duration sec2 = Duration(milliseconds: 2000);
  static const Duration sec3 = Duration(milliseconds: 3000);

  static const Duration apiTimeout = Duration(seconds: 10);
}
