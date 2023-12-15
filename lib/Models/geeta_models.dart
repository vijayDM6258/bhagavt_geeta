class geetaModel {
  int chapter_number;
  int id;
  int verses_count;
  String chapter_summary;
  String chapter_summary_hindi;
  String name;
  String name_meaning;
  String name_translation;

  geetaModel(
      {required this.chapter_number,
      required this.id,
      required this.chapter_summary,
      required this.chapter_summary_hindi,
      required this.name,
      required this.name_meaning,
      required this.name_translation,
      required this.verses_count});
}
