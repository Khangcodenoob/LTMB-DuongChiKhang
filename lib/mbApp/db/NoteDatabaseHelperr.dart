import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/Note.dart';  // Import lớp Note


class NoteDatabaseHelper {
  static final NoteDatabaseHelper _instance = NoteDatabaseHelper._internal();
  factory NoteDatabaseHelper() => _instance;
  static Database? _database;

  NoteDatabaseHelper._internal();

  // Lấy cơ sở dữ liệu
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Khởi tạo cơ sở dữ liệu
  Future<Database> _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'notes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE notes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            content TEXT,
            priority INTEGER,
            createdAt TEXT,
            modifiedAt TEXT,
            tags TEXT,
            color TEXT
          )
        ''');
      },
    );
  }
//chú
  // Thêm ghi chú
  Future<int> insertNote(Note note) async {
    Database db = await database;
    return await db.insert('notes', note.toMap());
  }

  // Lấy tất cả ghi chú
  Future<List<Note>> getAllNotes() async {
    Database db = await database;
    var result = await db.query('notes');
    return result.isNotEmpty
        ? result.map((note) => Note.fromMap(note)).toList()
        : [];
  }

  // Lấy ghi chú theo ID
  Future<Note?> getNoteById(int id) async {
    Database db = await database;
    var result = await db.query('notes', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Note.fromMap(result.first) : null;
  }

  // Cập nhật ghi chú
  Future<int> updateNote(Note note) async {
    Database db = await database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  // Xóa ghi chú
  Future<int> deleteNote(int id) async {
    Database db = await database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }

  // Lấy ghi chú theo mức độ ưu tiên
  Future<List<Note>> getNotesByPriority(int priority) async {
    Database db = await database;
    var result = await db.query('notes', where: 'priority = ?', whereArgs: [priority]);
    return result.isNotEmpty
        ? result.map((note) => Note.fromMap(note)).toList()
        : [];
  }

  // Tìm kiếm ghi chú theo từ khóa
  Future<List<Note>> searchNotes(String query) async {
    Database db = await database;
    var result = await db.query(
      'notes',
      where: 'title LIKE ? OR content LIKE ?',
      whereArgs: ['%$query%', '%$query%'],
    );
    return result.isNotEmpty
        ? result.map((note) => Note.fromMap(note)).toList()
        : [];
  }
}
