class Crops {
  // ignore: non_constant_identifier_names
  final String Crops_name;
  final String imageUrl;
  final String whocanapply;
  final String howtoapply;
  final String content;
  final String linkname;
  final String link;
  Crops(
      // ignore: non_constant_identifier_names
      {this.Crops_name, this.imageUrl, this.whocanapply,this.howtoapply, this.content,this.linkname, this.link});
}

class CropsList {
  static List<Crops> getCrops() {
    return [ 
      Crops(
          Crops_name: 'Wheat',
          imageUrl : 'https://media.istockphoto.com/photos/bunch-of-wheat-ears-isolated-on-white-picture-id1135521436',
          whocanapply : 'All farmers including sharecroppers and tenant farmers growing the notified crops in the notified areas are eligible for coverage. However, farmers should have insurable interest for the notified/ insured crops.',
          content: 'The Pradhan Mantri Fasal Bima Yojana (PMFBY) launched on 18 February 2016 by Prime Minister Narendra Modi is an insurance service for farmers for their yields.\n\n' 'Pradhan Mantri Fasal Bima Yojana (PMFBY) aims at supporting sustainable production in agriculture \n\n' 'Coverage of Crops\n\n' '1. Oil seeds\n\n' '2. Food crop\n\n' '3. Annual Commercial and Annual Horticultural crops.\n\n'
          'Coverage of Risks and Exclusions\n\n' 'Prevented Sowing/Planting/Germination Risk: Insured area is prevented from sowing/planting/germination due to deficit rainfall or adverse seasonal/weather conditions.\n\n' 'Standing Crop (Sowing to Harvesting): Comprehensive risk insurance is provided to cover yield losses due to non-preventable risks, viz. Drought, Dry spell, Flood, Inundation, widespread Pests and Disease attack, Landslides, Fire due to natural causes, Lightening, Storm, Hailstorm and Cyclone.\n\n' 'Post-Harvest Losses: Coverage is available only up to a maximum period of two weeks from harvesting, for those crops which are required to be dried in cut and spread / small bundled condition in the field after harvesting against specific perils of Hailstorm, Cyclone, Cyclonic rains and Unseasonal rains\n\n' 'Localized Calamities: Loss/damage to notified insured crops resulting from occurrence of identified localized risks of Hailstorm, Landslide, Inundation, Cloud burst and Natural fire due to lightening affecting isolated farms in the notified area.\n\n'
          'Add-on coverage for crop loss due to attack by wild animals: The States may consider providing add-on coverage for crop loss due to attack by wild animals wherever the risk is perceived to be substantial and is identifiable.',
          howtoapply: 'Loanee farmers (Compulsory coverage) Whenever banks sanction loan for a notified crop in a notified area, the crop loan amount only to the extent of Scale of Finance for notified crops and acreage of individual notified crops of loanee farmers shall be taken into consideration for compulsory coverage. Loan disbursing bank branch/ PACS will finance the additional loan towards premium amount payable by farmer for crop insurance. \n\n'
          'Non-loanee farmers (Optional coverage) Farmers desirous of availing insurance shall fill up Proposal Form of the Scheme and submit the same to nearest bank branch or CSC centre (Click here for CSC Locator) or authorized channel partner of Shriram general insurance intermediaries. (SGI Branch Locator) Non-Loanee farmer may submit insurance proposals personally / through ‘on-line portal’ of concerned insurance company or crop insurance portal designed by Government for the purpose. Click here Insurance companies retain the right to accept or reject insurance proposal(s) in case proposal is incomplete, not accompanied by necessary documentary proof or insurance premium ordinarily.',
          link:'https://pmfby.gov.in/',
          linkname: 'PMFBY'
        ),
        Crops(
          Crops_name: 'Soya',
          imageUrl : 'https://image.shutterstock.com/image-photo/soybean-pods-isolated-on-white-600w-425605201.jpg',
          whocanapply : 'All landholding farmers’ families having cultivable landholding in their names can apply under this scheme. Farmers are not bound to have the 2 hectares of cultivated land. The ambit of this scheme has been extended now.\n\n'
          'Earlier, Small and Marginal Farmers families were also eligible for this benefit but after the changes in eligibility guidelines, these farmers are not eligible and hence will not get the benefit. \n\n'
          'Farmers from both the urban and rural areas are eligible.\n\n'
          'Beneficiaries having higher economic status are not eligible for this scheme.',
          content: "Pradhan Mantri Kisan Samman Nidhi (PMKSN, translation: Prime Minister's Farmer's Tribute Fund) is an initiative by the government of India in which all farmers will get up to ₹6,000  per year as minimum income support.\n\n" 
          "₹6,000 per year will be paid to each eligible farmer in three instalments and will be deposited directly to their bank accounts.",
          howtoapply:'Eligible farmers can register for PM Kisan Nidhi 2020 Scheme only in online mode. For tha they can register by their own from the PM Kisan portal. They can also register by visiting the nearest Common Service Centres (CSCs) by the payment of the requisite fee.',
          link:'https://pmkisan.gov.in/',
          linkname: 'PMKISAN Yojana'
        ),
         Crops(
          Crops_name: 'Soya',
          imageUrl : 'https://image.shutterstock.com/image-photo/soybean-pods-isolated-on-white-600w-425605201.jpg',
          whocanapply : 'All landholding farmers’ families having cultivable landholding in their names can apply under this scheme. Farmers are not bound to have the 2 hectares of cultivated land. The ambit of this scheme has been extended now.\n\n'
          'Earlier, Small and Marginal Farmers families were also eligible for this benefit but after the changes in eligibility guidelines, these farmers are not eligible and hence will not get the benefit. \n\n'
          'Farmers from both the urban and rural areas are eligible.\n\n'
          'Beneficiaries having higher economic status are not eligible for this scheme.',
          content: "Pradhan Mantri Kisan Samman Nidhi (PMKSN, translation: Prime Minister's Farmer's Tribute Fund) is an initiative by the government of India in which all farmers will get up to ₹6,000  per year as minimum income support.\n\n" 
          "₹6,000 per year will be paid to each eligible farmer in three instalments and will be deposited directly to their bank accounts.",
          howtoapply:'Eligible farmers can register for PM Kisan Nidhi 2020 Scheme only in online mode. For tha they can register by their own from the PM Kisan portal. They can also register by visiting the nearest Common Service Centres (CSCs) by the payment of the requisite fee.',
          link:'https://pmkisan.gov.in/',
          linkname: 'PMKISAN Yojana'
        ),
         Crops(
          Crops_name: 'Soya',
          imageUrl : 'https://image.shutterstock.com/image-photo/soybean-pods-isolated-on-white-600w-425605201.jpg',
          whocanapply : 'All landholding farmers’ families having cultivable landholding in their names can apply under this scheme. Farmers are not bound to have the 2 hectares of cultivated land. The ambit of this scheme has been extended now.\n\n'
          'Earlier, Small and Marginal Farmers families were also eligible for this benefit but after the changes in eligibility guidelines, these farmers are not eligible and hence will not get the benefit. \n\n'
          'Farmers from both the urban and rural areas are eligible.\n\n'
          'Beneficiaries having higher economic status are not eligible for this scheme.',
          content: "Pradhan Mantri Kisan Samman Nidhi (PMKSN, translation: Prime Minister's Farmer's Tribute Fund) is an initiative by the government of India in which all farmers will get up to ₹6,000  per year as minimum income support.\n\n" 
          "₹6,000 per year will be paid to each eligible farmer in three instalments and will be deposited directly to their bank accounts.",
          howtoapply:'Eligible farmers can register for PM Kisan Nidhi 2020 Scheme only in online mode. For tha they can register by their own from the PM Kisan portal. They can also register by visiting the nearest Common Service Centres (CSCs) by the payment of the requisite fee.',
          link:'https://pmkisan.gov.in/',
          linkname: 'PMKISAN Yojana'
        ),
         Crops(
          Crops_name: 'Soya',
          imageUrl : 'https://image.shutterstock.com/image-photo/soybean-pods-isolated-on-white-600w-425605201.jpg',
          whocanapply : 'All landholding farmers’ families having cultivable landholding in their names can apply under this scheme. Farmers are not bound to have the 2 hectares of cultivated land. The ambit of this scheme has been extended now.\n\n'
          'Earlier, Small and Marginal Farmers families were also eligible for this benefit but after the changes in eligibility guidelines, these farmers are not eligible and hence will not get the benefit. \n\n'
          'Farmers from both the urban and rural areas are eligible.\n\n'
          'Beneficiaries having higher economic status are not eligible for this scheme.',
          content: "Pradhan Mantri Kisan Samman Nidhi (PMKSN, translation: Prime Minister's Farmer's Tribute Fund) is an initiative by the government of India in which all farmers will get up to ₹6,000  per year as minimum income support.\n\n" 
          "₹6,000 per year will be paid to each eligible farmer in three instalments and will be deposited directly to their bank accounts.",
          howtoapply:'Eligible farmers can register for PM Kisan Nidhi 2020 Scheme only in online mode. For tha they can register by their own from the PM Kisan portal. They can also register by visiting the nearest Common Service Centres (CSCs) by the payment of the requisite fee.',
          link:'https://pmkisan.gov.in/',
          linkname: 'PMKISAN Yojana'
        ),
         Crops(
          Crops_name: 'Soya',
          imageUrl : 'https://image.shutterstock.com/image-photo/soybean-pods-isolated-on-white-600w-425605201.jpg',
          whocanapply : 'All landholding farmers’ families having cultivable landholding in their names can apply under this scheme. Farmers are not bound to have the 2 hectares of cultivated land. The ambit of this scheme has been extended now.\n\n'
          'Earlier, Small and Marginal Farmers families were also eligible for this benefit but after the changes in eligibility guidelines, these farmers are not eligible and hence will not get the benefit. \n\n'
          'Farmers from both the urban and rural areas are eligible.\n\n'
          'Beneficiaries having higher economic status are not eligible for this scheme.',
          content: "Pradhan Mantri Kisan Samman Nidhi (PMKSN, translation: Prime Minister's Farmer's Tribute Fund) is an initiative by the government of India in which all farmers will get up to ₹6,000  per year as minimum income support.\n\n" 
          "₹6,000 per year will be paid to each eligible farmer in three instalments and will be deposited directly to their bank accounts.",
          howtoapply:'Eligible farmers can register for PM Kisan Nidhi 2020 Scheme only in online mode. For tha they can register by their own from the PM Kisan portal. They can also register by visiting the nearest Common Service Centres (CSCs) by the payment of the requisite fee.',
          link:'https://pmkisan.gov.in/',
          linkname: 'PMKISAN Yojana'
        ),
         Crops(
          Crops_name: 'Soya',
          imageUrl : 'https://image.shutterstock.com/image-photo/soybean-pods-isolated-on-white-600w-425605201.jpg',
          whocanapply : 'All landholding farmers’ families having cultivable landholding in their names can apply under this scheme. Farmers are not bound to have the 2 hectares of cultivated land. The ambit of this scheme has been extended now.\n\n'
          'Earlier, Small and Marginal Farmers families were also eligible for this benefit but after the changes in eligibility guidelines, these farmers are not eligible and hence will not get the benefit. \n\n'
          'Farmers from both the urban and rural areas are eligible.\n\n'
          'Beneficiaries having higher economic status are not eligible for this scheme.',
          content: "Pradhan Mantri Kisan Samman Nidhi (PMKSN, translation: Prime Minister's Farmer's Tribute Fund) is an initiative by the government of India in which all farmers will get up to ₹6,000  per year as minimum income support.\n\n" 
          "₹6,000 per year will be paid to each eligible farmer in three instalments and will be deposited directly to their bank accounts.",
          howtoapply:'Eligible farmers can register for PM Kisan Nidhi 2020 Scheme only in online mode. For tha they can register by their own from the PM Kisan portal. They can also register by visiting the nearest Common Service Centres (CSCs) by the payment of the requisite fee.',
          link:'https://pmkisan.gov.in/',
          linkname: 'PMKISAN Yojana'
        ),
    ];
  }
}