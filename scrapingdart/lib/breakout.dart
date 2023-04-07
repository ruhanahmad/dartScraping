import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

class CardProductWrapperList extends StatefulWidget {
  @override
  _CardProductWrapperListState createState() => _CardProductWrapperListState();
}

class _CardProductWrapperListState extends State<CardProductWrapperList> {
  Future<List<Map<String, String>>> _getData() async {
    final response = await http.get(Uri.parse('https://breakout.com.pk/collections/men-sale'));

    final document = parser.parse(response.body);

    final wrapperElements = document.querySelectorAll('.card-product__wrapper');

    final List<Map<String, String>> data = [];

    for (final wrapperElement in wrapperElements) {
      final badgeElement = wrapperElement.querySelector('.card__badge.badge-left.halo-productBadges.halo-productBadges--left.date-.date1-')!.children[0];
      final mediaElement = wrapperElement.querySelector('.card-media.card-media--adapt.media--hover-effect.media--loading-effect');

      if (badgeElement != null && mediaElement != null) {
        final badgeText = badgeElement.text.trim();
        final mediaLink = mediaElement.attributes['href'];

        data.add({'badge': badgeText, 'link': mediaLink!});
      }
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, String>>>(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];

                return ListTile(
                  title: Text(item['badge']!),
                  subtitle: Text(item['link']!),
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
