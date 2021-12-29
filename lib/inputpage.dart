import 'package:flutter/material.dart';
import 'package:inputwidget/drink.dart';
import 'package:inputwidget/model.dart';

class InputHomepage extends StatefulWidget {
  const InputHomepage({Key? key}) : super(key: key);

  @override
  _InputHomepageState createState() => _InputHomepageState();
}

class _InputHomepageState extends State<InputHomepage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  String? groupFood;
  List<Food>? foods;
  List<ListItem> types = ListItem.getItem();
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItem;
  late ListItem _selectedTypeItem;

  List checkedDrink = [];
  List<Drink>? drinks;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foods = Food.getFood();
    drinks = Drink.getDrink();
    _dropdownMenuItem = createDropdownMenuItem(types);
    _selectedTypeItem = _dropdownMenuItem[0].value!;
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenuItem(
      List<ListItem> types) {
    List<DropdownMenuItem<ListItem>> items = [];

    for (var item in types) {
      items.add(DropdownMenuItem(
        child: Text(item.name!),
        value: item,
      ));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widget'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loginsection(),
            ),
            Column(
              children: createRadioFood(),
            ),
            Text('Food Selected: ${groupFood}'),
            Column(
              children: createRadioDrink(),
            ),
            Text('Drink Selected: ${checkedDrink}'),
            const SizedBox(
              height: 16,
            ),
            DropdownButton(
              value: _selectedTypeItem,
              items: _dropdownMenuItem,
              onChanged: (ListItem? value) {
                setState(() {
                  _selectedTypeItem = value!;
                });
              },
            ),
            Text('Dropdown selected: ${_selectedTypeItem.name}'),
          ],
        ),
      ),
    );
  }

  Widget loginsection() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _username,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Username";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: _password,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Password";
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print(_username.text + _password.text);
                }
              },
              child: Text('Submit')),
        ],
      ),
    );
  }

  List<Widget> createRadioFood() {
    List<Widget> listFood = [];

    for (var food in foods!) {
      listFood.add(
        RadioListTile<dynamic>(
          title: Text(food.thName!),
          subtitle: Text(food.enName!),
          secondary: Text('${food.price} Baht'),
          value: food.foodValue,
          groupValue: groupFood,
          onChanged: (value) {
            setState(() {
              groupFood = value;
            });
          },
        ),
      );
    }
    return listFood;
  }

  List<Widget> createRadioDrink() {
    List<Widget> listDrink = [];

    for (var drink in drinks!) {
      listDrink.add(CheckboxListTile(
        value: drink.checked,
        title: Text(drink.thName!),
        subtitle: Text(drink.enName!),
        secondary: Text('${drink.price!.toString()} บาท'),
        onChanged: (value) {
          setState(() {
            drink.checked = value;
          });

          if (value!) {
            checkedDrink.add(drink.thName);
          } else {
            checkedDrink.remove(drink.thName);
          }
        },
      ));
    }
    return listDrink;
  }
}

class ListItem {
  int? value;
  String? name;

  //Contructor
  ListItem(this.value, this.name);

  static getItem() {
    return [
      ListItem(1, 'Drinks'),
      ListItem(2, 'Traditional Foods'),
      ListItem(3, 'Western Food'),
      ListItem(4, 'Snacks'),
    ];
  }
}
