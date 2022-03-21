import 'package:flutter/material.dart';
import 'pictures.dart';

class AddPic extends StatefulWidget {
  var pic;

  AddPic({Key? key, this.pic}) : super(key: key);

  @override
  State<AddPic> createState() => _AddPicState();
}

class _AddPicState extends State<AddPic> {
  final _formKey = GlobalKey<FormState>();
  @override
  var trash;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Post"),
        ),
        body: Center(
            child: Form(
                key: _formKey,
                child: Column(children: [
                  Image.file(
                    widget.pic,
                    height: 300,
                    width: 300,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Enter the amount of waste in the picture"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      trash = value;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Pictures post =
                            Pictures(picture: widget.pic, numberOfItems: trash);
                        post.sendData();
                        Navigator.pop(context);
                      }
                    },
                    child: const Icon(Icons.upload),
                  ),
                ]))));
  }
}
