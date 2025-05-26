enum FromWho{me,hers}
//identidad atomica: la unidad mas pequeña
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime time; 
  bool seen;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    DateTime? time,
    this.seen = false,
    }): time = time?? DateTime.now();


}