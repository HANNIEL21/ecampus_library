import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final String name;
  final String author;
  final String? img;
  final ontap;

  BookTile(
      {Key? key,
      required this.name,
      required this.author,
      this.img,
      required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: 180,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        repeat: ImageRepeat.noRepeat,
                        image: NetworkImage(
                            "https://imgs.search.brave.com/icxtNPdsXZyPvDcDGH1TVtHPtO1ObV8rj6Fg_wb4mW0/rs:fit:307:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC4x/VXpZcW5XbWNqNjQy/NVlUVnlRc19nSGFM/YiZwaWQ9QXBp"),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 10,
                          offset: Offset(0, 5),
                          spreadRadius: 4,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 5,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Spacing
              const SizedBox(
                height: 10,
              ),

              //  Title And Author
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),

              // Spacing
              const SizedBox(
                height: 5,
              ),

              Text(
                author,
                style: TextStyle(
                    fontWeight: FontWeight.w300, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
