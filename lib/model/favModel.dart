// class ItemModel {
//   String title;
//   String subTitle;
//
//   ItemModel({required this.title, required this.subTitle});
// }
class ItemModel {
  String title;
  String subTitle;
  ItemModel({
    required this.title,
    required this.subTitle,
  });
  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
      };
}
