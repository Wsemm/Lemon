import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Repositories/ApiDataRepository.dart';
import '../../../controller/userInfo_Controller.dart';

class UserAddresInfo extends StatelessWidget {
  const UserAddresInfo({super.key});

  @override
  Widget build(BuildContext context) {
    UserInfoController controller = Get.put(UserInfoController());
    ApiDataRepository repository = Get.find();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(repository.addressList);
          // Get.toNamed(AppRout.addUserAddressInfo);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("My Address"),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () {},
              child: Container(
                width: Get.width - 50,
                height: Get.height / 7,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: const Offset(0, 3), // Offset of the shadow
                  ),
                ], borderRadius: BorderRadius.circular(20)),
                child: Card(
                    // child: ListTile(
                    //   title: Text("label"),
                    //   subtitle: Text("street"),
                    // ),
                    child: ListTile(
                  title: Text("${repository.addressList[0]["label"]}"),
                  subtitle: Text("${repository.addressList[0]["street"]}"),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
