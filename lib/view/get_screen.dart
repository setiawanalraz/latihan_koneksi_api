import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihan_koneksi_api/api_model/single_user_model.dart';
import 'package:latihan_koneksi_api/view/get_list_screen.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({Key? key}) : super(key: key);

  @override
  State<GetScreen> createState() => _GetScreenState();
}

class _GetScreenState extends State<GetScreen> {
  User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: "API Demo GET LIST",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GetListScreen()),
                );
              },
              icon: const FaIcon(FontAwesomeIcons.database)),
        ],
        backgroundColor: Colors.green,
        title: Text(
          "API Demo GET",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                (user != null)
                    ? "${user!.id} | ${user!.name}"
                    : "Tidak ada data",
                style: GoogleFonts.poppins(fontSize: 20),
                textAlign: TextAlign.center),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  User.connectToAPI(
                    "4",
                  ).then((value) => user = value);
                  setState(() {});
                },
                child: Text(
                  "GET",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
