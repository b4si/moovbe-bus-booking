import 'package:flutter/material.dart';
import 'package:moovbe/view/drivers_list_screen.dart';

class BusLayoutScreen1 extends StatelessWidget {
  const BusLayoutScreen1({super.key});

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
        title: const Text(
          'Swift Scania P-​series',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 85.0,
      ),
      body: Column(
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
                      children: const [
                        Text(
                          'Rohit Sharma',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('License no: PJ515196161655',
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.05,
                    ),
                    SizedBox(
                      height: size.height * 0.2,
                      child: const Image(
                        image: AssetImage('assets\\driver 2.png'),
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
