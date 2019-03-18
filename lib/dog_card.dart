import 'package:flutter/material.dart';
import 'package:flutter_dogs/dog_model.dart';

class DogCard extends StatefulWidget {
  final Dog dog;
  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {
  Dog dog;
  _DogCardState(this.dog);

  String renderUrl;

  @override
  void initState() {
    super.initState();
    renderDogPic();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 115,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 50,
              child: dogCard,
            ),
            Positioned(
              top: 7.5,
              child: dogImage,
            )
          ],
        ),
      ),
    );
  }

  Widget get dogImage {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(renderUrl ?? ''),
          )),
    );
  }

  Widget get dogCard {
    return Container(
      width: 299,
      height: 115,
      child: Card(
          color: Colors.black87,
          child: Padding(
            padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.dog.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                Text(
                  widget.dog.location,
                  style: Theme.of(context).textTheme.subhead,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    Text(': ${widget.dog.rating} / 10')
                  ],
                )
              ],
            ),
          )),
    );
  }

  void renderDogPic() async {
    await dog.getImageUrl();

    setState(() {
      renderUrl = dog.imageUrl;
    });
  }
}
