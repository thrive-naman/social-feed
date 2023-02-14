import 'package:flutter/material.dart';
import '../../view/profile/profile_viewmodel.dart';

class SpotifyProfileView extends StatelessWidget {
  const SpotifyProfileView({Key? key, this.mediaUrlList}) : super(key: key);

  final List<String>? mediaUrlList;

  Widget buildGridView() {
    List<Widget> widgets = mediaUrlList!
        .map(
          (e) => Padding(
            padding: const EdgeInsets.all(1),
            child: Image.network(e),
          ),
        )
        .toList();
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ProfileViewmodel.logout,
        label: Text('Logout'),
        icon: Icon(Icons.logout),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 2), child: buildGridView()),
        ],
      ),
    );
  }
}
