import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:government_services_new/provider/home_provider.dart';
import 'package:provider/provider.dart';

class Gservice extends StatefulWidget {
  final String sname;
  final String url;

  const Gservice({super.key, required this.sname, required this.url});

  @override
  State<Gservice> createState() => _GserviceState();
}

class _GserviceState extends State<Gservice> {
  @override
  void initState() {
    Provider.of<HomeProvider>(context, listen: false).onChangeLoad(true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service name = ${widget.sname}"),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri(widget.url),
            ),
            onLoadStart: (controller, url) {
              Provider.of<HomeProvider>(context, listen: false).onChangeLoad(true);
            },
            onLoadStop: (controller, url) {
              Provider.of<HomeProvider>(context, listen: false).onChangeLoad(false);
            },
          ),
          Consumer<HomeProvider>(
            builder: (BuildContext context, HomeProvider value, Widget? child) {
              if (value.isLoad) {
                return Center(child: CircularProgressIndicator());
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
