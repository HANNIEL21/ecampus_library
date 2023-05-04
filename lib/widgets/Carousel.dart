import 'package:ecampus_library/export.dart';

class Carousel extends StatefulWidget {

  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
     return CarouselSlider.builder(
        carouselController: controller,
        options: CarouselOptions(
          height: 270,
          enableInfiniteScroll: true,
          autoPlay: true,
          enlargeCenterPage: false,
          aspectRatio: 1.1,
          pageSnapping: true,
          viewportFraction: 0.8,
        ),
        itemCount: 3,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => const CarouselTile(),
      );

  }
}
