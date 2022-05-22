// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'user_page.dart';
// import 'package:firebase_setup/model/user.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
  
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'All Users',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'All Users'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;
  

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final controller = TextEditingController();
//   String? id;
//   late final String nama;
//   late final int age;
//   late final DateTime birthday;

//   @override
//   Widget build(BuildContext context) => Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: StreamBuilder<List<User>>(
//         stream: readUsers(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text('Terjadi Kesalahan! ${snapshot.error}');
//           } else if (snapshot.hasData) {
//             final users = snapshot.data!;

//             return ListView(
//               children: users.map(buildUser).toList(),
//             );
//           } else {
//             return const Center(child: CircularProgressIndicator());
//           }
//         }),
//       floatingActionButton: FloatingActionButton(
//         child: const Icon(Icons.add),
//         onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => UserPage(),
//               ));
//             }
//       ), // 
//     );

//     Widget buildUser(User user) => Column(
//       children: [
//         ListTile(
//           leading: CircleAvatar(
//             child: Text(user.age.toString()),
//           ),
//           title: Text(user.nama),
//           subtitle: Text(user.birthday.toIso8601String()),
//         ),
//         Align(
//           child: Row(
//             children: [
//               ElevatedButton(
//                 child: const Icon(Icons.edit),
//                 onPressed: () {
//                   final docUser = FirebaseFirestore.instance
//                   .collection('users')
//                   .doc(user.id);

//                   docUser.update({
//                     'nama': 'Eko Permana',
//                   });

//                 } ),
//               const SizedBox(height: 24, width: 24),
//               ElevatedButton(
//                 child: const Icon(Icons.delete),
//                 onPressed: () {
//                   final docUser = FirebaseFirestore.instance
//                   .collection('users')
//                   .doc(user.id);

//                   docUser.delete();
//             } ),
//             ],
//           ),
//         ),
//       ],
//     );

//     Stream<List<User>> readUsers() => FirebaseFirestore.instance
//     .collection('users')
//     .snapshots()
//     .map((snapshot) =>
//         snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
// }