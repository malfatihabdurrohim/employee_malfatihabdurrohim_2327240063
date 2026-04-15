import 'package:flutter/material.dart';

class DataKaryawan extends StatelessWidget {
  const DataKaryawan({super.key});

  @override
  State<DataKaryawan> createState() => _DataKaryawanState();
}

class _DataKaryawanState extends State<DataKaryawan> {
  final TextEditingController _controller = TextEditingController();
  final DataKaryawan_service _dataKaryawanService = DataKaryawan_service();
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: 
                  const InputDecoration(
                    labelText: 'Cari Karyawan',
                  ),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: StreamBuilder <Map<String, dynamic>>(
            stream: _dataKaryawanService.getDataKaryawanStream(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final dataKaryawan = snapshot.data!;
                return ListView.builder(
                  itemCount: dataKaryawan.length,
                  itemBuilder: (context, index) {
                    final key = dataKaryawan.keys.elementAt(index);
                    final value = dataKaryawan[key];
                    return ListTile(
                      title: Text(value['nama']),
                      subtitle: Text('ID: $key'),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        )
        
      ],
  } ); 
}