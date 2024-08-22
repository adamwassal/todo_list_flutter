import 'package:flutter/material.dart';
import 'package:todo/widgets/counter.dart';
import 'package:todo/widgets/todo-card.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoScreen(),
    );
  }
}

class Task {
  String title;
  bool state;

  Task({required this.title, required this.state});
}

List<Task> allTasks = [];

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final controller = TextEditingController();
  String text = "";
  int all = allTasks.length;

  int calculatect() {
    int allcompleted = 0;

    for (var item in allTasks) {
      if (item.state) {
        allcompleted++;
      }
    }

    return allcompleted;
  }

  void addtask() {
    setState(() {
      text = controller.text;
      if (text != "") {
        allTasks.add(Task(title: text, state: false));
        controller.text = "";
        all++;
      }
    });
  }

  void changestate(int i) {
    setState(() {
      allTasks[i].state = !allTasks[i].state;
      print(allTasks[i].state);
    });
  }

  void delete(int i) {
    setState(() {
      allTasks.removeAt(i);
      all--;
    });
  }

  void deleteall() {
    setState(() {
      allTasks.clear();
      all = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  color: Color.fromRGBO(58, 66, 86, 0.9),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          Text(
                            'Swipe down to close',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'New task',
                                hintStyle: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 154, 154, 154)),
                                hoverColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                            style: TextStyle(color: Colors.white),
                            controller: controller,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                addtask();
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(
                                          255, 171, 171, 171))),
                              child: Text(
                                'Add',
                                style: TextStyle(
                                    fontSize: 26,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ))
                        ],
                      ),
                    ],
                  ),
                );
              },
              isScrollControlled: true);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Color.fromRGBO(58, 66, 86, 0.9),
      appBar: AppBar(
        title: Text(
          'To Do App',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              deleteall();
            },
            icon: Icon(Icons.delete_forever),
            color: Color.fromARGB(255, 255, 176, 171),
            iconSize: 30,
          )
        ],
        backgroundColor: Color.fromRGBO(58, 66, 86, 1),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Counter(
              all: all,
              allcomplated: calculatect(),
            ),
            Container(
              height: 550,
              child: ListView.builder(
                  padding: const EdgeInsets.all(25),
                  itemCount: allTasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: ToDoCard(
                        title: allTasks[index].title,
                        state: allTasks[index].state,
                        change: changestate,
                        delete: delete,
                        iii: index,
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}