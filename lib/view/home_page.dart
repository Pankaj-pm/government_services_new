import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:government_services_new/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ConnectivityResult cres=ConnectivityResult.none;
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).checkingConnection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Column(
        children: [
          StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (context, snapshot) {
                return Text(
                  "Connection status\n${snapshot.data}",
                  style: Theme.of(context).textTheme.titleLarge,
                );
              }),
          Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider value, Widget? child) {
              bool isConnection=value.connectivityResult!=ConnectivityResult.none;
              return Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: isConnection ?Colors.green:Colors.red),
                child: Text(
                  isConnection ? "Connected" :" Disconnected",
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ConnectivityResult checkConnection = await Connectivity().checkConnectivity();
          if (checkConnection != ConnectivityResult.none) {
            print("Open Website");
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No Internet")));
          }
        },
        child: Icon(Icons.add),
      ),
      bottomSheet: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            bool isConnection = snapshot.data != ConnectivityResult.none;


            if (isConnection) {
              // mobile mobile
              if(cres!=snapshot.data){
                Future.delayed(
                  Duration(seconds: 1),
                      () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Connection"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                );
              }


              cres=snapshot.data!;
              return SizedBox();
            } else {
              return Container(
                color: Colors.red,
                width: double.infinity,
                height: 30,
                alignment: Alignment.center,
                child: Text(
                  "No Connection",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
          }),
    );
  }
}
