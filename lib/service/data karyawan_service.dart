import 'package:firebase_database/firebase_database.dart';
 class DataKaryawan_service{
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref().child('data_karyawan');

  Stream<Map<String, dynamic>> getDataKaryawanStream() {
    return _databaseReference.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value == null) {
        Map<dynamic, dynamic> values = snapshot.value as Map<dynamic, dynamic>;
      } else {
      return data.map((key, value) {
          return MapEntry(key.toString(), value as Map<String, dynamic>); 
      });
    }
   } );
 