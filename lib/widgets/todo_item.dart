import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import '../model/todo.dart';
class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeletedItem;



  const ToDoItem({Key? key, required this.todo, required this.onToDoChanged, required this.onDeletedItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () { 
          onToDoChanged(todo);
          
          //print("Clicked on ToDo Item.");
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 5, ),
      tileColor: Colors.white,
      leading: Icon(
        todo.isDone? Icons.check_box: Icons.check_box_outline_blank,
        color:tdBlue),
      title: Text(
        todo.todoText!,
      style: TextStyle(
        fontSize: 16,
        color:tdBlack,
        decoration: todo.isDone? TextDecoration.lineThrough:null, )
        ),
        trailing: Container(
          padding:EdgeInsets.all(0),
          //margin: ,
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
        child: IconButton(
          color: Colors.white,
          iconSize: 18,
          icon: Icon(Icons.delete),
          onPressed: () { 
            //print("Clicked on delete icon");
            onDeletedItem(todo.id!);},
        ),
        ),
        ),

    );
    
  }
}

