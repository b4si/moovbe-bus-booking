import 'package:flutter/material.dart';

import 'package:moovbe/view/drivers_list_screen.dart';

class BusLayoutScreen1 extends StatelessWidget {
  final String busName;
  final double noOfSeat;
  final String seatLayout;
  final String driverName;
  const BusLayoutScreen1(
      {super.key,
      required this.busName,
      required this.noOfSeat,
      required this.seatLayout,
      required this.driverName});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(
          0xFF2B2B2A,
        ),
        title: Text(
          busName,
          style: const TextStyle(color: Colors.white),
        ),
        toolbarHeight: 85.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DriversListScreen(),
                    ),
                  );
                },
                child: Container(
                  width: size.width,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(
                      0xFF2B2B2A,
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            driverName,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'License no: PJ515196161655',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                        child: const Image(
                          image: AssetImage(
                            'assets\\driver 2.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Icon(
                              Icons.chair,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (seatLayout == "2x2")
                      TwoXTwoLayout(
                        noOfSeat: noOfSeat,
                        size: size,
                      )
                    else if (seatLayout == "1x3")
                      OneXThreeLayout(
                        noOfSeat: noOfSeat,
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoXTwoLayout extends StatelessWidget {
  const TwoXTwoLayout({
    super.key,
    required this.noOfSeat,
    required this.size,
  });

  final double noOfSeat;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: noOfSeat ~/ 4,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chair,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chair,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              width: size.width * 0.18,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chair,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chair,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
          ],
        );
      },
    );
  }
}

class OneXThreeLayout extends StatelessWidget {
  final double noOfSeat;
  const OneXThreeLayout({
    super.key,
    required this.noOfSeat,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: noOfSeat ~/ 4,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chair,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              width: size.width * 0.15,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chair,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chair,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.chair,
                size: 30,
                color: Colors.redAccent,
              ),
            ),
          ],
        );
      },
    );
  }
}
