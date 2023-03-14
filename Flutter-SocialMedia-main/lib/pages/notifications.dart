import 'package:egemmmm/services/auth.dart';
import 'package:egemmmm/utils/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:egemmmm/utils/colors.dart';
import 'package:egemmmm/utils/style.dart';

class notifications extends StatefulWidget {

  const notifications ({Key key, this.analytics,this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  Notifications createState() => Notifications();
}

class Notifications extends State<notifications> {

  String _message = "";
final AuthService _auth = AuthService();
  void setMessage(String msg) {
    setState(() {
      _message = msg;
    });
  }

  @override
  void initState() {
    super.initState();

    setCurrentScreen(widget.analytics, widget.observer, 'Notif Page', 'NotifPageState');

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Appcolors.primary,
        title: Text("Notifications",
            style: appbarText
        ),
        actions: <Widget>[
        TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout'),
          ),]
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://i.stack.imgur.com/34AD2.jpg"),
                ),
                title: Text("Emre replied: Good one"),
                subtitle: Text("about an hour ago"),
                trailing: Container(
                  height: 50.0,
                  width: 50.0,
                  child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://adtechresources.com/wp-content/uploads/2020/02/Mobile-Application.jpeg"),
                          ),
                        ),
                      ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://d.kuzeyekspres.com.tr/news/147564.jpg"),
                ),
                title: Text("Elon Musk liked your photo"),
                subtitle: Text("3 hours ago"),
                trailing: Container(
                  height: 50.0,
                  width: 50.0,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://adtechresources.com/wp-content/uploads/2020/02/Mobile-Application.jpeg"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://i.pinimg.com/originals/e9/cd/31/e9cd31722ea5ace23ae18cb3d8a549c8.jpg"),
                ),
                title: Text("Tommy liked your comment: Congrats on the win"),
                subtitle: Text("3 hours ago"),
                trailing: Container(
                  height: 50.0,
                  width: 50.0,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://www.weekendnotes.com/im/008/01/spain-celebrate-winning-the-2010-fifa-world-cup1.jpg"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://i.pinimg.com/originals/e9/cd/31/e9cd31722ea5ace23ae18cb3d8a549c8.jpg"),
                ),
                title: Text("Tommy, Greg, Arnold and 87 others liked your photo"),
                subtitle: Text("3 hours ago"),
                trailing: Container(
                  height: 50.0,
                  width: 50.0,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://static.standard.co.uk/s3fs-public/thumbnails/image/2017/04/05/18/me-and-my-dog-5.jpg?width=1200"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://cdn.britannica.com/11/222411-050-D3D66895/American-politician-actor-athlete-Arnold-Schwarzenegger-2016.jpg"),
                ),
                title: Text("Arnold S. started following you"),
                subtitle: Text("7 hours ago"),
                trailing: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                  ),
                  child: Text("Follow",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage("https://static01.nyt.com/images/2020/05/16/business/16JORDAN-01sub/16JORDAN-01sub-superJumbo.jpg"),
                  ),
                  title: Text("Michael J. started following you"),
                  subtitle: Text("1 day ago"),
                  trailing: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    child: Text("Following",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://i.pinimg.com/736x/2d/06/d0/2d06d0861bcfb437c8d072b0fc06a648.jpg"),
                ),
                title: Text("Esra commented: This picture right here... you need to frame this"),
                subtitle: Text("1 week ago"),
                trailing: Container(
                  height: 50.0,
                  width: 50.0,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://static.standard.co.uk/s3fs-public/thumbnails/image/2017/04/05/18/me-and-my-dog-5.jpg?width=1200"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Container(
              color: Colors.white,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage("https://i.pinimg.com/originals/64/d5/50/64d550a22af527c499a72c3e1bdc59b8.jpg"),
                ),
                title: Text("stephanie tagged you in a post."),
                subtitle: Text("3 weeks ago"),
                trailing: Container(
                  height: 50.0,
                  width: 50.0,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://i.pinimg.com/originals/43/fd/3c/43fd3c3f5f24477758fcdefc07bd8fbd.jpg"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}