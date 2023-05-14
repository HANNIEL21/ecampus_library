import 'package:ecampus_library/export.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // Custom AppBar
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Actions
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen()));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.indigo[700],
                        )),
                  ),

                  //  Avatar And Name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Avatar
                        // userData.profileImg == null
                        //     ?
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            shape: BoxShape.circle,
                            color: Colors.indigo[900],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.camera_enhance,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // : Container(
                        //     height: 110,
                        //     width: 110,
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //           width: 4,
                        //           color: Theme.of(context)
                        //               .scaffoldBackgroundColor,
                        //         ),
                        //         shape: BoxShape.circle,
                        //         image: DecorationImage(
                        //             image: NetworkImage(
                        //                 userData.profileImg.toString()),
                        //             fit: BoxFit.cover)),
                        //   ),

                        //  Spacing
                        const SizedBox(
                          width: 10,
                        ),

                        //  Name
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "data",
                              // "${userData.displayName} ${userData.userName}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[700],
                              ),
                            ),
                            Text(
                              "data",
                              // "${userData.email}",
                              style: TextStyle(
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  // Spacing
                  const SizedBox(
                    height: 10,
                  ),

                  //  Stats
                  SizedBox(
                    height: 70,
                    child: Center(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          CustomStatsTile(Label: "Favourite", Score: "53"),
                          CustomStatsTile(Label: "Following", Score: "37"),
                          CustomStatsTile(Label: "Finished Books", Score: "46"),
                          CustomStatsTile(
                              Label: "Finished Audio Books", Score: "46"),
                        ],
                      ),
                    ),
                  ),

                  //
                  // Spacing
                  const SizedBox(
                    height: 20,
                  ),

                  //  Account Settings
                  Text(
                    "Account",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.indigo[700]),
                  ),
                  const ListTile(
                    leading: Icon(Icons.lock),
                    title: Text("Change Password"),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  // Divider
                  const Divider(),

                  const ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text("Notification"),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  // Divider
                  const Divider(),

                  ListTile(
                    leading: Icon(Icons.wallet),
                    title: Text("Subscription Settings"),
                    trailing: Icon(Icons.chevron_right),
                    onTap:() => context.push(const SubscriptionScreen()),
                  ),

                  // Divider
                  const Divider(),

                  const ListTile(
                    leading: Icon(Icons.front_hand),
                    title: Text("Privacy Settings"),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  const Divider(),

                  ListTile(
                    leading: const Icon(Icons.front_hand),
                    title: const Text("Manage Users"),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),

                  // Divider
                  const Divider(
                    height: 2,
                  ),

                  // Spacing
                  const SizedBox(
                    height: 20,
                  ),

                  //  More Options
                  Text("More Options",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.indigo[700])),

                  const ListTile(
                    title: Text("Newsletter"),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  // Divider
                  const Divider(
                    height: 2,
                  ),

                  const ListTile(
                    title: Text("Linked Account"),
                    trailing: Icon(Icons.chevron_right),
                  ),

                  // Divider
                  const Divider(
                    height: 2,
                  ),

                  ElevatedButton(
                      onPressed: () {
                        // TODO: LogOut
                      },
                      child: const Text("Sign Out")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
