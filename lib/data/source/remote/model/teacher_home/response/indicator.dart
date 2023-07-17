class Indicator {
  String? color;
  int? minimumPointsPerWeek;
  int? maximumPointsPerWeek;
  int? totalPointsPerWeek;

  Indicator(
      {this.color,
        this.minimumPointsPerWeek,
        this.maximumPointsPerWeek,
        this.totalPointsPerWeek});

  Indicator.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    minimumPointsPerWeek = json['minimumPointsPerWeek'];
    maximumPointsPerWeek = json['maximumPointsPerWeek'];
    totalPointsPerWeek = json['totalPointsPerWeek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['minimumPointsPerWeek'] = this.minimumPointsPerWeek;
    data['maximumPointsPerWeek'] = this.maximumPointsPerWeek;
    data['totalPointsPerWeek'] = this.totalPointsPerWeek;
    return data;
  }
}