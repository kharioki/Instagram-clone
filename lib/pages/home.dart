import 'package:flutter/material.dart';
import 'package:instagramclone/models/global.dart';
import 'package:instagramclone/models/post.dart';
import 'package:instagramclone/models/user.dart';
import 'package:instagramclone/models/comment.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 80,
                child: getStories(),
              ),
              Column(
                children: getPosts(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getStories() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: getUserStories(),
    );
  }

  List<Widget> getUserStories() {
    List<Widget> stories = [];
    for (User follower in user.following) {
      stories.add(getStory(follower));
    }

    return stories;
  }

  Widget getStory(User follower) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Stack(
              alignment: Alignment(0, 0),
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundColor:
                        follower.hasStory ? Colors.red : Colors.grey,
                  ),
                ),
                Container(
                  height: 47,
                  width: 47,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  child: CircleAvatar(
                    backgroundImage: follower.profilePicture,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> getPosts() {
    List<Widget> posts = [];
    for (Post post in userPosts) {
      posts.add(getPost(post));
    }

    return posts;
  }

  Widget getPost(Post post) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundImage: post.user.profilePicture,
                      ),
                    ),
                    Text(
                      post.user.username,
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 285),
            decoration: BoxDecoration(
              image: DecorationImage(image: post.image),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        size: 30,
                        color: post.isLiked ? Colors.red : Colors.black,
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        color: post.isLiked ? Colors.red : Colors.white,
                        onPressed: () {
                          setState(() {
                            userPosts[0].isLiked = post.isLiked ? false : true;
                            if (!post.isLiked) {
                              post.likes.remove(user);
                            } else {
                              post.likes.add(user);
                            }
                          });
                        },
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(
                        Icons.mode_comment,
                        size: 30,
                        color: Colors.black,
                      ),
                      IconButton(
                        icon: Icon(Icons.mode_comment),
                        color: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Icon(
                        Icons.send,
                        size: 30,
                        color: Colors.black,
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        color: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
              Stack(
                alignment: Alignment(0, 0),
                children: <Widget>[
                  Icon(
                    Icons.bookmark,
                    size: 30,
                    color: post.isSaved ? Colors.black : Colors.black,
                  ),
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    color: post.isSaved ? Colors.black : Colors.white,
                    onPressed: () {
                      setState(() {
                        userPosts[0].isSaved = post.isSaved ? false : true;
                        if (!post.isSaved) {
                          user.savedPosts.remove(post);
                        } else {
                          user.savedPosts.add(post);
                        }
                      });
                    },
                  )
                ],
              ),
            ],
          ),
          FlatButton(
            child: Text(post.likes.length.toString() + ' likes'),
            onPressed: () {},
          ),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 10),
                child: Text(post.user.username),
              ),
              Text(post.description)
            ],
          ),
          FlatButton(
            child: Text(
                'view all ' + post.comments.length.toString() + ' comments'),
          )
        ],
      ),
    );
  }
}
