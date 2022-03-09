import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();

  double _result = 0;
  String selectedDropDown = "Kelvin";
  List<String> listSuhu = [
    "Kelvin",
    "Reamur",
    "Fahrenheit",
  ];
  List<String> listHasil = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Konverter Suhu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: etInput,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Masukkan Suhu Dalam Celcius"),
              ),
              const SizedBox(height: 10),
              DropdownButton(
                isExpanded: true,
                value: selectedDropDown,
                items: listSuhu.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  onDropdownChanged(value);
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Hasil',
                style: TextStyle(fontSize: 23),
              ),
              Text(
                '$_result',
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        konversiSuhu();
                      },
                      child: const Text('Konversi Suhu'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'Riwayat Konversi',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    itemCount: listHasil.length,
                    itemBuilder: (content, index) {
                      return Text(listHasil[index]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void konversiSuhu() {
    return setState(() {
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case "Kelvin":
            _result = int.parse(etInput.text) + 273.15;
            listHasil.add("Kelvin");
            break;
          case "Reamur":
            _result = int.parse(etInput.text) * 0.8;
            listHasil.add("Reamur");
            break;
          case "Fahrenheit":
            _result = (int.parse(etInput.text) * 1.8) + 32;
            listHasil.add("Fahrenheit");
            break;
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius ke " +
            selectedDropDown +
            " dengan hasil = " +
            _result.toString());
      }
    });
  }

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDropDown = value.toString();
      if (etInput.text.isNotEmpty) {
        switch (selectedDropDown) {
          case "Kelvin":
            _result = int.parse(etInput.text) + 273.15;
            listHasil.add("Kelvin");
            break;
          case "Reamur":
            _result = int.parse(etInput.text) * 0.8;
            listHasil.add("Reamur");
            break;
          case "Fahrenheit":
            _result = (int.parse(etInput.text) * 1.8) + 32;
            listHasil.add("Fahrenheit");
            break;
        }
        listHasil.add("Konversi dari " +
            etInput.text +
            " Celcius ke " +
            selectedDropDown +
            " dengan hasil = " +
            _result.toString());
      }
    });
  }
}
