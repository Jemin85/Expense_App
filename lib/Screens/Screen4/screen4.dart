import 'dart:io';
import 'package:expense_tracker/Common/button.dart';
import 'package:expense_tracker/Screens/Screen4/scn4/account.dart';
import 'package:expense_tracker/Screens/Screen4/scn4/setting/setting.dart';
import 'package:expense_tracker/provider/darkTheme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Screen4 extends StatefulWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  XFile? _imageFile;
  final ImagePicker picker = ImagePicker();

  void _profileBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          padding: const EdgeInsets.only(right: 10, left: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 7,
                  decoration: BoxDecoration(
                      color: const Color(0xffEEE5FF),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const Text('Change Name?',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600)),
                Common().textFormField(
                    null, TextInputAction.done, TextInputType.text, 'Name'),
                const Text('Change Profile Picture?',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          takePhoto(ImageSource.camera);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: const Color(0xffEEE5FF),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/camera.png'),
                                        fit: BoxFit.cover)),
                              ),
                              const Text('Camera',
                                  style: TextStyle(
                                      color: Color(0xff7F3DFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          takePhoto(ImageSource.gallery);
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: const Color(0xffEEE5FF),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/gallary.png'),
                                        fit: BoxFit.cover)),
                              ),
                              const Text('Gallary',
                                  style: TextStyle(
                                      color: Color(0xff7F3DFF),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: const Color(0xffEEE5FF),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/document.png'),
                                      fit: BoxFit.cover)),
                            ),
                            const Text('Document',
                                style: TextStyle(
                                    color: Color(0xff7F3DFF),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5)
              ]),
        );
      },
    );
  }

  void _bottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      builder: (BuildContext context) {
        return Container(
          height: 250,
          padding: const EdgeInsets.only(right: 10, left: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50), topLeft: Radius.circular(50))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 50,
                  height: 7,
                  decoration: BoxDecoration(
                      color: const Color(0xffEEE5FF),
                      borderRadius: BorderRadius.circular(20)),
                ),
                const Text('Logout',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const Text('Are you sure do you wanna logout?',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600)),
                Row(
                  children: [
                    Expanded(
                        child: Common().elevatedButton(
                            'No',
                            const Color(0xff7F3DFF),
                            const Color(0xffEEE5FF),
                            () => null)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Common().elevatedButton(
                          'Yes',
                          const Color(0xffEEE5FF),
                          const Color(0xff7F3DFF),
                          () => null),
                    )
                  ],
                ),
                const SizedBox(height: 5)
              ]),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(right: 15, left: 15),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                  color: themeProvider.isDark ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  ListTile(
                      leading: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            image: DecorationImage(
                                image: AssetImage('assets/account.png'))),
                      ),
                      title: const Text(
                        'Account',
                        style: TextStyle(fontSize: 17),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Account()));
                      }),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTile(
                      leading: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            image: DecorationImage(
                                image: AssetImage('assets/setting.png'))),
                      ),
                      title:
                          const Text('Setting', style: TextStyle(fontSize: 17)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Setting()));
                      }),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTile(
                      leading: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            image: DecorationImage(
                                image: AssetImage('assets/export.png'))),
                      ),
                      title: const Text('Export Data',
                          style: TextStyle(fontSize: 17)),
                      onTap: () {}),
                  const Divider(),
                  const SizedBox(height: 10),
                  ListTile(
                    leading: Container(
                      height: 70,
                      width: 70,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        image: DecorationImage(
                            image: AssetImage('assets/logout.png')),
                      ),
                    ),
                    title: const Text('LogOut', style: TextStyle(fontSize: 17)),
                    onTap: () {
                      _bottomSheet();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(
      source: source,
    );
    if (pickedFile == null) return;

    File tmpFile = File(pickedFile.path);
    tmpFile = await tmpFile.copy(tmpFile.path);
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
