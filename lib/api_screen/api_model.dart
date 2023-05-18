class ApiModel {
  final String createdAt;
  final String name;
  final String avatar;
  final String id;
  final String anu;

  ApiModel({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.id,
    required this.anu,
  });

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
      createdAt: json['createdAt'],
      name: json['name'],
      avatar: json['avatar'],
      id: json['id'],
      anu: json['anu'],
    );
  }
}