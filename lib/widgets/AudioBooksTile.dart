import 'package:flutter/material.dart';

class AudioBookTile extends StatelessWidget {
  final String name;
  final String author;
  final ontap;

  const AudioBookTile(
      {Key? key, required this.author, required this.name, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 230,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.indigo[900],
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
                          icon: const Icon(Icons.headphones),
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
