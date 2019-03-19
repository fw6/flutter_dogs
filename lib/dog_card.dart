import 'package:flutter/material.dart';
import 'package:flutter_dogs/dog_model.dart';
import 'package:flutter_dogs/dog_detail_page.dart';

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
    return InkWell(
      onTap: showDogDetailPage,
      child: Padding(
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
      ),
    );
  }

  Widget get dogImage {
    Widget dogAvatar = Hero(
      tag: dog,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(renderUrl ?? ''),
            )),
      ),
    );

    Widget placeholder = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black54, Colors.black, Colors.blueGrey[600]]),
      ),
      alignment: Alignment.center,
      child: Text(
        'DOGGO',
        textAlign: TextAlign.center,
      ),
    );

    return AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 1000),
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

  void showDogDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DogDetailPage(dog),
    ));
  }
}
