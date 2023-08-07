import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Myfield extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String titleText;
  const Myfield({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.titleText,
  });

  @override
  State<Myfield> createState() => _MyfieldState();
}

class _MyfieldState extends State<Myfield> {
  int fieldLenght = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.035,
          width: size.width * 0.4,
          child: AutoSizeText(
            widget.titleText,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
        SizedBox(
          height: size.height * 0.006,
        ),
        fieldLenght < 1 && fieldLenght != 999
            ? AutoSizeText(
                "please ${widget.hintText}",
                style: TextStyle(
                    color: Colors.red[900], fontWeight: FontWeight.bold),
              )
            : const SizedBox(),
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          width: size.width,
          height: size.height * 0.065,
          padding: EdgeInsets.only(
            left: size.width * 0.03,
          ),
          decoration: BoxDecoration(
              color: Colors.blueGrey[800],
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 0), blurRadius: 7)
              ],
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: TextField(
            controller: widget.textEditingController,
            onChanged: (value) {
              fieldLenght = value.length;
              setState(() {});
            },
            cursorColor: Colors.blue[50],
            style: TextStyle(
              color: Colors.blue[50],
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.titleText,
                hintStyle: TextStyle(
                  letterSpacing: 2,
                  fontSize: 15,
                  color: Colors.blue[50],
                )),
          ),
        ),
      ],
    );
  }
}
