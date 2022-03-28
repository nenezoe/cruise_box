import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ["Top Events", "Event", "Party", "Sports"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Material(
                elevation: 5.0,
                // color: Colors.red,
                borderRadius: BorderRadius.circular(20.0),
                child: MaterialButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => PaymentScreen()));
                  },

                  // minWidth: 200.0,
                  height: 40.0,
                  child: Text(
                    categories[index],
                    style: TextStyle(
                      color:
                          index == selectedIndex ? Colors.red : Colors.blueGrey,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(
                //     horizontal: 20.0,
                //     vertical: 30.0,
                //   ),
                //   child: Text(
                //     categories[index],
                //     style: TextStyle(
                //       color:
                //           index == selectedIndex ? Colors.red : Colors.blueGrey,
                //       fontSize: 24.0,
                //       fontWeight: FontWeight.bold,
                //       letterSpacing: 1.5,
                //     ),
                //   ),
              ),
            );
          }),
    );
  }
}
