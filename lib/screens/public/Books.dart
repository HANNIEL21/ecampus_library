import 'package:ecampus_library/export.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //TabBar
              Padding(
                padding:  const EdgeInsets.all(28.0),
                child: Container(
                  padding: EdgeInsets.all(2),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.indigo,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.indigo[700],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    tabs: const [
                      Tab(
                        text: "Books",
                      ),
                      Tab(
                        text: "Audiobooks",
                      ),
                    ],
                  ),
                ),
              ),

              const Expanded(
                child: TabBarView(children: [
                  //  Books
                  BookScreen(),

                  //  AudioBooks
                  AudioBookScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
