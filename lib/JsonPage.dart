import 'dart:convert';
import 'package:flutter/material.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load JSON File From Local"),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            dynamic showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                // return ListTile(
                //   title: Text(showData[index]['first_name']),
                //   subtitle: Text(showData[index]['username']),
                // );
                return Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 15, bottom: 8, top: 8),
                        child: CircleAvatar(
                            child: Image.network(showData[index]['avatar'] ??
                                "https://cdn-icons-png.flaticon.com/512/21/21104.png")),
                        // child: Icon(
                        //   Icons.account_circle,
                        //   size: 50,
                        // ),
                      ),
                      Expanded(
                          child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Row(
                                children: [
                                  Text(showData[index]['first_name']),
                                  SizedBox(width: 8),
                                  Text(showData[index]['last_name'])
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(showData[index]['username']),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(showData[index]['status'] ?? " "),
                            )
                          ],
                        ),
                      )),
                      Column(
                        children: [
                          Text(showData[index]['last_seen_time']),

                          // Icon(Icons.account_circle)
                          Text(showData[index]['messages'] ?? " ")
                        ],
                      )
                    ],
                  ),
                );
              },
              itemCount: showData.length,
            );
          },
          future: DefaultAssetBundle.of(context)
              .loadString("assets/info_list.json"),
        ),
      ),
    );
  }
}
