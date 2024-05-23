class ToDo{
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return [
      // ToDo(id: "01", todoText: "Buy Milk", isDone: true),
      // ToDo(id: "02", todoText: "Buy Bread", isDone: true),
      // ToDo(id: "03", todoText: "Buy Butter", ),
      // ToDo(id: "04", todoText: "Buy Cheese", ),
      // ToDo(id: "05", todoText: "Buy Eggs",),
    ];

  }
  
  
  
  }