import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latihan_koneksi_api/api_model/post_result_model.dart';
import 'package:latihan_koneksi_api/view/get_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostResult? postResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            tooltip: "API Demo GET",
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const GetScreen()));
            },
            icon: const FaIcon(FontAwesomeIcons.earthAsia),
          ),
        ],
        title: Text(
          "API Demo POST",
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              (postResult != null)
                  ? "${postResult!.id} | ${postResult!.name} | ${postResult!.job} | ${postResult!.created}"
                  : "Tidak ada data",
              style: GoogleFonts.poppins(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  PostResult.connectToAPI("Alaraz Wari Setiawan",
                          "Mobile Applications Developer")
                      .then((value) => postResult = value);
                  setState(() {});
                },
                child: Text(
                  "POST",
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
