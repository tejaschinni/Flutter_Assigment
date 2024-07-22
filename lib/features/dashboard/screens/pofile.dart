import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/features/dashboard/provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? name;
  String? email;
  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false).getuserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Consumer<ProfileProvider>(builder: (context, profile, _) {
        return Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Card(
                    elevation: 50,
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            profile.usermodel.name.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            profile.usermodel.email.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              profile.logoutFuncton();
                            },
                            child: const Text("LogOut"))
                      ],
                    )),
              )
            ],
          ),
        );
      }),
    ));
  }
}
