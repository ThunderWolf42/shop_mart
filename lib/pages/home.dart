import 'package:flutter/material.dart';
import 'package:shop_mart/pages/detail_page.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List imgList = [
    {"image_path": 'images/image_carousel1.jpg'},
    {"image_path": 'images/image_carousel2.jpg'},
    {"image_path": 'images/image_carousel3.jpg'},
    {"image_path": 'images/image_carousel4.jpg'},
    {"image_path": 'images/image_carousel5.jpg'},
  ];

   final CarouselSliderController _controller = CarouselSliderController();

  int currentIndex = 0;
  bool kosmetik = false,
      bahanMakanan = false,
      electronicGadget = false,
      medicine = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 82, 72),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Hello Darrel",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          fontFamily: 'Poppins')),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text("Belanja Murah",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                      fontFamily: 'Poppins')),
              const Text("Ayo Pilih dan Belanja",
                  style: TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                      fontFamily: 'Poppins')),
              const SizedBox(
                height: 20.0,
              ),
              showItem(),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: CarouselSlider(
                  items: imgList
                      .map((item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.cover,
                            width: 900.0,
                            height: 400.0,
                          ))
                      .toList(),
                  carouselController: _controller,
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2,
                    autoPlayInterval: const Duration(seconds: 3),
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DetailPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(14),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "images/GarnierKosmetik.jpeg",
                                  height: 150,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Text(
                                  // Nama barang
                                  "Garnier Skin Active",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.0,
                                      fontFamily: 'Poppins'),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Text(
                                  // kategori
                                  "Cosmetic",
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                      fontFamily: 'Poppins'),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Text(
                                  // Hargaa
                                  "Rp25000",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                      fontFamily: 'Poppins'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                "images/KOL.jpg",
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                // Nama barang
                                "Sayur Kol",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    fontFamily: 'Poppins'),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                // kategori
                                "Sayuran",
                                style: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                    fontFamily: 'Poppins'),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Text(
                                // Hargaa
                                "Rp16000",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "images/samsung23.jpg",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            // Changed from Container to SizedBox
                            width: MediaQuery.of(context).size.width / 2,
                            child: const Text(
                              "Samsung S23 Ultra Ram 12/256",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            // Changed from Container to SizedBox
                            width: MediaQuery.of(context).size.width / 2,
                            child: const Text(
                              "Gadget Electronics",
                              style: TextStyle(
                                  color: Colors.black38,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          SizedBox(
                            // Changed from Container to SizedBox
                            width: MediaQuery.of(context).size.width / 2,
                            child: const Text(
                              "Rp 5800000",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.0,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 20.0,
        ),
        GestureDetector(
          onTap: () {
            kosmetik = true;
            bahanMakanan = false;
            electronicGadget = false;
            medicine = false;
            setState(() {});
          },
          child: Material(
            // kosmetik
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: kosmetik
                        ? Color.fromARGB(255, 168, 154, 230)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "images/cosmeticVector.png",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            kosmetik = false;
            bahanMakanan = true;
            electronicGadget = false;
            medicine = false;
            setState(() {});
          },
          child: Material(
            // kosmetik
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: bahanMakanan
                        ? const Color.fromRGBO(90, 155, 225, 1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "images/bahanMakanan.png",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            kosmetik = false;
            bahanMakanan = false;
            electronicGadget = true;
            medicine = false;
            setState(() {});
          },
          child: Material(
            // kosmetik
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: electronicGadget
                        ? const Color.fromRGBO(90, 155, 225, 1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "images/electronicGadget.png",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        GestureDetector(
          onTap: () {
            kosmetik = false;
            bahanMakanan = false;
            electronicGadget = false;
            medicine = true;
            setState(() {});
          },
          child: Material(
            // kosmetik
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
                decoration: BoxDecoration(
                    color: medicine
                        ? const Color.fromRGBO(90, 155, 225, 1)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "images/medicine.png",
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                )),
          ),
        )
      ],
    );
  }
}
