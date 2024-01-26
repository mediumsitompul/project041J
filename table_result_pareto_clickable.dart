import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'data_model_table1.dart';
import 'main.dart';

class TableResultParetoClickable extends StatelessWidget {
  final String major1a;

  const TableResultParetoClickable({super.key, required this.major1a});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            title: Center(
                child: Text(
              "CRUD OPERATION",
              style: TextStyle(),
            )),
          ),
          body: MyWidget(major1b: major1a)),
    );
  }
}

class MyWidget extends StatefulWidget {
  final String major1b;

  const MyWidget({super.key, required this.major1b});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var result;
  bool dataloaded = false;
  bool error = false;
  int n = 0;

  @override
  void initState() {
    _getData();
    // TODO: implement initState
    super.initState();
  }

  void _getData() {
    Future.delayed(Duration.zero, () async {
      var url = Uri.parse(
          "https://mediumsitompul.com/crud_restapi/read_all_clickable.php?auth=kjgdkhdfldfguttedfgr");
      var response = await http.post(url, body: {
        "search2": widget.major1b.toString(),
      });

      if (response.statusCode == 200) {
        setState(() {
          result = json.decode(response.body);

          print("result+++++++++++++++++++++++++++++++++++++++");
          print(result);

          dataloaded = true;
        });
      } else {
        setState(() {
          error = true;
        });
      }
    });
  }
//............................................................................

  //===================================================================================

  Widget datalist() {
    List<DataModel> namelist = List<DataModel>.from(result["data"].map((i) {
      return DataModel.fromJSON1(i);
    }));

    return ListView(
      children: [
        //+++++++HEADER ROW AFTER LIST VIEW ++++++++++++++++++++++++++++++++++++++++
        //..........................................................................
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Table(
            border: TableBorder.symmetric(
                inside: const BorderSide(width: 0, color: Colors.blue),
                outside: const BorderSide(width: 0)),
            columnWidths: const {
              0: FractionColumnWidth(0.1),
              1: FractionColumnWidth(0.3),
              2: FractionColumnWidth(0.3),
              3: FractionColumnWidth(0.3),
            },
            //..........................................................................
            children: const [
              TableRow(children: [
                Text(
                  "N0",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      backgroundColor: Colors.amber),
                ),
                Text(
                  "NAMA",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.amber,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "MAJOR",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.amber,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "PHONE",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      backgroundColor: Colors.amber),
                ),
              ])
            ],
          ),
        ),

        //+++++++ END HEADER ++++++++++++++++++++++++++++++++++++++++++++

        Table(
          border: TableBorder.symmetric(
              inside: const BorderSide(width: 0, color: Colors.blue),
              outside: const BorderSide(width: 0)),
          columnWidths: const {
            0: FractionColumnWidth(0.1),
            1: FractionColumnWidth(0.3),
            2: FractionColumnWidth(0.3),
            3: FractionColumnWidth(0.3),
          },

          //border: TableBorder.all(width: 1, color: Colors.black45), //YG INI JADI DI HAPUS
          children: namelist.map((dataModel) {
            n++;

            return TableRow(children: [
              //........................................................
              TableCell(
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(child: Text(n.toString())))),

              //.......................................................................
              TableCell(
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(dataModel.student_name1))))),
              //.........................................................................
              TableCell(
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(dataModel.major1))))),
              //.........................................................................

              TableCell(
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(dataModel.phone1))))),
              //.........................................................................
            ]);
          }).toList(),
        ),
      ],
    );
  }
  //===================================================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView(
      //   children: [
      //     Center(child: Text(widget.major1b)),
      //   ],
      // ),

      //.................................................................
      body: Container(
        padding: const EdgeInsets.all(15),
        child: dataloaded
            ? datalist()
            : const Center(child: CircularProgressIndicator()),
      ),
      //................................................................
      //................... floatingActionButton >>> IN SCAFFOLD() ................
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          print('Tombol Reffresh di pencettt');

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp(),
              ));
        }),
        tooltip: 'Reload data',
        child: const Icon(Icons.ac_unit),
        foregroundColor: Colors.white,
        backgroundColor: Colors.red,
      ),
      //...........................................................................
    );
  }
}
