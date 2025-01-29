import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homePage_Controller.dart';
import '../../controller/settings_Controller.dart';
import '../../core/cash/cache_helper.dart';
import '../../core/constant/AppColor.dart';
import '../../core/constant/AppImage.dart';
import '../../routs.dart';

import '../../Repositories/ApiDataRepository.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    ApiDataRepository repository = Get.find();

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 4,
            child: Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height / 6,
                  color: AppColor.primaryColor,
                ),
                GetBuilder<HomePageController>(
                  builder: (controller) => Container(
                    margin: EdgeInsets.only(top: Get.height / 14),
                    child: Center(
                      child: CacheHelper().getData(key: "step") != "4"
                          ? repository.profileModel.avatarUrl == null
                              ? const Hero(
                                  tag: "profilePic",
                                  child: CircleAvatar(
                                    maxRadius: 65,
                                    backgroundImage: AssetImage(AppImage.user),
                                  ),
                                )
                              : Hero(
                                  tag: "profilePic",
                                  child: CircleAvatar(
                                    maxRadius: 65,
                                    backgroundImage: NetworkImage(
                                        repository.profileModel.avatarUrl!),
                                  ),
                                )
                          : const Hero(
                              tag: "profilePic",
                              child: CircleAvatar(
                                maxRadius: 55,
                                backgroundImage: AssetImage(AppImage.user),
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Card(
                child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: const Text("Disable notfication"),
                  trailing: Switch(
                    value: true,
                    onChanged: (val) {},
                    activeColor: AppColor.primaryColor,
                  ),
                ),
                ListTile(
                  onTap: () {
                    controller.goToUserProfile();
                  },
                  title: const Text("My Profile"),
                  trailing: const Icon(Icons.person),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRout.userAddressInfo);
                  },
                  title: const Text("Address"),
                  trailing: const Icon(Icons.location_on),
                ),
                ListTile(
                  onTap: () {
                    // controller.testData.getData2();
                  },
                  title: const Text("About us"),
                  trailing: const Icon(Icons.info_outline),
                ),
                // Divider(),
                ListTile(
                  onTap: () {
                    // launchUrl(Uri.parse("tel:+963 0936393564"));
                  },
                  title: const Text("Contact us"),
                  trailing: const Icon(Icons.phone),
                ),
                // Divider(),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.logout),
                ),
              ],
            )),
          )
        ],
      ),
    ));
  }
}
