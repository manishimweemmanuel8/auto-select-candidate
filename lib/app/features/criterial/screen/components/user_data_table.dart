// import 'package:auto_select_candidate/Screens/scholorship/samole_data.dart';
// import 'package:auto_select_candidate/Screens/user/components/add_new_user_button.dart';
// import 'package:auto_select_candidate/constants.dart';
// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_web_data_table/web_data_table.dart';
// import 'dart:async';

// /// Example without a datasource
// class UserDataTable extends StatefulWidget {
//   const UserDataTable();

//   @override
//   State<UserDataTable> createState() => _UserDataTableState();
// }

// class _UserDataTableState extends State<UserDataTable> {
//   late String _sortColumnName;
//   late bool _sortAscending;
//   List<String>? _filterTexts;
//   bool _willSearch = true;
//   Timer? _timer;
//   int? _latestTick;
//   List<String> _selectedRowKeys = [];
//   int _rowsPerPage = 10;

//   @override
//   void initState() {
//     super.initState();
//     _sortColumnName = 'browser';
//     _sortAscending = false;
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (!_willSearch) {
//         if (_latestTick != null && timer.tick > _latestTick!) {
//           _willSearch = true;
//         }
//       }
//       if (_willSearch) {
//         _willSearch = false;
//         _latestTick = null;
//         setState(() {
//           if (_filterTexts != null && _filterTexts!.isNotEmpty) {
//             _filterTexts = _filterTexts;
//             print('filterTexts = $_filterTexts');
//           }
//         });
//       }
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _timer?.cancel();
//     _timer = null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.all(8.0),
//         child: WebDataTable(
//           header: Text(
//             'Users',
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.w600, color: primaryColor),
//           ),
//           actions: [
//             const AddNewUserButton(),
//             if (_selectedRowKeys.isNotEmpty)
//               SizedBox(
//                 height: 50,
//                 width: 100,
//                 child: RaisedButton(
//                   color: Colors.red,
//                   child: Text(
//                     'Delete',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   onPressed: () {
//                     print('Delete!');
//                     setState(() {
//                       _selectedRowKeys.clear();
//                     });
//                   },
//                 ),
//               ),
//             Container(
//               width: 300,
//               child: TextField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.search),
//                   hintText: 'increment search...',
//                   focusedBorder: const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xFFCCCCCC),
//                     ),
//                   ),
//                   border: const OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xFFCCCCCC),
//                     ),
//                   ),
//                 ),
//                 onChanged: (text) {
//                   _filterTexts = text.trim().split(' ');
//                   _willSearch = false;
//                   _latestTick = _timer?.tick;
//                 },
//               ),
//             ),
//           ],
//           source: WebDataTableSource(
//             sortColumnName: _sortColumnName,
//             sortAscending: _sortAscending,
//             filterTexts: _filterTexts,
//             columns: [
//               WebDataColumn(
//                 name: 'id',
//                 label: const Text('Names'),
//                 dataCell: (value) => DataCell(Text('$value'.substring(0, 25))),
//               ),
//               WebDataColumn(
//                 name: 'renderingEngine',
//                 label: const Text('Description'),
//                 dataCell: (value) => DataCell(Text('$value'.substring(0, 30))),
//               ),
//               WebDataColumn(
//                 name: 'browser',
//                 label: const Text('Program'),
//                 dataCell: (value) => DataCell(Text('$value')),
//               ),
//               WebDataColumn(
//                 name: 'platform',
//                 label: const Text('Combination'),
//                 dataCell: (value) => DataCell(Text('$value')),
//               ),
//               WebDataColumn(
//                 name: 'engineVersion',
//                 label: const Text('Marks'),
//                 dataCell: (value) => DataCell(Text('$value')),
//               ),
//               WebDataColumn(
//                 name: 'cssGrade',
//                 label: const Text('Grade'),
//                 dataCell: (value) => DataCell(Text('$value')),
//                 sortable: false,
//               ),
//               WebDataColumn(
//                   name: 'dateTime',
//                   label: const Text('DateTime'),
//                   dataCell: (value) {
//                     if (value is DateTime) {
//                       final text =
//                           '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
//                       return DataCell(Text(text));
//                     }
//                     return DataCell(Text(value.toString()));
//                   },
//                   filterText: (value) {
//                     if (value is DateTime) {
//                       return '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
//                     }
//                     return value.toString();
//                   }),
//             ],
//             rows: SampleData().data,
//             selectedRowKeys: _selectedRowKeys,
//             onTapRow: (rows, index) {
//               print('onTapRow(): index = $index, row = ${rows[index]}');
//             },
//             onSelectRows: (keys) {
//               print('onSelectRows(): count = ${keys.length} keys = $keys');
//               setState(() {
//                 _selectedRowKeys = keys;
//               });
//             },
//             primaryKeyName: 'id',
//           ),
//           horizontalMargin: 100,
//           onPageChanged: (offset) {
//             print('onPageChanged(): offset = $offset');
//           },
//           onSort: (columnName, ascending) {
//             print('onSort(): columnName = $columnName, ascending = $ascending');
//             setState(() {
//               _sortColumnName = columnName;
//               _sortAscending = ascending;
//             });
//           },
//           onRowsPerPageChanged: (rowsPerPage) {
//             print('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
//             setState(() {
//               if (rowsPerPage != null) {
//                 _rowsPerPage = rowsPerPage;
//               }
//             });
//           },
//           rowsPerPage: _rowsPerPage,
//         ),
//       ),
//     );
//   }
// }
