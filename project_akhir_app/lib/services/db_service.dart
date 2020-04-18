// import 'package:path/path.dart';
// import 'package:sqfLite/sqfLite.dart';
// import 'package:project_akhir/models/product.dart';

// class DbService{
//   sql.Database db;

//   Future<void> open() async{
//     final dbPath = await sql.getDatabasesPath();
//     final myDBpath = path.join(dbPath, 'enigma.db');
//     db = await sql.openDatabase(
//       myDBpath,
//       onCreate:(db, version) async{
//         db.execute(
//           'CREATE TABLE product(id TEXT PRIMARY KEY, title TEXT, description TEXT, price REAL'
//         );
//     },
//     version: 1
//     )
//   }

//   addProduct(Product product) async{
//    await open();
//    await db.insert('product', product.toMap());
//    return product;
//   }

//   getProducts() async {
//     await open();
//     List<Map> list = await db.rawQuery('SELECT * FROM product');
//     return List.generate(list.length, (i) {
//       return Product(
//         id: list[i]['id'],
//         title: list[i]['title'],
//         description: list[i]['description'],
//         price: list[i]['price'],
//       )
//     })
//   }
// }