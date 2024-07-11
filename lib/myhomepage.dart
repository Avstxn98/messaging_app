import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genesis/database.dart';
import 'textin.dart';
import 'postlist.dart';
import 'post.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  MyHomePage(this.user);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts=[];
  void newPost(String text){
    var post = new Post(text, widget.user.displayName);
    
    post.setId(savePost(post));
    this.setState(() {
      
      posts.add(post);
    });
  }
  void updateMessages(){
    getAllposts().then((posts) => {
      this.setState({
        this.posts = posts
      })
    });
  }
  @override
  void initState(){ 
    super.initState();
    updatePost();
  }

  @override 
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(title: Text("Welcome")),
       body: Column(children:<Widget>[
         
         Expanded(child: Postlist(this.posts, widget.user)),
         Expanded(child:TIn(this.newPost )),])
       );
       }
}
