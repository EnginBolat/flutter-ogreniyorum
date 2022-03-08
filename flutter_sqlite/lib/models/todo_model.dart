class Todo {
  late int? id;
  late String? title;
  late DateTime? creationDate;
  late bool isChecked;

  //Constructor
  Todo(
      {this.id,
      required this.title,
      required this.creationDate,
      required this.isChecked});

  //Veriyi Kaydetmek için map'e çevirmek gerekli bunun için bir fonksiyon

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'creationDate': creationDate
          .toString(), //sqflite database dateTime veri türü desteklemiyor
      'isChecked': isChecked
          ? 1
          : 0, //sqflite boolean türüde desteklemiyor o yüzden integer olarak tutuyoruz
    };
  }

  //Bu fonksiyon debug amaçlı
  @override
  String toString() {
    return 'Todo(id : $id,title : $title,creationDate : $creationDate, isChecked : $isChecked)';
  }
}
