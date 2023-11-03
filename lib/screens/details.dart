import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class detailss extends StatefulWidget {
  const detailss({super.key});

  @override
  State<detailss> createState() => _detailssState();
}

GlobalKey repaintboudry = GlobalKey();

void CopytoClipBord({required String data}) {
  Clipboard.setData(ClipboardData(text: data));
}

void ShareImage() async {
  RenderRepaintBoundary res = await repaintboudry.currentContext!
      .findRenderObject() as RenderRepaintBoundary;

  var image = await res.toImage(pixelRatio: 5);
  print("${image}");

  ByteData? byte = await image.toByteData(format: ImageByteFormat.png);
  print("${byte}");

  Uint8List ulist = await byte!.buffer.asUint8List();
  print("${ulist}");

  Directory directory = await getApplicationSupportDirectory();
  print("${directory}");

  File file = File("${directory.path}.png");
  await file.writeAsBytes(ulist);
  print("${file}");

  ShareExtend.share(file.path, "Image");
  print("${image}");
}

void saveImg() async {
  RenderRepaintBoundary res = await repaintboudry.currentContext!
      .findRenderObject() as RenderRepaintBoundary;

  var image = await res.toImage(pixelRatio: 5);

  ByteData? byte = await image.toByteData(format: ImageByteFormat.png);

  Uint8List ulist = await byte!.buffer.asUint8List();

  await ImageGallerySaver.saveImage(ulist);
}

class _detailssState extends State<detailss> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          IconButton(
            onPressed: () {
              ShareImage();
            },
            icon: const Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              saveImg();
            },
            icon: const Icon(
              Icons.save,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: RepaintBoundary(
        key: repaintboudry,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("${data['img']}"),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "${data['quote']}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${data['author']}",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
