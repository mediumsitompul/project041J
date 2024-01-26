
class DataModel3 {
  String major1;
  int count1;

  DataModel3({
    required this.major1,
    required this.count1,
  });

  factory DataModel3.fromJson(Map<String, dynamic> json) => DataModel3(
        major1: json["major"],
        count1: int.parse(json["count"]),
      );
}

List<DataModel3> data1ModelFromJson(List data) => List<DataModel3>.from(
      data.map(
        (e) => DataModel3.fromJson(e),
      ),
    );

