import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

var DUMMY_CATEGORY = [
  Category(id:'A', title: 'Italian', color: Colors.orange),
  Category(id:'B', title: 'Local dish', color: Colors.red),
  Category(id:'C', title: 'Cofee', color: Colors.indigo),
  Category(id:'D', title: 'Noodle', color: Colors.blueGrey),
  Category(id:'E', title: 'Irlandia Food', color: Colors.deepPurple),
  Category(id:'F', title: 'Brazilian', color: Colors.green)
];

var DUMMY_MEALS = [
  Meal(
    id: 'M1',
    title: 'Nasi Goreng',
    categories: ['A'],
    ingredients: ['Rice','Chili','Meatballs'],
    affordability: Affordability.Afforable,
    isSpicy: true,
    isVegetarian: false,
    bussinessHour: '18.00 - 00.00',
    imageUrl: 'https://cdn.pixabay.com/photo/2016/10/23/09/37/restaurant-1762493__480.jpg',
  ),
  Meal(
    id: 'M2',
    title: 'Somay',
    categories: ['B'],
    ingredients: ['Pasta','Cheese','Meatballs'],
    affordability: Affordability.Afforable,
    isSpicy: true,
    isVegetarian: false,
    bussinessHour: '09.00 - 17.00',
    imageUrl: 'https://image.shutterstock.com/image-photo/homemade-baked-potato-fries-mayonnaise-260nw-762822394.jpg',
  ),
  Meal(
    id: 'M3',
    title: 'Mie',
    categories: ['C'],
    ingredients: ['Cheese','Chili','Meatballs'],
    affordability: Affordability.Afforable,
    isSpicy: true,
    isVegetarian: false,
    bussinessHour: '10.00 - 20.00',
    imageUrl: 'https://image.shutterstock.com/image-photo/spagetti-260nw-295928864.jpg',
  ),
  Meal(
    id: 'M4',
    title: 'Burger',
    categories: ['D'],
    ingredients: ['Cheese','Chili','Meatballs'],
    affordability: Affordability.Afforable,
    isSpicy: true,
    isVegetarian: false,
    bussinessHour: '10.30 - 20.00',
    imageUrl: 'https://cdn.pixabay.com/photo/2020/03/03/18/27/bananas-4899495__480.jpg',
  ),
  Meal(
    id: 'M5',
    title: 'Soto',
    categories: ['E'],
    ingredients: ['Cheese','Chili','Meatballs'],
    affordability: Affordability.Afforable,
    isSpicy: true,
    isVegetarian: false,
    bussinessHour: '10.00 - 21.00',
    imageUrl: 'https://image.shutterstock.com/image-photo/spagetti-260nw-295928864.jpg',
  ),
  Meal(
    id: 'M6',
    title: 'Batagor',
    categories: ['F'],
    ingredients: ['Lamb','Chicken','Peanut'],
    affordability: Affordability.Afforable,
    isSpicy: true,
    isVegetarian: false,
    bussinessHour: '12.00 - 22.00',
    imageUrl: 'https://cdn.pixabay.com/photo/2020/03/02/08/02/iron-pot-4895036__480.jpg',
  )
];