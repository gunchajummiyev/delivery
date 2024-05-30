import 'package:collection/collection.dart';
import 'package:delivery/models/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {

  //list of food menu
  final List<Food> _menu = [

    //burgers
  Food(name: "Cheeseburger",
        description: "Dana eti (cheddar peynir, karamelize soğan, turşu, yeşillik,"
            "özel sos, domates) ",
        imagePath: "lib/images/burgers/cheese_burger.png",
        price: 11,
        category: FoodCategory.burgers,
        availableAddons:[
          Addon(name: "ekstra peynir", price: 0.99),
          Addon(name: "ekstra sos", price: 0.30),
        ],
    ),
    Food(name: "Efsane Tavuk Burger ",
      description: "Acılı ve cheddar soslu tavuk burger (yeşillik,domates)",
      imagePath: "lib/images/burgers/chicken.png",
      price: 8,
      category: FoodCategory.burgers,
      availableAddons:[
        Addon(name: "cheddar peyniri", price: 0.90),
        Addon(name: "jalapeno biberi", price: 0.30),
      ],
    ),
    Food(name: "Classic Burger",
      description: "burger köftesi, karamelize soğan, yeşillik, turşu, domates",
      imagePath: "lib/images/burgers/classic_burger.png",
      price: 9,
      category: FoodCategory.burgers,
      availableAddons:[
        Addon(name: "cheddar peyniri", price: 0.90),
        Addon(name: "özel sos", price: 0.3),
      ],
    ),
    Food(name: "BBQ Bakon Burger",
      description: "Dana eti (dana füme, soğan, özel sos, yeşillik, domates)",
      imagePath: "lib/images/burgers/bbq_burger.png",
      price: 13,
      category: FoodCategory.burgers,
      availableAddons:[
        Addon(name: "jalapeno biberi", price: 0.30),
        Addon(name: "ekstra sos", price: 0.3),
      ],
    ),
    Food(name: "Dublex Burger",
      description: "Dana eti (double cheddar peyniri, karamelize soğan,yeşillik)",
      imagePath: "lib/images/burgers/dublex_burger.png",
      price: 12,
      category: FoodCategory.burgers,
      availableAddons:[
        Addon(name: "turşu", price: 0.20),
        Addon(name: "ekstra peynir", price: 0.90),
        Addon(name: "barbekü sos", price: 0.10),
      ],
    ),

    //salads
    Food(name: "Greek Salad",
      description: " karides, süzme peynir, zeytin, salatalık, domates",
      imagePath: "lib/images/salads/salad1.png",
      price: 10,
      category: FoodCategory.salads,
      availableAddons:[
        Addon(name: "ekstra sos", price: 0.20),
      ],
    ),
    Food(name: "Salamon Salad",
      description: " salamo, cherry domates, yeşillik ",
      imagePath: "lib/images/salads/salad2.png",
      price: 15,
      category: FoodCategory.salads,
      availableAddons:[
        Addon(name: "eksrta sos", price: 0.20),
      ],
    ),
    Food(name: "Spinach Salad",
      description: " tavuk, humus, kırmızı biber, cherry domates ",
      imagePath: "lib/images/salads/salad3.png",
      price: 9,
      category: FoodCategory.salads,
      availableAddons:[
        Addon(name: "eksrta sos", price: 0.20),
      ],
    ),
    Food(name: "Vegetarian Salad",
      description: "avakado, kırmızı biber, bol yeşillik",
      imagePath: "lib/images/salads/salad4.png",
      price: 13,
      category: FoodCategory.salads,
      availableAddons:[
        Addon(name: "eksrta sos", price: 0.20),
      ],
    ),

    //sides
    Food(name: "Patates kızartması",
      description: "",
      imagePath: "lib/images/sides/side1.png",
      price: 3,
      category: FoodCategory.sides,
      availableAddons:[
        Addon(name: "ekstra büyük boy", price: 0.2),
      ],
    ),
    Food(name: "Tenders",
      description: "4lü tenders ve özel sos",
      imagePath: "lib/images/sides/side2.png",
      price: 5,
      category: FoodCategory.sides,
      availableAddons:[
      ],
    ),
    Food(name: "But",
      description: "2  parça but ",
      imagePath: "lib/images/sides/side3.png",
      price: 4.50,
      category: FoodCategory.sides,
      availableAddons:[
        Addon(name: "sos", price: 0.10),
      ],
    ),
    Food(name: "Humus",
      description: "humus tabağı",
      imagePath: "lib/images/sides/side4.png",
      price: 3,
      category: FoodCategory.sides,
      availableAddons:[
      ],
    ),
  Food(name: "Soğan Halkası",
  description: "6lı soğan halkası",
  imagePath: "lib/images/sides/side5.png",
  price: 2,
  category: FoodCategory.sides,
  availableAddons:[
  Addon(name: "sos", price: 0.10),
  ],
  ),


    //pastas
    Food(name: "Penne Arrabbiata",
      description: "özel sos, cherry domates, nane ",
      imagePath: "lib/images/pastas/pasta1.png",
      price: 13,
      category: FoodCategory.pastas,
      availableAddons:[
        Addon(name: "parmesan peyniri", price: 0.3),

      ],
    ),
    Food(name: "Tavuklu Makarna",
      description: "tavuk göğüs, mantar,yeşil biber, özel sos",
      imagePath: "lib/images/pastas/pasta2.png",
      price: 14,
      category: FoodCategory.pastas,
      availableAddons:[
        Addon(name: "parmesan peyniri", price: 0.3),
      ],
    ),
    Food(name: "Spaghetti",
      description: "domates sos, nane, kırmızı biber ",
      imagePath: "lib/images/pastas/pasta3.png",
      price: 8,
      category: FoodCategory.pastas,
      availableAddons:[
      ],
    ),
    Food(name: "Spaghetti Bolognese",
      description: "karidesli ve bol sebzeli",
      imagePath: "lib/images/pastas/pasta4.png",
      price: 15,
      category: FoodCategory.pastas,
      availableAddons:[
      ],
    ),
    Food(name: "Ramen Soup",
      description: "",
      imagePath: "lib/images/pastas/pasta5.png",
      price: 7,
      category: FoodCategory.pastas,
      availableAddons:[
      ],
    ),

    //dessert
    Food(name: "Chocolate cake",
      description: "dondurmalı çikolatalı pasta",
      imagePath: "lib/images/desserts/dessert1.png",
      price: 5,
      category: FoodCategory.desserts,
      availableAddons:[
      ],
    ),
    Food(name: "Belgıan Waffle",
      description: "çilekli dondurmalı özel soslu waffle ",
      imagePath: "lib/images/desserts/dessert2.png",
      price: 6,
      category: FoodCategory.desserts,
      availableAddons:[
        Addon(name: "ekstra dondurma", price: 0.3),
        Addon(name: "ekstra sos", price: 0.1),
      ],
    ),
    Food(name: "Frutti Cheesecake",
      description: "çilekli, soslu",
      imagePath: "lib/images/desserts/dessert3.png",
      price: 5.50,
      category: FoodCategory.desserts,
      availableAddons:[
        Addon(name: "ekstra sos", price: 0.1),
      ],
    ),
    Food(name: "Dondurma",
      description: "çilekli, gelato yoğurtlu",
      imagePath: "lib/images/desserts/dessert4.png",
      price: 3,
      category: FoodCategory.desserts,
      availableAddons:[
        Addon(name: "ekstra sos", price: 0.1),
      ],
    ),

    //drinks
    Food(name: "Coca-cola",
      description: "",
      imagePath: "lib/images/drinks/drink1.png",
      price: 1.50,
      category: FoodCategory.drinks,
      availableAddons:[

      ],
    ),
    Food(name: "Sprite",
      description: "",
      imagePath: "lib/images/drinks/drink2.png",
      price: 1.50,
      category: FoodCategory.drinks,
      availableAddons:[
      ],
    ),
    Food(name: "Fanta",
      description: "",
      imagePath: "lib/images/drinks/drink3.png",
      price: 1.50,
      category: FoodCategory.drinks,
      availableAddons:[
      ],
    ),
    Food(name: "Red Bull",
      description: "",
      imagePath: "lib/images/drinks/drink4.png",
      price: 2,
      category: FoodCategory.drinks,
      availableAddons:[
      ],
    ),
    Food(name: "Water",
      description: "",
      imagePath: "lib/images/drinks/drink5.png",
      price: 0.50,
      category: FoodCategory.drinks,
      availableAddons:[
      ],
    ),

  ];

  //user cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = 'Gumus referans';


// G E T T E R S

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;


  //O P E R A T I O N S


//ADD TO CART
void addToCart(Food food, List<Addon> selectedAddons){
  CartItem? cartItem = _cart.firstWhereOrNull((item){
    //check if the food items are the same
    bool isSameFood = item.food == food;

    //check if the list of selected addons are the same
    bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

    return isSameFood && isSameAddons;
  });

  //if item already exists, increase it's quantity
  if (cartItem != null) {
    cartItem.quantity++;
  }
  else {
    _cart.add(CartItem(food: food, selectedAddons: selectedAddons),
    );
  }
  notifyListeners();
}
//REMOVE FROM CART
void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);

  if (_cart[cartIndex].quantity > 1) {
    _cart[cartIndex].quantity--;
  }else{
    _cart.remove(cartIndex);
  }
  notifyListeners();
}
//GET TOTAL PRICE OF CART
 double getTotalPrice() {
   double total = 0.0;

  for (CartItem cartItem in _cart) {
    double itemTotal = cartItem.food.price;

    for(Addon addon in cartItem.selectedAddons) {
      itemTotal += addon.price;
    }
    total += itemTotal * cartItem.quantity;
  }
  return total;
}
//GET TOTAL NUMBER OF ITEMS IN CART
int getTotalItemCount() {
  int totalItemCount = 0;

  for (CartItem cartItem in _cart) {
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;

}
//CLEAR CART
void clearCart() {
  _cart.clear();
  notifyListeners();
}

//update delivery address
  void updateDeliveryAddress(String newAddress) {
  _deliveryAddress = newAddress;
  notifyListeners();
  }


//H E L P E R S


//GENERATE A RECEIPT
String displayCartReceipt () {
  final receipt = StringBuffer();
  receipt.writeln("Here's your receipt.");
  receipt.writeln();

  //format the date to include up to seconds only
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

  receipt.writeln(formattedDate);
  receipt.writeln();
  receipt.writeln("-------------");

  for(final cartItem in _cart) {
  receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
  if(cartItem.selectedAddons.isEmpty) {
    receipt
    .writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
  }
  receipt.writeln();
  }

  receipt.writeln("---------");
  receipt.writeln();
  receipt.writeln("Total Items: ${getTotalItemCount()}");
  receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
  receipt.writeln();
  receipt.writeln("Delivering to:" + deliveryAddress);

  return receipt.toString();
}
//FORMAT DOUBLE VALUE INTO MONEY
String _formatPrice(double price) {
  return "\$${price.toStringAsFixed(2)}";
}

//FORMAT LIST OF ADDONS INTO A STRING SUMMARY
String _formatAddons (List<Addon> addons) {
  return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
}

}