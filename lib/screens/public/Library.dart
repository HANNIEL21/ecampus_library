import 'package:ecampus_library/export.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Spacing
            const SizedBox(
              height: 12,
            ),
            //  Carousel
            const Carousel(),
            //  Categories
            Column(
              children: [
                const CategoryTitle(title: "Categories"),
                const SizedBox(
                  height: 10,
                ),

                // TODO: Categories
                SizedBox(
                  height: 110,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const CategoriesTile();
                      }),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

            // TODO: Popular authors
            Column(
              children: [
                const CategoryTitle(
                  title: "Popular Authors",
                ),
                const SizedBox(
                  height: 10,
                ),

                // TODO: Popular Authors
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const AuthorTile();
                      }),
                ),
              ],
            ),

            // TODO: Features AudioBooks
            Column(
              children: [
                const CategoryTitle(
                  title: "Features Audiobooks",
                ),
                const SizedBox(
                  height: 10,
                ),

                // TODO: Features AudioBooks
                SizedBox(
                  height: 320,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AudioBookTile(
                          ontap: (){},
                          name: "Abstract art",
                          author: "Armando|",
                        );
                      }),
                ),
              ],
            ),

            // TODO: Features Books
            Column(
              children: [
                const CategoryTitle(
                  title: "Features Books",
                ),
                const SizedBox(
                  height: 10,
                ),

                // TODO: Features Books
                SizedBox(
                  height: 320,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return BookTile(
                          ontap: () {},
                          name: "Abstract art",
                          author: "Armando",
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
