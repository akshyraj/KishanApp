class Loan {
  final String title;
  final String imageUrl;
  final String date;
  final String content;
  Loan(
      {this.title, this.imageUrl, this.date, this.content});
}

class LoanList {
  static List<Loan> getLoan() {
    return [
      Loan(
          title: 'Punjab CM Promises Debt Relief For Landless Farmers, State to Help Youth Get 6 Lakh Jobs Over Next 2 Years',
          imageUrl:
              'https://images1.livehindustan.com/uploadimage/library/2019/02/04/16_9/16_9_1/Amethi_Prime_Minister_Kisan_Samman_Yojana_Amethi_District_Administration__1549279227.jpg',
          date: '24 Aug 2020',    
          content: 'Pitching for the revival of the state economy, Punjab Chief Minister Amarinder Singh on Saturday announced relief for landless farmers and said his government will help youth get six lakh jobs over the next two years. \n\n'  'The Punjab CM also called for readiness to combat the border threat from Pakistan and China. With tensions at the borders continuing, India will have to be prepared to deal with any eventuality, said the CM in his Independence Day address here. He said of the six lakh jobs, one lakh will be provided in the government sector.'
        ),
      Loan(
          title: 'Seed and fertiliser companies use digital platforms to connect with farmers',
          imageUrl:
              'https://img.etimg.com/thumb/msid-75975601,width-300,imgsize-217951,,resizemode-4,quality-100/farmers.jpg',
          date: '24 Aug 2020',    
          content: 'Seed and fertiliser companies are using digital platforms such as Whatsapp, Zoom and Microsoft Team to connect with farmers to promote and sell their products in a year agricultural output is set to surge. \n\n' 'Ahead of the planting season which begins from June, these companies usually have an army of field officers fanning out for one-on-one meetings with farmers, hold demonstrations at village level and address queries on the product line. The lockdown has made that impossible for them as well as sales and marketing teams to have face-to-face interactions with farmers, but the virtual meetings have picked up, said companies.'
        ),
       
    ];
  }
}