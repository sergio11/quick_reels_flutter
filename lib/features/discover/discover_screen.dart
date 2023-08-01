import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickreels/domain/model/user.dart';
import 'package:quickreels/features/discover/discover_controller.dart';
import 'package:quickreels/features/profile/profile_screen.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({Key? key}) : super(key: key);

  final DiscoverController discoverController = Get.put(DiscoverController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            decoration: const InputDecoration(
              filled: false,
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onFieldSubmitted: (value) => discoverController.searchUser(value),
          ),
        ),
        body: discoverController.searchedUsers.isEmpty
            ? const Center(
          child: Text(
            'Search for users!',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
            : ListView.builder(
          itemCount: discoverController.searchedUsers.length,
          itemBuilder: (context, index) {
            UserBO user = discoverController.searchedUsers[index];
            return InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(uid: user.uid),
                ),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.profilePhoto,
                  ),
                ),
                title: Text(
                  user.name,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}