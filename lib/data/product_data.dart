import '../constants/category_enum.dart';

class ProductData {
  static List<Map<String, dynamic>> productList = [
    {
      'name': 'Nike Sportswear T-shirt',
      'id': '1',
      'price': 299,
      'category': Category.shirt.name,
      'imageUrl':
          'https://seekthailand.com/uploads/products/d8117f0b0e0fa08c97a2e99c5598c24b.jpg'
    },
    {
      'name': 'Adidas Superstar shoes',
      'id': '2',
      'price': 399,
      'category': Category.shoes.name,
      'imageUrl':
          'https://assets.adidas.com/images/w_600,f_auto,q_auto/bd43ce71f589498ab6b1aad6009a0e6e_9366/Superstar_Shoes_White_EG4958_07_standard.jpg'
    },
    {
      'name': 'NB Athletics Pant',
      'id': '3',
      'price': 499,
      'category': Category.pants.name,
      'imageUrl':
          'https://d1a2ggqmhsoom.cloudfront.net/nmT0UmhQScxykI3vw0AQLnMJeoA=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/newbalance-thailand-7234-631001-1.jpg'
    },
    {
      'name': 'PUMA ESS Logo Tee',
      'id': '4',
      'price': 599,
      'category': Category.shirt.name,
      'imageUrl':
          'https://ae01.alicdn.com/kf/HTB1SrP2UhTpK1RjSZFMq6zG_VXar/2019-PUMA-ESS-Logo-Tee.jpg_Q90.jpg_.webp'
    },
    {
      'name': 'Gucci Ace low-top sneakers',
      'id': '5',
      'price': 699,
      'category': Category.shoes.name,
      'imageUrl':
          'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1580402705/429446_02JP0_9064_001_100_0000_Light-Mens-Ace-embroidered-sneaker.jpg'
    },
  ];
}
