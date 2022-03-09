import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  const Dropdown({
    Key? key,
    required this.selectedDropdown,
    required this.listSatuanSuhu,
    required this.onChangedDropdown,
  }) : super(key: key);

  final String selectedDropdown;
  final List<String> listSatuanSuhu;
  final Function onChangedDropdown;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: selectedDropdown,
        isExpanded: true,
        items: listSatuanSuhu.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          onChangedDropdown(value);
        });
  }
}
