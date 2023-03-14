import 'package:egemmmm/utils/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';
import 'package:egemmmm/objects/user.dart';
import 'package:egemmmm/pages/otherProfiles.dart';
class search extends StatefulWidget {

  const search ({Key key, this.analytics,this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Search createState() => Search();
}

class Search extends State<search> {
@override
  void initState() {
    super.initState();

    setCurrentScreen(widget.analytics, widget.observer, 'Search Page', 'SearchPageState');

  }
bool b = false;
  buildSearchField() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Form(
        child: TextFormField(
          decoration: InputDecoration(labelText: 'Search for a user...'),
          onChanged: (String value){
            if (value == ""){
              setState((

                  ) {
                b = false;
              });
            }
          },
          onFieldSubmitted: submit,
        ),
      ),
    );
  }
  String foto = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ634SZq9VUeLkzz1ipHQyT3a-GP9dfdh0479a_rnAKBIySBB4UBCzPZQvQ3yvE5E9wIGs&usqp=CAU";
  List<User1> users = [
    User1(username: 'keremc90',
        name: "Yaşar Kerem Cimilli",
        profilePic: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ634SZq9VUeLkzz1ipHQyT3a-GP9dfdh0479a_rnAKBIySBB4UBCzPZQvQ3yvE5E9wIGs&usqp=CAU")),
    User1(username: 'ekcmert', name: "Mert Ekici", profilePic: NetworkImage("https://www.sabanciuniv.edu/rehber/fotograflar/other/3547.jpg")),
    User1(username: 'okidoki',
        name: "Telemachus Son of Odysseus",
        profilePic: NetworkImage("https://0.academia-photos.com/4741022/2008224/36936848/s200_muhsin.yanar.jpg")),
    User1(username: 'egebe', name: "Egeberk YK", profilePic: NetworkImage("https://foto.haberler.com/haber/2019/07/12/ismail-yk-twitter-da-trend-topic-oldu-12236658_1188_amp.jpg")),

  ];

  ListView buildSearchResults(List<User1> users) {
    List<UserSearchItem> userSearchItems = [];

    users.forEach((User1 doc) {
      UserSearchItem searchItem = UserSearchItem(doc);
      userSearchItems.add(searchItem);
    });

    return ListView(
      children: userSearchItems,
    );
  }

  void submit(String searchValue) async {
    setState(() {
       b = true;
    });
  }

  Widget build(BuildContext context) {
    // reloads state when opened again
    return Scaffold(
        appBar: buildSearchField(),
        body: b == false

        ? SingleChildScrollView(
          child: Column( children:[Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),


                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),

                    Image(image: NetworkImage(foto),
                      width: 120,height: 120,
                    ),
                  ],
                ),




              ],
            ),
          ),]),
        )
        :  buildSearchResults(users));
  }
}


class UserSearchItem extends StatefulWidget {
  final User1 user;

  const UserSearchItem(this.user);

  @override
  _UserSearchItemState createState() => _UserSearchItemState();
}

class _UserSearchItemState extends State<UserSearchItem> {
  @override
  Widget build(BuildContext context) {
    TextStyle boldStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    return GestureDetector(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: widget.user.profilePic,
            backgroundColor: Colors.grey,
          ),
          title: Text(widget.user.username, style: boldStyle),
          subtitle: Text(widget.user.name),
        ),
        onTap: () => Navigator.pushNamed(context, "/otherProfile"),

    );
  }
}


