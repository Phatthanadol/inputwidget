class Food {
  String? thName;
  String? enName;
  int? price;
  String? foodValue;

  //Contructor
  Food(this.thName, this.enName, this.price, this.foodValue);

  static getFood() {
    return [
      Food('พิซซ่า', 'Pizza', 99, 'pizza'),
      Food('สเต็ก', 'Steak', 129, 'steak'),
      Food('ชาบู', 'Shabu', 399, 'shabu'),
      Food('ซูชิ', 'Sushi', 29, 'sushi'),
      Food('ต็อกบกกี', 'Tokpokki', 59, 'tokpokki'),
    ];
  }
}
