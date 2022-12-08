import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/user%20mode/user_model.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future getData() async {
    const userUrl = "https://reqres.in/api/users";
    try {
      final response = await http.get(Uri.parse(userUrl));
      final responseData = json.decode(response.body);
      final userList = responseData['data'] as List;
      final List<Usermodel> users = [];

      for (var data in userList) {
        Usermodel user = Usermodel(
            avatar: data["avatar"],
            email: data["email"],
            firstname: data["first_name"],
            lastname: data["last-name"],
            id: data["id"]);
        users.add(user);
      }

      return users;
    } catch (e) {
      Exception(e);
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Test Api world"),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [...snapshot.data!.map((e) => Text(e.avatar))],
              );
            } else
              return Center(
                child: const CircularProgressIndicator(),
              );
          },
        ));
  }
}
