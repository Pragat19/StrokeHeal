// ignore_for_file: file_names

class Age {
  final int years;
  final int months;
  final int days;

  Age({required this.years, required this.months, required this.days});

  factory Age.fromDuration(Duration difference) {
    final ageYears = difference.inDays ~/ 365;
    final ageMonths = (difference.inDays % 365) ~/ 30;
    final ageDays = difference.inDays % 30;
    return Age(years: ageYears, months: ageMonths, days: ageDays);
  }
}
