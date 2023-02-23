import 'package:flutter/material.dart';

class AddDriverScreen extends StatelessWidget {
  const AddDriverScreen({super.key});

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
          'Add Driver',
          style: TextStyle(color: Colors.white),
        ),
        toolbarHeight: 85.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextFormField(
              // controller: userNameController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the username';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter name',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                fillColor: Colors.grey.shade300,
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextFormField(
              // controller: passwordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter the password';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Enter License number',
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),
                fillColor: Colors.grey.shade300,
                filled: true,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {},
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
                'Save',
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
