import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_money/data/database.dart';

Future<void> seedCategories(AppDatabase db) async {
  await db.batch((batch) {
    batch.insertAll(db.tableCategories, [
      TableCategoriesCompanion.insert(
        name: 'Salary',
        type: 'income',
        code: Value('salary'),
        iconCode: Value(Icons.money_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Award',
        type: 'income',
        code: Value('award'),
        iconCode: Value(Icons.badge_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Gift',
        type: 'income',
        code: Value('gift'),
        iconCode: Value(Icons.gif_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Selling',
        type: 'income',
        code: Value('selling'),
        iconCode: Value(Icons.sell_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Interest Money',
        type: 'income',
        code: Value('interest_money'),
        iconCode: Value(Icons.percent_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Lottery',
        type: 'income',
        code: Value('lottery'),
        iconCode: Value(Icons.sports_baseball_sharp.codePoint),
      ),

      TableCategoriesCompanion.insert(
        name: 'Other Income',
        type: 'income',
        code: Value('other_income'),
        iconCode: Value(Icons.money_off_sharp.codePoint),
      ),
    ]);
  });
  final foodAndBeverageId = await db
      .into(db.tableCategories)
      .insert(
        TableCategoriesCompanion.insert(
          name: 'Food & Beverage',
          type: 'expense',
          code: Value('food_and_beverage'),
          parentId: Value(null),
          iconCode: Value(Icons.wine_bar_sharp.codePoint),
        ),
      );

  await db.batch((batch) {
    batch.insertAll(db.tableCategories, [
      TableCategoriesCompanion.insert(
        name: 'Restaurants',
        type: 'expense',
        code: Value('restaurants'),
        parentId: Value(foodAndBeverageId),
        iconCode: Value(Icons.restaurant_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Café',
        type: 'expense',
        code: Value('cafe'),
        parentId: Value(foodAndBeverageId),
        iconCode: Value(Icons.coffee_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Fast Food',
        type: 'expense',
        code: Value('fast_food'),
        parentId: Value(foodAndBeverageId),
        iconCode: Value(Icons.fastfood_sharp.codePoint),
      ),
    ]);
  });

  final billUtilitiesId = await db
      .into(db.tableCategories)
      .insert(
        TableCategoriesCompanion.insert(
          name: 'Bill & Utilities',
          type: 'expense',
          code: Value('bill_and_utilities'),
          parentId: Value(null),
          iconCode: Value(FontAwesomeIcons.moneyBill.codePoint),
        ),
      );

  await db.batch((batch) {
    batch.insertAll(db.tableCategories, [
      TableCategoriesCompanion.insert(
        name: 'Phone Bill',
        type: 'expense',
        code: Value('phone_bill'),
        parentId: Value(billUtilitiesId),
        iconCode: Value(Icons.phone_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Water Bill',
        type: 'expense',
        code: Value('water_bill'),
        parentId: Value(billUtilitiesId),
        iconCode: Value(Icons.water_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Electricity Bill',
        type: 'expense',
        code: Value('electricity_bill'),
        parentId: Value(billUtilitiesId),
        iconCode: Value(Icons.electrical_services_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Gas Bill',
        type: 'expense',
        code: Value('gas_bill'),
        parentId: Value(billUtilitiesId),
        iconCode: Value(Icons.gas_meter_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Internet Bill',
        type: 'expense',
        code: Value('internet_bill'),
        parentId: Value(billUtilitiesId),
        iconCode: Value(Icons.wifi_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Rent',
        type: 'expense',
        code: Value('rent'),
        parentId: Value(billUtilitiesId),
        iconCode: Value(Icons.home_repair_service_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: "Television Bill",
        type: 'expense',
        code: Value('television_bill'),
        parentId: Value(billUtilitiesId),
        iconCode: Value(Icons.tv_sharp.codePoint),
      ),
    ]);
  });

  final transportationId = await db
      .into(db.tableCategories)
      .insert(
        TableCategoriesCompanion.insert(
          name: 'Transportation',
          type: 'expense',
          code: Value('transportation'),
          iconCode: Value(Icons.emoji_transportation_sharp.codePoint),
        ),
      );
  await db.batch((batch) {
    batch.insertAll(db.tableCategories, [
      TableCategoriesCompanion.insert(
        name: 'Taxi',
        type: 'expense',
        code: Value('taxi'),
        parentId: Value(transportationId),
        iconCode: Value(Icons.directions_car_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: "Parking Fees",
        type: 'expense',
        code: Value('parking_fees'),
        parentId: Value(transportationId),
        iconCode: Value(Icons.local_parking_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Petrol',
        type: 'expense',
        code: Value('petrol'),
        parentId: Value(transportationId),
        iconCode: Value(Icons.local_gas_station_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Maintenance',
        code: Value('maintenance'),
        type: 'expense',
        parentId: Value(transportationId),
        iconCode: Value(Icons.car_repair_sharp.codePoint),
      ),
    ]);
  });

  final shoppingId = await db
      .into(db.tableCategories)
      .insert(
        TableCategoriesCompanion.insert(
          name: 'Shopping',
          type: 'expense',
          code: Value('shopping'),
          iconCode: Value(Icons.shopping_bag_sharp.codePoint),
        ),
      );

  await db.batch((batch) {
    batch.insertAll(db.tableCategories, [
      TableCategoriesCompanion.insert(
        name: 'Clothing',
        type: 'expense',
        code: Value('clothing'),
        parentId: Value(shoppingId),
        iconCode: Value(FontAwesomeIcons.shirt.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Footwear',
        type: 'expense',
        code: Value('footwear'),
        parentId: Value(shoppingId),
        iconCode: Value(FontAwesomeIcons.shoePrints.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Accessories',
        type: 'expense',
        code: Value('accessories'),
        parentId: Value(shoppingId),
        iconCode: Value(FontAwesomeIcons.ring.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Electronics',
        type: 'expense',
        code: Value('electronics'),
        parentId: Value(shoppingId),
        iconCode: Value(Icons.computer_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Grocery',
        type: 'expense',
        code: Value('grocery'),
        parentId: Value(shoppingId),
        iconCode: Value(Icons.local_grocery_store_sharp.codePoint),
      ),
    ]);
  });
  await db.batch((batch) {
    batch.insertAll(db.tableCategories, [
      TableCategoriesCompanion.insert(
        name: 'Friends & Lover',
        type: 'expense',
        code: Value('friends_and_lover'),
        iconCode: Value(Icons.favorite_sharp.codePoint),
      ),

      TableCategoriesCompanion.insert(
        name: "Travel",
        type: 'expense',
        code: Value('travel'),
        iconCode: Value(Icons.flight_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: "Investment",
        type: 'expense',
        code: Value('investment'),
        iconCode: Value(FontAwesomeIcons.chartArea.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Business',
        type: 'expense',
        code: Value('business'),
        iconCode: Value(Icons.business_center_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Insurance',
        type: 'expense',
        code: Value('insurance'),
        iconCode: Value(Icons.shield_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Fees & Charges',
        type: 'expense',
        code: Value('fees_and_charges'),
        iconCode: Value(Icons.stacked_bar_chart_sharp.codePoint),
      ),
      TableCategoriesCompanion.insert(
        name: 'Withdrawal',
        type: 'expense',
        code: Value('withdrawal'),
        iconCode: Value(FontAwesomeIcons.moneyBillTransfer.codePoint),
      ),
    ]);
  });
}
