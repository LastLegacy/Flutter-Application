import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MemoriesGallery.dart';

class PastEventCard extends StatelessWidget{

  final Widget newRoute;
  final String title;

  PastEventCard({this.newRoute, this.title});


  List<String> getFirstThree(List<String> liste){
    Iterable<String> threeList = liste.getRange(0, 3);
    threeList.join(', ');
    return threeList.toList();
  }

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 160,
      width: 200,
      child: Card(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => this.newRoute),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3,1.0],
                colors: [
                  Colors.indigoAccent,
                  Colors.redAccent
                ]
              ),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20,10,20,0),
              child: Column(
                children: [
                  Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "Raleway"
                    ),
                  ),
                  Divider(
                    color: Color.fromRGBO(6,47,103,300),
                    thickness: 1,
                  ),
                  GridView.count(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4/3,
                    children: getFirstThree(MemoriesGallery.staticimages).map((e) => Card(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(e),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      elevation: 6,
                      color: Colors.transparent,
                    )).toList()
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}

/*
* _images.map((e) => Card(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(e),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        elevation: 6,
                        color: Colors.transparent,
                      )).toList()
*
*
*
* */