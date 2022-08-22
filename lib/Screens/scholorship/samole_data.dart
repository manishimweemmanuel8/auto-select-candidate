class SampleData {
  List<Map<String, dynamic>> get data =>
      sampleDataRows.map((row) => row.values).toList();

  final List<SampleDataRow> sampleDataRows = [
    SampleDataRow.fromList([
      'CUBA- RWANDA GOVERNMENT SCHOLARSHIPS',
      "The higher education council (HEC) wishes to infomr the general public that through the bilateral cooperation between the Republic of CUBA and governmanet of Rwanda, the latter has offerde to the covernment of Rwanda one(1) partial scholarshp for Bachelor's levels, in the field of general medicine in academic year 2023",
      "REB",
      'PCB,MCB',
      '90',
      'A',
      '2020-10-10 13:30:30',
    ]),
    SampleDataRow.fromList([
      'Pan African University Call for Applications For the 2022/2023 Academic Year',
      "The Pan African University is an initiative of the Heads of State and Government of the African Union. It is a Premier continental university network whose mission is to provide quality postgraduate education geared towards the achievement of a prosperous, integrated and peaceful Africa",
      'REB',
      'PCB',
      '90',
      'A',
      '2020-10-10 13:30:30',
    ]),
  ];
}

class SampleDataRow {
  SampleDataRow._({
    required this.id,
    required this.renderingEngine,
    required this.browser,
    required this.platform,
    required this.engineVersion,
    required this.cssGrade,
    required this.dateTime,
  });

  factory SampleDataRow.fromList(List<String> values) {
    return SampleDataRow._(
      id: values[0],
      renderingEngine: values[1],
      browser: values[2],
      platform: values[3],
      engineVersion: values[4],
      cssGrade: values[5],
      dateTime: DateTime.parse(values[6]),
    );
  }

  final String id;
  final String renderingEngine;
  final String browser;
  final String platform;
  final String engineVersion;
  final String cssGrade;
  final DateTime dateTime;

  Map<String, dynamic> get values {
    return {
      'id': id,
      'renderingEngine': renderingEngine,
      'browser': browser,
      'platform': platform,
      'engineVersion': engineVersion,
      'cssGrade': cssGrade,
      'dateTime': dateTime,
    };
  }
}
