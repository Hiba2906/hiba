import 'dart:convert';

class Appointment {
  final String id;
  final String userId;
  final String userName; // اسم المريض
  final String doctorId;
  final String doctorName; // اسم الطبيب
  final DateTime date;
  final String status; // "Pending", "In Progress", "Completed"
  final int rank; // رتبة المريض حسب ترتيب الحجز

  Appointment({
    required this.id,
    required this.userId,
    required this.userName,
    required this.doctorId,
    required this.doctorName,
    required this.date,
    required this.status,
    required this.rank,
  });

  /// ✅ تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'userName': userName,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'date': date.toIso8601String(), // تحويل `DateTime` إلى `String`
      'status': status,
      'rank': rank,
    };
  }

  /// ✅ تحويل JSON إلى كائن `Appointment`
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      userId: json['userId'],
      userName: json['userName'],
      doctorId: json['doctorId'],
      doctorName: json['doctorName'],
      date: DateTime.parse(json['date']), // تحويل `String` إلى `DateTime`
      status: json['status'],
      rank: json['rank'] ?? 0,
    );
  }

  /// ✅ تحويل الكائن إلى `String JSON` (لحفظه في ملف أو إرساله عبر API)
  String toJsonString() => jsonEncode(toJson());

  /// ✅ تحويل `String JSON` إلى كائن `Appointment`
  factory Appointment.fromJsonString(String jsonString) {
    return Appointment.fromJson(jsonDecode(jsonString));
  }

  /// ✅ `copyWith`: لإنشاء نسخة جديدة مع تعديل بعض القيم فقط
  Appointment copyWith({
    String? id,
    String? userId,
    String? userName,
    String? doctorId,
    String? doctorName,
    DateTime? date,
    String? status,
    int? rank,
  }) {
    return Appointment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      doctorId: doctorId ?? this.doctorId,
      doctorName: doctorName ?? this.doctorName,
      date: date ?? this.date,
      status: status ?? this.status,
      rank: rank ?? this.rank,
    );
  }

  /// ✅ `toString()`: لجعل الطباعة أفضل أثناء التصحيح
  @override
  String toString() {
    return 'Appointment(id: $id, userId: $userId, userName: $userName, doctorId: $doctorId, doctorName: $doctorName, date: $date, status: $status, rank: $rank)';
  }
}
