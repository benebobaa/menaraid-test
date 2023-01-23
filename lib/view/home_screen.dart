import 'package:flutter/material.dart';
import 'package:flutter_menara_id/service/api.dart';
import 'package:flutter_menara_id/view/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _api = Api();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Contact'),
      ),
      body: FutureBuilder(
        future: _api.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final datas = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                final data = datas![index];
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(data.avatar!),
                  ),
                  title: Text(data.firstName!),
                  subtitle: Text(data.lastName!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          data: data,
                        ),
                      ),
                    );
                  },
                );
              },
              itemCount: datas?.length,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
