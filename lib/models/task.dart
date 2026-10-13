/// Data satu tugas praktikum.
///
/// Lengkapi serialisasi JSON pada TODO 1 agar model dapat disimpan dan dibaca
/// kembali menggunakan SharedPreferences.
class Task {
  const Task({
    required this.id,
    required this.title,
    required this.course,
    this.isDone = false,
  });

  final String id;
  final String title;
  final String course;
  final bool isDone;

  Task copyWith({bool? isDone}) => Task(
        id: id,
        title: title,
        course: course,
        isDone: isDone ?? this.isDone,
      );

  Map<String, dynamic> toJson() {
    // UTS - Datetime: 2026-10-09 - Implementasi serialisasi model Task ke Map Json.
    // TODO 1a: kembalikan Map untuk id, title, course, dan isDone.
    return <String, dynamic>{
      'id': id,
      'title': title,
      'course': course,
      'isDone': isDone,
    };
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    // UTS - Datetime: 2026-10-09 - Implementasi deserialisasi model Task dari Map Json.
    // TODO 1b: bangun Task dari Map hasil jsonDecode.
    // Gunakan nilai aman bila data lama tidak memiliki sebuah key.
    return Task(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      course: json['course'] as String? ?? '',
      isDone: json['isDone'] as bool? ?? false,
    );
  }
}