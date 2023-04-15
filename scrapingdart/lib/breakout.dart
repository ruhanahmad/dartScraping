import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:url_launcher/url_launcher.dart';

class Product {
  final String title;
  final String link;
  final String sale;
 

  Product({required this.title, required this.link,required this.sale});
}


class CardProductWrapperList extends StatefulWidget {

  String? name;
  CardProductWrapperList({this.name});

  @override
  _CardProductWrapperListState createState() => _CardProductWrapperListState();
}

class _CardProductWrapperListState extends State<CardProductWrapperList> {
  Future<List<Product>> getProductsqq() async {
  final response = await http.get(Uri.parse('https://bonanzasatrangi.com/collections/new-arrivals'));
  final document = parser.parse(response.body);

  final productElements = document.querySelectorAll('.grid-view_image .thisproduct.product-labels.rounded .lbl.on-sale ');
  final products = productElements.map((labelElement) {
      final sale = labelElement.text;
                      print(sale);
    final productElement = labelElement.parent!.parent!;
    final titleElement = productElement?.querySelector('.grid-view_image .grid-view-item__link');
    final title = titleElement!.text;
    final link = titleElement.attributes['href'];
    return 
    // sale;
    Product(title:title, link: link!, sale: sale);
  }).toList();

  return products;
}
  Future<List<Product>> _getData() async {
    final response = await http.get(Uri.parse('https://breakout.com.pk/collections/men-sale'));

    final document = parser.parse(response.body);

    final wrapperElements = document.querySelectorAll('.card-product__wrapper');

    final List<Map<String, String>> data = [];
      final products = wrapperElements.map((labelElement) {
     
    final titleElement = labelElement.querySelector('.card__badge.badge-left.halo-productBadges.halo-productBadges--left.date-.date1-')!.children[0];
    final mediaElement = labelElement.querySelector('.card-media.card-media--adapt.media--hover-effect.media--loading-effect');
    final title = titleElement.text;
    final link = mediaElement!.attributes['href'];
    return 
    // sale;
    Product(title:title, link: link!,sale: title);
  }).toList();



    return products;
  }


Future<List<Product>> getProducts() async {
  final response = await http.get(Uri.parse('https://saya.pk/collections/jacquard-2023'));
  final document = parser.parse(response.body);

  final productElements = document.querySelectorAll('.inner-top .product-top .product-label .label.sale-label');
  final products = productElements.map((labelElement) {
      final sale = labelElement.text;
                      print(sale);
    final productElement = labelElement.parent!.parent!.parent;
    final titleElement = productElement?.querySelector('.product-details .product-title');
    final title = titleElement!.text;
    final link = titleElement.attributes['href'];
    return Product(title: title, link: link!, sale: sale);
  }).toList();

  return products;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
    
       FutureBuilder<List<Product>>(
        future: widget.name == "Breakout" ?_getData():widget.name == "Bonanza" ?getProductsqq():widget.name == "Saya" ?getProducts():_getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];

                return ListTile(
                  title: Text(item.title),
                  subtitle:widget.name == "Breakout"
                  ? Text("https://breakout.com.pk/collections/men-sale" +item.link):
                  widget.name == "Bonanza"?
                  Text("https://bonanzasatrangi.com/collections/new-arrivals" +item.link):
                  widget.name == "Saya"?
                  Text("https://saya.pk/" +item.link):
                  Text("https://breakout.com.pk/collections/men-sale" +item.link),
                  leading: Text(item.sale),
                  trailing: ElevatedButton(
      onPressed: () {
        launchUrl(widget.name == "Breakout"?
         Uri.parse("https://breakout.com.pk/collections/men-sale" +item.link):widget.name == "Bonanza"?
         Uri.parse("https://bonanzasatrangi.com/collections/new-arrivals" +item.link):widget.name == "Saya"?
         Uri.parse("https://saya.pk/" +item.link):
          Uri.parse("https://breakout.com.pk/collections/men-sale" +item.link)
         );
      },
      child: Text('Open URL'),
    ),

                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/parser.dart' as parser;
// import 'package:html/dom.dart' as dom;

// class CardBadgeList extends StatefulWidget {
//   @override
//   _CardBadgeListState createState() => _CardBadgeListState();
// }

// class _CardBadgeListState extends State<CardBadgeList> {
//   List<String> badges = [];

//   Future<List<String>> _getData() async {
//     // Make a GET request to the website
//     final response = await http.get(Uri.parse('https://breakout.com.pk/collections/men-sale'));

//     // Use the html parser to parse the response body
//     final document = parser.parse(response.body);

//     // Find all elements with class name "card__badge badge-left halo-productBadges halo-productBadges--left date- date1-"
//     final badgesElements = document.querySelectorAll('.card__badge.badge-left.halo-productBadges.halo-productBadges--left.date-.date1-');

//     // Loop through the elements and find the sub class "badge sale-badge"
//     for (final badgeElement in badgesElements) {
//       final subClass = badgeElement.querySelector('.badge.sale-badge');

//       // If the sub class exists, add its text to the badges list
//       if (subClass != null) {
//         badges.add(subClass.text);
//       }
//     }

//     return badges;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<String>>(
//         future: _getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(snapshot.data![index]),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
