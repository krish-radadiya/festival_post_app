import 'package:flutter/material.dart';

import '../utils/quots/quotas.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          'Festival',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://static.vecteezy.com/system/resources/thumbnails/004/633/090/small/beauty-background-for-muslim-community-festival-illustrat-free-vector.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: Global.allQoutes.map((e) {
              return Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                height: 330,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${e['category']}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...e['Quotes'].map((e) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed('details', arguments: e);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.all(20),
                                  height: 250,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage("${e['img']}"),
                                      fit: BoxFit.cover,
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          softWrap: false,
                                          maxLines: 4,
                                          "${e['quote']}",
                                          style: const TextStyle(
                                            fontSize: 22,
                                          overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Center(
                                          child: Text(
                                        "${e['author']}",
                                        style: const TextStyle(
                                          fontSize: 22,
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
