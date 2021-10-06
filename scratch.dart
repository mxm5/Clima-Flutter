import 'dart:io';





void main(){
//  screenshotA();
  performTasks();
  performOtherTasks();
  print('\n ----------- end of main short tasks --------------');
}


void performTasks() async{
  print('--------------- performing task -------------\n ');
  task1();
  print(task2());
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = 'task 1 data';
  print('$result 1 complete');
}

Future<String> task2() async {
  Duration fourSeconds = Duration(seconds: 4);
//  sleep(fourSeconds);
//  String result = 'task 2 data';
//  print('task 2 complete');

  // running in background sleep vs Future.delayed

  String result;

  await  Future.delayed(fourSeconds,(){
    result = 'task 2 data';
    print('task 2 complete');
  });
  return result;
// print('task 2 delyed now ');
 // problem solved

}

void task3(String result) {
  print('task 3 complete with (( $result ))');
}


void task4(){
  print('task 4 is done');
}

void task5(){
  print('task 5 is done');
}

void performOtherTasks(){
  task4();
  task5();
}

//############################################################################.
//############################################################################.
//############################################################################.
//############################################################################.
//############################################################################.
void screenshotA(){

//  void performTasks() async{
//    print('--------------- performing task -------------\n ');
//    task1();
//    String task2result = await task2();
//    task3();
//  }

  void task1() {
    String result = 'task 1 data';
    print('task 1 complete');
  }

  Future<String> task2() async {
    Duration fourSeconds = Duration(seconds: 4);
//  sleep(fourSeconds);
//  String result = 'task 2 data';
//  print('task 2 complete');

    // running in background sleep vs Future.delayed

    await  Future.delayed(fourSeconds,(){
      String result = 'task 2 data';
      print('task 2 complete');
    });

    print('task 2 delyed now ');
    // problem solved

  }

  void task3() {
    String result = 'task 3 data';
    print('task 3 complete');
  }

  void performTasks() async{
    print('--------------- performing task -------------\n ');
    task1();
    String task2result = await task2();
    task3();
  }

  performTasks();

}