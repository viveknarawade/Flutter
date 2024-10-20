import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  // Function to display the bottom sheet for adding/editing tasks
  void taskBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Create To-Do",
                      style:
                          TextStyle(fontSize: 29, fontWeight: FontWeight.w700),
                    )),
                const SizedBox(height: 10),
                // Title input
                const Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(89, 57, 241, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Description input
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                    maxLines: 2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            )))),
                const SizedBox(height: 10),
                // Date input
                const Text(
                  "Date",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromRGBO(89, 57, 241, 1),
                  ),
                ),
                TextField(
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.calendar_month_outlined,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(
                              color: Color.fromRGBO(89, 57, 241, 1),
                            )))),
                const SizedBox(height: 25),
                // Submit button
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30),
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(89, 57, 241, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 34.0, top: 70),
            child: Text(
              "Good morning",
              style: TextStyle(color: Colors.white, fontSize: 23),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 34.0,
              bottom: 30,
            ),
            child: Text(
              "Vivek",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 17.0),
                    child: Text(
                      "CREATE TO DO LIST ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: Container(
                            decoration: const BoxDecoration(),
                            child: ListView.builder(
                                itemCount: 9,
                                itemBuilder: (context, index) {
                                  return Slidable(
                                    endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        children: [
                                          const SizedBox(
                                            width: 22,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: 35,
                                                height: 35,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        89, 57, 241, 1)),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.edit_outlined,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 35,
                                                height: 35,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Color.fromRGBO(
                                                        89, 57, 241, 1)),
                                                child: IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.delete_outline,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ]),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.30),
                                            blurRadius: 8,
                                            offset: Offset(0, 5),
                                            blurStyle: BlurStyle.outer,
                                          )
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            padding: const EdgeInsets.all(9),
                                            decoration: const BoxDecoration(
                                              color: Color.fromRGBO(
                                                  217, 217, 217, 1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              "assets/logo.png",
                                              color: Colors.white,
                                              height: 45,
                                              width: 45,
                                            ),
                                          ),
                                          const Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Lorem Ipsum is simply dummy industry.",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Simply dummy text of the printing and type setting industry pe setting industry.",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "10 July 2023",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: IconButton(
          onPressed: () {
            taskBottomSheet();
          },
          icon: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
