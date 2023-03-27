import 'package:flutter/material.dart';
import 'uploadpage.dart';
import '../datas/kitap.dart';
import "../managers/profilemanager.dart";
import "profilepage.dart";
import "haberler.dart";
import "searchPage.dart";


    /*
  
class _MyAppState extends State<MyApp> {
  String buttonName = "Upload";
  int currentIndex = 0;
  List<Book> books = []; // Add this line

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(books: books),
    );
  }
}
  */
  
  
class FirstPage extends StatefulWidget {
  
   List<Kitap> books = [];
   FirstPage({required this.books, Key? key}) : super(key: key);
  

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String buttonName = "Add a book";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                              return UploadPage(
                                onSubmit: (name, isbn, condition,) {
                                  // Add the uploaded book to the list
                                  setState(() {
                                    widget.books.add(Kitap(
                                        id:DateTime.now().millisecondsSinceEpoch+Profilemanager.profile.hashCode,//sıkıntılı
                                        uid: Profilemanager.profile?.uid??"", //sıkıntılı
                                        userLocation: Profilemanager.profile?.uid??"",//sıkıntılı
                                        name: name,
                                        isbn: int.parse(isbn),
                                        condition: condition));
                                  });
                                },
                                books: widget
                                    .books, // pass books to the UploadPage widget
                              );
                            }),
                          );
                        },
                        child: Text(buttonName),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.books.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(widget.books[index].name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ISBN: ${widget.books[index].isbn}'),
                            const SizedBox(height: 4),
                            Text('Condition: ${widget.books[index].condition}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          
  }
}
