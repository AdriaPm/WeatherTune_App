import 'package:flutter/material.dart';
import 'package:weather_tune/components/login_page/dropdown_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class UnitSelector extends StatefulWidget {
  String userID = "";
  List<String> units = ["Fahrenheit (Fº)", "Celsius (Cº)", "Kelvin (K)"];
  int chosen = 1;
  int min = 0;
  int max = 2;

  UnitSelector({super.key});
  @override
  State<UnitSelector> createState() => _UnitSelectorState();
}

class _UnitSelectorState extends State<UnitSelector> {
  @override
  void initState() {
    super.initState();
    _getUserID();
    _getUnit();
  }

  Future<void> _getUserID() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      widget.userID = user.uid;
    }
  }

  Future<void> _getUnit() async {
    try {
      DocumentSnapshot user = await FirebaseFirestore.instance
          .collection('UserInfo')
          .doc(widget.userID)
          .get();
      var userData = user.data() as Map<String, dynamic>;
      setState(() {
        try {
          widget.chosen = userData['chosenUnit'];
        } catch (e) {
          print('Error setting chosen number: $e');
        }
      });
    } catch (e) {
      print('Error finding profile picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropDownButton(
      widgetWidth: MediaQuery.sizeOf(context).width - 40,
      title: "Units",
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int n = widget.min; n <= widget.max; n++)
              GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.chosen = n;
                      storeUnit(widget.userID, widget.chosen);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                    child: Text(widget.units[n],
                        style: TextStyle(
                            color: widget.chosen == n
                                ? Colors.white
                                : const Color.fromARGB(255, 167, 143, 186))),
                  )),
            const SizedBox(height: 6),
            const Text(
                "Hit refresh button in the home screen to update unit change",
                style: TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 216, 198, 231)))
          ],
        ),
      ),
    );
  }
}

Future storeUnit(String userID, int number) async {
  try {
    await FirebaseFirestore.instance
        .collection('UserInfo')
        .doc(userID)
        .update({'chosenUnit': number});
  } catch (e) {
    print('Error storing unit: $e');
  }
}
