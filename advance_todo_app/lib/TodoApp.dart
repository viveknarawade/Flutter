import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20.0, top: 60),
            child: Text(
              "Good Morning",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20.0,
              bottom: 30,
            ),
            child: Text(
              "Vivek",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
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
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      "CREATE TO DO LIST ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 5,
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
          onPressed: () {},
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
