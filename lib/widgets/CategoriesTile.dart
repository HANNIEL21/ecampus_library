import 'package:flutter/material.dart';

class CategoriesTile extends StatelessWidget {
  const CategoriesTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 70,
            decoration: BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 2,
                    color: Colors.grey,
                  )
                ]),
            child: const Center(
              
            ),
          ),

          const SizedBox(
            height: 10,
          ), 

          const Text(
                "Biographies",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
        ],
      ),
    );
  }
}
