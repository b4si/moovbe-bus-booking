import 'package:flutter/material.dart';
import 'package:moovbe/view/add_driver_screen.dart';

class DriversListScreen extends StatelessWidget {
  const DriversListScreen({super.key});

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
        centerTitle: true,
        title: const Text(
          'Driver List',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 85.0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Text('21 drivers found'),
              ),
            ],
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
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: const Image(
                            image: AssetImage('assets\\driver 2.png'),
                          ),
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
                              'Rohit Sharma',
                            ),
                            SizedBox(
                              width: size.width * 0.35,
                              child: const Text(
                                'License no: PJ515196161655',
                                maxLines: 1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: size.height * 0.045,
                            width: size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.redAccent.shade400),
                            child: const Center(
                                child: Text(
                              'Delete',
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
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddDriverScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: size.width,
            height: size.height * 0.07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.redAccent.shade400),
            child: const Center(
              child: Text(
                'Add Driver',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
