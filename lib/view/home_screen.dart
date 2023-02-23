import 'package:flutter/material.dart';
import 'package:moovbe/view/bus_layout_screen_1.dart';
import 'package:moovbe/view/bus_layout_screen_2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(
            0xFF2B2B2A,
          ),
          title: const Center(
            child: Image(
              image: AssetImage('assets\\moovbe_2.png'),
            ),
          ),
          toolbarHeight: 85.0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BusLayoutScreen2(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: size.height * 0.22,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets\\bus 1.png'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.225,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: const Image(
                      fit: BoxFit.cover,
                      image: AssetImage('assets\\driver.png'),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '22 buses found',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: SizedBox(
                    height: size.height * 0.1,
                    child: Card(
                      child: Row(
                        children: [
                          const Image(
                            image: AssetImage('assets\\bus 2.png'),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.width * 0.03,
                              ),
                              const Text(
                                'KSRTC',
                              ),
                              const Text('Swift Scania P-​series'),
                            ],
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BusLayoutScreen1(),
                                ),
                              );
                            },
                            child: Container(
                              height: size.height * 0.045,
                              width: size.width * 0.25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.redAccent.shade400),
                              child: const Center(
                                  child: Text(
                                'Manage',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
