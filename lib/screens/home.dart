import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';
import '../model/todo.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todolist = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();
   
  @override
  void initState() {
    _foundToDo = todolist;
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top:50,bottom: 40),
                      child: Text(
                        "All ToDos",
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    for (ToDo todoo in _foundToDo.reversed)
                      ToDoItem(
                        todo: todoo, 
                        onToDoChanged: _handleToDoChange,
                        onDeletedItem: _handleDeleteToDoItem,
                  ),
                  ],
                )
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20, 
                        vertical: 5 , ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,),],
                          borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Add a new ToDo item",
                        ),
                      ),
                      ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20),
                  child: ElevatedButton(
                      child: Text(
                        "+",
                        style:TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    onPressed: () {
                      _addToDoItem(_todoController.text );
                    },
                      style: ElevatedButton.styleFrom(
                        
                        backgroundColor: tdBlue,
                        minimumSize: Size(60,60),
                        elevation: 10,
                      ),
                )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  void _handleToDoChange(ToDo todo){
            setState(() {
              todo.isDone = !todo.isDone;
            });
            
  }

  void _handleDeleteToDoItem(String id){
    setState(() {
              todolist.removeWhere((item) => item.id == id);
            });
  }

 void _addToDoItem(String todo){
  
  
  setState(() {
    todolist.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todoText: todo ));
  });
  _todoController.clear();
 }  

 void _runFilter(String enteredKeyword){
  List<ToDo> results = [];
  if(enteredKeyword.isEmpty){
    results = todolist;
  }else{
    results = todolist.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList().toList();
  }
  setState(() {
    _foundToDo = results;
  });
  

 

 }


  Widget searchBox(){
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration( 
              color: Colors.white,
              borderRadius:BorderRadius.circular(20)
              ),
              child: TextField(
              onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search,
                color:tdBlack,
                size: 20,
                ),
                prefixIconConstraints: BoxConstraints(
                  maxHeight: 20,
                  minWidth: 25),
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(color:tdGrey),

              ),

              ),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Icon(
        Icons.menu,
        color: tdBlack,
        size:30,
      ),
      Container(
        height: 40,
        width: 40,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset("assets/avatar.jpeg"),
        ),
      )
      ]),
    );
  }
}