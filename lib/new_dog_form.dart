import 'package:flutter/material.dart';
import 'package:flutter_dogs/dog_model.dart';

class AddDogFormPage extends StatefulWidget {
  @override
  _AddDogFormPageState createState() => _AddDogFormPageState();
}

class _AddDogFormPageState extends State<AddDogFormPage> {
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _locationEditingController = TextEditingController();
  TextEditingController _descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new Dog'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black54,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _nameEditingController,
                  // onChanged: (v) {
                  //   _nameEditingController.text = v;
                  // },
                  decoration: InputDecoration(
                    labelText: 'Name the Pup',
                  ),
                  textInputAction: TextInputAction.next,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _locationEditingController,
                  // onChanged: (v) => _locationEditingController.text = v,
                  decoration: InputDecoration(labelText: 'Pup\'s location'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: _descriptionEditingController,
                  // onChanged: (v) => _descriptionEditingController.text = v,
                  decoration: InputDecoration(
                    labelText: 'All about the pup',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Builder(
                  builder: (context) => RaisedButton(
                        onPressed: () => submitPup(context),
                        color: Colors.indigoAccent,
                        child: Text('Submit Pup'),
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitPup(BuildContext context) {
    if (_nameEditingController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Pups need names!'),
      ));
    } else {
      var newDog = Dog(_nameEditingController.text,
          _locationEditingController.text, _descriptionEditingController.text);

      Navigator.of(context).pop(newDog);
    }
  }
}
