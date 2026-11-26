/// A job in the work history, newest first.
class ExperienceItem {
  final String company;

  /// Role and one line of what it involved.
  final String detail;

  /// Short period label, like "Oct 2026 to now".
  final String period;

  const ExperienceItem({
    required this.company,
    required this.detail,
    required this.period,
  });
}
