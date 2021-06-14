import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  late List<MaskedTextController> list;

  @override
  void initState() {
    list = <MaskedTextController>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: textWidget('Test'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  itemCount: 20,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return textWidget('count $index');
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'List Here',
                  style: TextStyle(fontSize: 26),
                ),
              ),
              ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    list.add(MaskedTextController(mask: '*', text: '$index'));
                    return Column(
                      children: [
                        Text('field $index'),
                        Container(
                          height: 50,
                          width: 300,
                          child: TextField(
                            controller: list[index],
                          ),
                        ),
                      ],
                    );
                  })
            ],
          ),
        ));
  }
}

Widget textWidget(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 12.0),
    child: Text(text),
  );
}
