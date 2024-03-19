import 'dart:io';

// Interface
abstract class Animal {
  void makeSound();
}

// Parent class
class LivingBeing {
  void breathe() {
    print('Breathing...');
  }
}

// Child class implementing an interface
class Dog extends LivingBeing implements Animal {
  @override
  void makeSound() {
    print('Woof woof!');
  }

  // Method overriding
  @override
  void breathe() {
    print('Dog is breathing...');
  }
}

// Class initialized with data from a file
class Cat extends LivingBeing implements Animal {
  String name;
  int age;

  Cat(this.name, this.age);

  @override
  void makeSound() {
    print('Meow!');
  }

  void displayInfo() {
    print('Name: $name, Age: $age');
  }
}

void main() {
  // Demonstrating loop
  for (int i = 0; i < 3; i++) {
    print('Loop iteration: $i');
  }

  // Initializing Cat instance with data from a file
  var cat = readCatFromFile('cat_data.txt');
  cat.makeSound();
  cat.displayInfo();

  // Creating Dog instance
  var dog = Dog();
  dog.makeSound();
  dog.breathe();
}

// Function to read Cat data from a file
Cat readCatFromFile(String fileName) {
  var file = File(fileName);
  var lines = file.readAsLinesSync();
  var name = lines[0];
  var age = int.parse(lines[1]);
  return Cat(name, age);
}