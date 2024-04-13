import 'package:test/expect.dart';
import 'package:untitled6/untitled6.dart' as untitled6;



Future getMessage() {
  return Future.delayed(
      Duration(seconds: 3),
          () => print("Second message after 3 sec!")
  );
}
void main2() {
  print("First message!");
  getMessage();
}
void main3() {
  Future<String> future = Future.delayed(
      Duration(seconds: 1),
          () {
        print("Выполнение Future");
        return "Hello Future";  // возвращаем строку
      });

  future.then((value){
    print("Из Future получено значение: $value");
  });

  print("Завершение функции main");
}
void main4() {
  Future<void> future = Future.delayed(
      Duration(seconds: 1),
          () => print("Hello Future"));        // возвращаемый тип - void

  future.then((_) {   // прочерк вместо параметра для типа void
    print("Выполнение Future завершено");
  });

  print("Завершение функции main");
}
void main5() {

  Future<String> future = Future.delayed(
      Duration(seconds: 1),
          () => "Hello Future"     // возвращаем строку
  );

  future.then((value){
    print("Из Future получено значение: $value");
    return 22;
  })
      .then((value) => print("Выполнение Future завершено. Получено: $value") );

  print("Завершение функции main");
}
void main6() {
  Future<String> future = Future.delayed(
      Duration(seconds: 1),
          () {
        print("Выполняется Future");
        return "Hello Dart";
      }
  );

  future.then((value){
    print("Из Future получено значение: $value");
  })
      .catchError((err) {
    print("Ошибка: $err");
  })
      .whenComplete(() { print("Future завершил свою работу"); });

  print("Ждем получения значения из Future");
}

/* String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is
// more complex and slow.
Future.delayed(
  const Duration(seconds: 20),
      () => 'Large Latte',
);

void main7() {
  print('Fetching user order...');
  print(createOrderMessage());
}
*/

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future fetchUserOrder() =>
    // Imagine that this function is
// more complex and slow.
Future.delayed(
  const Duration(seconds: 5),
      () => print("Large Latte")
);

main() {
  print('Fetching user order...');
  createOrderMessage();
}