import 'package:flutter/material.dart';
import 'dog_card.dart';
import 'dog_model.dart';

class DogList extends StatelessWidget {
  final List<Dog> doggos;
  DogList(this.doggos);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: doggos.length,
      itemBuilder: (BuildContext context, int index) {
        return DogCard(doggos[index]);
      },
    );
  }
}
