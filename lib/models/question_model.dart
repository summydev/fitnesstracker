class Question {
  final String id;
  final String title;
  final Map<String, bool> option;

  Question({required this.id, required this.title, required this.option});

  @override
  String toString() {
    return 'Questio(id: $id, title: $title, answer:$option )';
  }
}
