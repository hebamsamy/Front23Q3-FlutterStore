class Product {
  String id;
  String name;
  String imgURL;
  String description;
  String status;
  int categoryID;
  int quantity;
  int price;
  List<String> colors = [];
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
    required this.categoryID,
    required this.description,
    required this.imgURL,
    required this.colors,
    required this.status,
  });
}
// {"_id":"645b1b5a389bd23cee74608a"
// ,"name":"Dell 2023",
// "price":2002020,
// "quantity":20,
// "categoryID":1
// ,"imgURL":"http://localhost:5000/1683843835206_ro.png",
// "colors":["undefined,#918d8d"],
// "createdDate":"2023-05-11T22:23:55.216Z",
// "description":"kkkkkkkkkkkkkkkkkkkkkkkkkk",
// "status":"available"}