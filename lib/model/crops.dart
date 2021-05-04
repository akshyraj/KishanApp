class Crops {
  // ignore: non_constant_identifier_names
  final String Crops_name;
  final String imageUrl;
  final String timetogrow;
  final String soil;
  final String season;
  final String fertilizer;
  final String irrigation;
  Crops(
      // ignore: non_constant_identifier_names
      {this.Crops_name, this.imageUrl, this.timetogrow,this.soil, this.season,this.fertilizer, this.irrigation});
}

class CropsList {
  static List<Crops> getCrops() {
    return [ 
      Crops(
          Crops_name: 'Wheat',
          imageUrl : 'https://media.istockphoto.com/photos/bunch-of-wheat-ears-isolated-on-white-picture-id1135521436',
          timetogrow : '10 months',
          season: 'Summer and Winter',
          soil: 'clay loam or loam texture',
          irrigation:'40 cm depth of water',
          fertilizer: 'Muriate of potash and potassium '
        ),
        Crops(
          Crops_name: 'Soya',
          imageUrl : 'https://image.shutterstock.com/image-photo/soybean-pods-isolated-on-white-600w-425605201.jpg',
          timetogrow : '10 months',
          season: 'Summer and Winter',
          soil: 'clay loam or loam texture',
          irrigation:'40 cm depth of water',
          fertilizer: 'Muriate of potash and potassium '
        ),
         
    ];
  }
}