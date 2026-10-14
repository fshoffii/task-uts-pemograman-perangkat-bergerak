import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';

/// Titik akses data tugas.
///
/// Starter memakai memori agar aplikasi dapat langsung dijalankan. Lengkapi
/// TODO 2 dengan SharedPreferences dan JSON; jangan memindahkan akses storage
/// ke widget.
class TaskStorage {
  TaskStorage({this.loadDelay = const Duration(milliseconds: 450)});

  // UTS - Datetime: 2026-10-09 - key penyimpanan daftar tugas (JSON String).
  static const String _memory = 'tasks_json';

  final Duration loadDelay;

  Future<List<Task>> load({bool simulateError = false}) async {
    await Future<void>.delayed(loadDelay);
    if (simulateError) {
      throw const FormatException('Simulasi data tersimpan yang rusak.');
    }

    // UTS - Datetime: 2026-10-09 - TODO 2a: baca JSON dari SharedPreferences.
    // List<Task> dengan Task.fromJson. JSON rusak dapat menghasilkan
    // FormatException agar UI menampilkan state error.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? raw = prefs.getString(_memory);
    if (raw == null || raw.trim().isEmpty) return <Task>[];

    try {
      final Object? decoded = jsonDecode(raw);
      if (decoded is! List<dynamic>) {
        throw const FormatException('Format data tugas tidak valid.');
      }
      return decoded.map((Object? item) {
        if (item is! Map<String, dynamic>) {
          throw const FormatException('Isi data tugas tidak valid.');
        }
        return Task.fromJson(item);
      }).toList();
    } on FormatException {
      throw const FormatException(
        'Data tugas tersimpan rusak dan tidak bisa dibaca. Coba lagi.',
      );
    }
  }

  Future<void> save(List<Task> tasks) async {
    // UTS - Datetime: 2026-10-09 - TODO 2b: encode daftar ke JSON lalu simpan.
    // SharedPreferences. Periksa nilai bool yang dikembalikan setString.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(
      tasks.map((Task task) => task.toJson()).toList(),
    );
    final bool saved = await prefs.setString(_memory, encoded);
    if (!saved) {
      throw StateError('Daftar tugas gagal disimpan.');
    }
  }
// Datetime: 2026-10-09 - Jika fungsi clear dipanggil, hapus key daftar tugas dari SharedPreferences,
// sehingga daftar tugas akan kosong saat aplikasi dijalankan kembali.
 Future<void> clear() async {
    // TODO 2c: hapus key daftar tugas dari SharedPreferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_memory);
  }

  /// Hanya untuk mengisolasi pengujian lokal. Penyimpanan kini memakai
  /// SharedPreferences, sehingga pengujian mengisolasi data lewat
  static void resetMemoryForTest() {}
}