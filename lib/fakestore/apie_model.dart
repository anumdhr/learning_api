class ApieModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  ApieModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ApieModel.fromJson(Map<String, dynamic>json){
    return ApieModel(id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating']));
  }
}
class Rating{
  final num rate;
  final num count;
  Rating({ required this.rate, required this.count});

  factory Rating.fromJson(Map< String, dynamic>json){
    return Rating(rate: json['rate'], count: json['count']);
  }
}