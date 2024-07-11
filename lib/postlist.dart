import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'post.dart';
class Postlist extends StatefulWidget {
  final List<Post> listItems;
  final FirebaseUser user;
  Postlist(this.listItems, this.user);
  @override
  _PostlistState createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  void like(Function callBack){
    this.setState(() {
      callBack();
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.widget.listItems.length,
      itemBuilder: (context,index){
        var post = this.widget.listItems[index];
        return Card(child: Row(children: <Widget>[
          Expanded(child: ListTile(title: 
          Text(post.body),
          subtitle: Text(post.author)
          ,)),
          Row(children:<Widget>[
            Container(child: Text(post.usersliked.length.toString(), style: TextStyle(fontSize:20)),
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),),
            IconButton(icon: Icon(Icons.thumb_up), 
            onPressed: ()=> this.like(post.likePost),
            color:post.usersliked.contains(widget.user.uid) ? Colors.green: Colors.black)] ,)]
            ));
      },
      
    );
  }
}