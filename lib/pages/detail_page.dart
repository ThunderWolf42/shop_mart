import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            Image.asset(
              "images/KOL.jpg",
              width: MediaQuery.of(context).size.height / 2.5,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mediterranean",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      "Chicken Salad",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                          fontFamily: 'Poppins'),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      ++a;
                    }
                    ++a;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(a.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 18)),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0,),
            const Text(
              "Lorem ipsum odor amet, consectetuer adipiscing elit. Donec justo a aptent vestibulum, lobortis conubia a a. Nullam elit commodo diam dolor augue donec consequat proin. Venenatis diam congue pharetra scelerisque potenti nostra hendrerit nam.",
              maxLines: 3,
              style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 20.0,),
            const Row(
              children: [
               Text("Delivery Time",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: 'Poppins'), ),
                SizedBox(width: 25.0,),
                Icon(Icons.alarm, color: Colors.black,),
                SizedBox(width: 5.0,),
                Text("30 min",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: 'Poppins'), ),
              ],
            ),
            const Spacer(),
             Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Text("Total Price", style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'Poppins'),
                    ),
                    Container(
                      child: const Row(
                        
                        children: [
                          Text("Rp 50000", style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    )
                    ],
                  ),
                  Container(
              width: MediaQuery.of(context).size.width/2,
              padding: const EdgeInsets.all(5),
              decoration:  BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                const Text("Add to card", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                const SizedBox(width: 30.0,),
                Container(
                  padding: const EdgeInsets.all(3),
                  child: const Icon(Icons.shop, color: Colors.white,)),
                const SizedBox(width: 10.0,),
              ],),
            )
                  
                ],
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
