import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './todo_model.dart';

class DatabaseConnect {
  Database? _database;

  //Bir alıcı oluşturup database'e bağlantı açmak

  Future<Database> get database async {
    //veri tabanının cihazdaki konumunu bulmak için
    final dbpath = await getDatabasesPath();
    //veri tabanının adı
    const dbname = "todo.db";
    //Buradaki "join" veri tabanının adına göre konumunu bulur
    final path = join(dbpath, dbname);
    print(path);

    //Bağlantıyı açalım

    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  //_createDB fonksiyonu veri tabanındaki tabloları oluşturmak için kullanılır

  Future<void> _createDB(Database db, int version) async {
    //todo_model dosyasındaki oluşturulan alanlar ile veri tabanının tablolarında
    //oluşturulan tablo alanların aynı olduğuna emin olun

    await db.execute('''
        CREATE TABLE todo(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          creationDate TEXT,
          isChecked INTEGER
        )
''');
  }

  //veri tabanına veri eklemek için kullanılacak fonksiyon

  Future<void> insertTodo(Todo todo) async {
    //veritabanına bağlantı açalım
    final db = await database;
    //todo modeli için veri girişi yapalım

    await db.insert(
      'todo', //tablonun adı
      todo.toMap(), //todo_model dosyasında oluşturduğumuz fonksiyon
      conflictAlgorithm:
          ConflictAlgorithm.replace, //bu yinelenen girişin yerini alacak
    );
  }

  //veri tabanındak veri silmek için fonksiyon
  Future<void> deleteTodo(Todo todo) async {
    final db = await database;
    //id'ye göre silme işlemi
    await db.delete(
      'todo',
      where: 'id == ?',
      whereArgs: [todo.id],
    );
  }

//Veri tabanındaki bütün verileri listelemek için fonksiyon
  Future<List<Todo>> getTodo() async {
    final db = await database;
    //Veritabanından gelen yanıtı map listesi olarak kaydeder
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy:
          'id DESC', //id leri büyükten küçüğe listeler böylelikle son eklenen tepede kalır
    );

    return List.generate(
      items.length,
      (i) => Todo(
        id: items[i]['id'],
        title: items[i]['title'],
        creationDate: DateTime.parse(items[i][
            'creationDate']), //Şuanda text formatında bunu dateTime formatına çevirelim
        isChecked: items[i]['isChecked'] == 1
            ? true
            : false, //Integer değerden boolean değere çevirdik
      ),
    );
  }
}
