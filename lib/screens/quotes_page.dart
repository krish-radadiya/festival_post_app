import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class quotes_page extends StatefulWidget {
  const quotes_page({super.key});

  @override
  State<quotes_page> createState() => _details_pageState();
}

class _details_pageState extends State<quotes_page> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Quotes",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...data['Quotes'].map(
              (e) => GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.of(context).pushNamed('detaills', arguments: e);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "${e['img']}",
                      ),
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            maxLines: 4,
                            "${e['quote']}",
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "${e['author']}",
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // body: Container(
      //   padding: const EdgeInsets.all(10),
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: NetworkImage(
      //           "https://static.vecteezy.com/system/resources/thumbnails/004/633/090/small/beauty-background-for-muslim-community-festival-illustrat-free-vector.jpg"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: Global.allQoutes.map((e) {
      //         return Container(
      //           padding: EdgeInsets.all(10),
      //           alignment: Alignment.centerLeft,
      //           height: 330,
      //           child: SingleChildScrollView(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   "${e['category']}",
      //                   style: const TextStyle(
      //                     color: Colors.black,
      //                     fontSize: 25,
      //                     fontWeight: FontWeight.bold,
      //                   ),
      //                 ),
      //                 SingleChildScrollView(
      //                   scrollDirection: Axis.horizontal,
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.start,
      //                     children: [
      //                       ...e['Quotes'].map((e) {
      //                         return GestureDetector(
      //                           onTap: () {
      //                             Navigator.of(context)
      //                                 .pushNamed('details', arguments: e);
      //                           },
      //                           child: Container(
      //                             margin: EdgeInsets.all(10),
      //                             padding: EdgeInsets.all(20),
      //                             height: 250,
      //                             width: 300,
      //                             decoration: BoxDecoration(
      //                               color: Colors.white,
      //                               borderRadius: BorderRadius.circular(20),
      //                               image: DecorationImage(
      //                                 image: NetworkImage("${e['img']}"),
      //                                 fit: BoxFit.cover,
      //                               ),
      //                               border: Border.all(
      //                                 width: 1,
      //                                 color: Colors.grey,
      //                               ),
      //                               boxShadow: const <BoxShadow>[
      //                                 BoxShadow(
      //                                   color: Colors.grey,
      //                                   offset: Offset(0, 2),
      //                                 ),
      //                               ],
      //                             ),
      //                             child: Column(
      //                               mainAxisAlignment: MainAxisAlignment.center,
      //                               children: [
      //                                 Center(
      //                                   child: Text(
      //                                     softWrap: false,
      //                                     maxLines: 4,
      //                                     "${e['quote']}",
      //                                     style: const TextStyle(
      //                                       fontSize: 22,
      //                                       overflow: TextOverflow.ellipsis,
      //                                     ),
      //                                   ),
      //                                 ),
      //                                 const SizedBox(
      //                                   height: 15,
      //                                 ),
      //                                 Center(
      //                                     child: Text(
      //                                   "${e['author']}",
      //                                   style: const TextStyle(
      //                                     fontSize: 22,
      //                                   ),
      //                                 )),
      //                               ],
      //                             ),
      //                           ),
      //                         );
      //                       }).toList(),
      //                     ],
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       }).toList(),
      //     ),
      //   ),
      // ),
    );
  }
}
