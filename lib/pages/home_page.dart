import 'package:flutter/material.dart';
import 'package:minimal_social_app/database/firestore.dart';
import 'package:minimal_social_app/helper/helper_functions.dart';
import 'package:minimal_social_app/widgets/my_drawer.dart';
import 'package:minimal_social_app/widgets/my_post_button.dart';
import 'package:minimal_social_app/widgets/my_textfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final newPostController = TextEditingController();

  final FirestoreDatabase db = FirestoreDatabase();

  void postMessage() {
    // check message if it have content -> post
    if (newPostController.text.isNotEmpty) {
      db.addPost(newPostController.text.trim());
    }

    // clear controller after posting
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WALL'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.onBackground,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // text field for user to type
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    hintText: 'Say something...',
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),
                const SizedBox(width: 12),
                MyPostButton(onTap: postMessage),
              ],
            ),

            const SizedBox(height: 24),

            // posts
            StreamBuilder(
              stream: db.getPostsStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Some thing went wrong...'),
                  );
                }

                final posts = snapshot.data!.docs;

                if (snapshot.data == null || posts.isEmpty) {
                  return const Center(
                    child: Text('NO POSTS ...POST SOMETHING, BRO!!!'),
                  );
                }

                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, index) {
                      final post = posts[index];

                      return ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.article,
                            size: 24,
                          ),
                        ),
                        title: Text(post['PostMessage']),
                        subtitle: Text(
                          post['UserEmail'],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
