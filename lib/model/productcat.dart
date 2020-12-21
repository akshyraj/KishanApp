class Category {
  // ignore: non_constant_identifier_names
  final String cat_name;
  final String imageUrl;
  final String categoty;
  Category(
      // ignore: non_constant_identifier_names
      {this.cat_name, this.imageUrl, this.categoty});
}

class CategoryList {
  static List<Category> getCategory() {
    return [
      Category(
        cat_name: 'Liquid Fertilizer',
        imageUrl: 'assets/AZOTOFIX-Liquid.jpg',
        categoty: 'liquid_fertilizer'
      ),
      Category(
        cat_name: 'Seeds',
        imageUrl: 'assets/seed.png',
        categoty: 'seeds'
      ),
      Category(
        cat_name: 'Pesticide',
        imageUrl: 'assets/pesticides.jpeg',
        categoty: 'pesticide'
      ),
      Category(
        cat_name: 'Fertilizers',
        imageUrl: 'assets/natural-fertilizer.jpg',
        categoty: 'natural_fertilizer'
      )
    ];
  }
} 
      