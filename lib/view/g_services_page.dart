import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:government_services_new/provider/home_provider.dart';
import 'package:government_services_new/view/g_service.dart';
import 'package:government_services_new/view/my_web.dart';
import 'package:provider/provider.dart';

class GServicesPage extends StatefulWidget {
  const GServicesPage({super.key});

  @override
  State<GServicesPage> createState() => _GServicesPageState();
}

class _GServicesPageState extends State<GServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Gservice(sname: "RMC",url: "https://www.rmc.gov.in/");
                },
              ));

              print("RMC");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey),
              child: Text("RMC"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Gservice(sname: "Railway",url: "https://indianrailways.gov.in/",);
                },
              ));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey),
              child: Text("Reilway"),
            ),
          ),
          InkWell(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Gservice(sname: "BOB",url: "https://www.bankofbaroda.in/",);
                },
              ));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey),
              child: Text("BOB"),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Gservice(sname: "GSRTC",url: "https://gsrtc.in/site/",);
                },
              ));
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.grey),
              child: Text("BRTS"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyWebPage();
        },));
      },),
    );
  }
}
