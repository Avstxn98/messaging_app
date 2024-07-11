
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:genesis/database.dart';

class Post{
  String body;
  String author;
  Set usersliked = {};
  DatabaseReference _id;
  
  Post(this.body,this.author);

  void likePost(FirebaseUser user){
    
    if(this.usersliked.contains(user.uid)){
      this.usersliked.remove(user.uid);
    }else {
      this.usersliked.add(user.uid);
    }
    this.update();
  }
  void update(){
    updatePost(this, this._id);
  }

  void setId(DatabaseReference id){
    this._id = id;
  }
  Map<String, dynamic> toJson(){
    return {
      'author': this.author,
      'usersliked': this.usersliked,
      'body': this.body
    };
  }
  
}

Post createPost(record){
  Map<String, dynamic> attributes = {
    'author': '',
    'usersliked':[],
    'body':''
  };
  record.forEach((key, value) => {attributes[key] = value});

  Post posts = new Post(attributes['body'], attributes['author']);
  posts.usersliked = new Set.from(attributes['usersliked']);
  
  return posts;

}
