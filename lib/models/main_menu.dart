class MainMenu {
  final String id;
  final String nameTab;
  final String description;
  final String widgetKey;

  const MainMenu({
    required this.id,
    required this.nameTab,
    this.description = '',
    required this.widgetKey,
  });
}
