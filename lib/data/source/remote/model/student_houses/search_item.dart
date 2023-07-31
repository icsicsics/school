import 'dart:convert';

class SearchItem {
  final int id;
  final String name;

  const SearchItem({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'SearchItem{' + ' id: $id,' + ' name: $name,' + '}';
  }

  SearchItem copyWith({
    int? id,
    String? name,
  }) {
    return SearchItem(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory SearchItem.fromJson(Map<String, dynamic> map) {
    return SearchItem(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJsonString() {
    Map<String, dynamic> data = toJson();
    return json.encode(data);
  }

  static SearchItem fromJsonString(String jsonString) {
    Map<String, dynamic> data = json.decode(jsonString);
    return SearchItem.fromJson(data);
  }
}
