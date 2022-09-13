import 'package:flutter/material.dart';

final List<Map<String, dynamic>> items = [
  {
    'value': 'boxValue',
    'label': 'Box Label',
    'icon': Icon(Icons.stop),
  },
  {
    'value': 'circleValue',
    'label': 'Circle Label',
    'icon': Icon(Icons.fiber_manual_record),
    'textStyle': TextStyle(color: Colors.red),
  },
  {
    'value': 'starValue',
    'label': 'Star Label',
    'enable': false,
    'icon': Icon(Icons.grade),
  },
];