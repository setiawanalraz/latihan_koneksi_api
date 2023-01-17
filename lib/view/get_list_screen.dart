import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_koneksi_api/api_model/list_user_model.dart';
import 'package:latihan_koneksi_api/view/post_screen.dart';

class GetListScreen extends StatefulWidget {
  const GetListScreen({Key? key}) : super(key: key);

  @override
  State<GetListScreen> createState() => _GetListScreenState();
}

class _GetListScreenState extends State<GetListScreen> {
  ListUser? listUser;
  String output = "Tidak ada data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: "API Demo POST",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PostScreen()));
            },
            icon: const FaIcon(FontAwesomeIcons.server),
          ),
        ],
        backgroundColor: Colors.green,
        title: Text(
          "API Demo GET LIST",
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              output,
              style: GoogleFonts.poppins(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  ListUser.getUser(
                    "1",
                  ).then((users) {
                    output = "";
                    for (int i = 0; i < users.length; i++) {
                      output = "$output[ ${users[i].id}, ${users[i].name} ]";
                    }
                  });
                  setState(() {});
                },
                child: IntrinsicWidth(
                  child: Text(
                    "GET",
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
