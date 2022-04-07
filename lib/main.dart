import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

import 'package:image/image.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: SafeArea(child: myApp()),
      ),
    )
  );
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

String s = 'a';
class _myAppState extends State<myApp> {
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(s),
    ElevatedButton(onPressed:  (){
      setState(() {

            // final byteData = rootBundle.load('assets/2.png');
            // Directory tempDir = await getTemporaryDirectory();
            // final file = File(getTemporaryDirectory().path+'/assets');
            // s =  file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
            // File f = await getImageFileFromAssets('images/2.png');

            final image = decodeImage(File('assets/2.png').readAsBytesSync())!;
            // for(int i=0;i<image.length;i++){
            //   print(image[i]);
            // }
        print(image);
      });
    }, child: Text('Hey')),
      ],
    );
  }
}






//

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     String s = 'Do it now';
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xFF1111FF),
//           title: Center(
//               child: Text(
//             'App',
//             style: TextStyle(fontSize: 20.0),
//           )),
//         ),
//         backgroundColor: Color(0xFFAAAAAAA),
//         body: Column(children: [
//           // Image.asset('assets/2.png'),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 s += 'Done already';
//               });
//               print('Gehsdad');
//             },
//             child: Text(s),
//           ),
//           Text(s)
//           // TextButton(onPressed: (){
//           //   // final byteData = rootBundle.load('assets/2.png');
//           //   // final file = File('${(await getTemporaryDirectory()).path}/$path');
//           //   // await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//           //   // print(byteData);
//           // }, child: Text('Do it'))
//         ]),
//       ),
//     );
//   }
// }
