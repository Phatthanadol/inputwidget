class Drink {
  String? thName;
  String? enName;
  int? price;
  bool? checked;

  //Contructor
  Drink(this.thName, this.enName, this.price, this.checked);

  static getDrink() {
    return [
      Drink('ชานมไข่มุก', 'Bubble Tea', 39, false),
      Drink('ลาเต้', 'Latte', 69, false),
      Drink('มอคค่า', 'Moccha', 69, false),
      Drink('เลม่อนโซดา', 'Lemon Soda', 59, false),
      Drink('โค้ก', 'Coke', 29, false),
    ];
  }
}
