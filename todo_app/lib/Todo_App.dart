import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './TodoModel.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // Controllers to manage text input fields
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  /// List of colors for the task cards
  List<Color> listOfCardColor = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];

  /// Function to change the card color based on the index
  Color changeColor(int index) {
    return listOfCardColor[index % listOfCardColor.length];
  }

  // List to hold the tasks
  List<Todomodel> listOfTask = [];

  // Clear text fields after submission
  void clearTextField() {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
  }

  // Function to add or edit tasks
  void submitData(bool isEdit, [Todomodel? obj]) {
    // Check that all fields are filled
    if (titleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        dateController.text.trim().isNotEmpty) {
      if (isEdit) {
        // Edit existing task
        obj!.title = titleController.text;
        obj.description = descriptionController.text;
        obj.date = dateController.text;
      } else {
        // Add new task
        listOfTask.add(Todomodel(
            title: titleController.text,
            description: descriptionController.text,
            date: dateController.text));
      }
    }
    // Clear fields and refresh UI
    clearTextField();
    setState(() {});

    Navigator.of(context).pop(); // Close bottom sheet
  }

  // Function to display the bottom sheet for adding/editing tasks
  void taskBottomSheet(bool isEdit, [Todomodel? obj]) {
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
                      fontSize: 17, color: Color.fromRGBO(0, 139, 148, 1)),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(0, 139, 148, 1),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Description input
                const Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(0, 139, 148, 1)),
                ),
                TextField(
                    controller: descriptionController,
                    maxLines: 2,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 139, 148, 1))))),
                const SizedBox(height: 10),
                // Date input
                const Text(
                  "Date",
                  style: TextStyle(
                      fontSize: 17, color: Color.fromRGBO(0, 139, 148, 1)),
                ),
                TextField(
                    controller: dateController,
                    onTap: () async {
                      // Show date picker
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2025),
                      );

                      // Format and set the selected date
                      String formattedDate =
                          DateFormat.MMMMd().format(pickedDate!);
                      dateController.text = formattedDate;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_today,
                              color: Color.fromRGBO(0, 139, 148, 1)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(
                                color: Color.fromRGBO(0, 139, 148, 1))))),
                const SizedBox(height: 25),
                // Submit button
                GestureDetector(
                  onTap: () {
                    submitData(isEdit, obj);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 139, 148, 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
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
      appBar: AppBar(
        title: const Text(
          "To-do list",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(255, 255, 255, 1)),
        ),
        backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: ListView.builder(
          itemCount: listOfTask.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: 360,
                height: 145,
                decoration: BoxDecoration(
                  color: changeColor(index), // Set card color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // Placeholder for task image
                        Container(
                          margin: const EdgeInsets.only(
                              top: 20, right: 15, bottom: 0, left: 5),
                          width: 73,
                          height: 73,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(52),
                          ),
                          child: Icon(Icons.image, size: 25),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Task title
                                Text(
                                  listOfTask[index].title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                // Task description
                                Container(
                                  width: 270,
                                  child: Text(
                                    listOfTask[index].description,
                                    style: const TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Display task date
                          Text(
                            listOfTask[index].date,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              /// Edit Icon
                              IconButton(
                                onPressed: () {
                                  // Fill text fields with existing task data for editing
                                  titleController.text =
                                      listOfTask[index].title;
                                  descriptionController.text =
                                      listOfTask[index].description;
                                  dateController.text =
                                      listOfTask[index].date;
                                  taskBottomSheet(true, listOfTask[index]);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                ),
                              ),
                              // Delete Icon
                              IconButton(
                                onPressed: () {
                                  // Remove task from the list
                                  listOfTask.removeAt(index);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Color.fromRGBO(0, 139, 148, 1),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      // Floating action button to create new tasks
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(0, 139, 148, 1),
        onPressed: () {
          taskBottomSheet(false);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
