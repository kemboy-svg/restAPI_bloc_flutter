import 'package:flutter/material.dart';
import 'package:restapi_bloc/bloc/user_bloc.dart';
import 'package:restapi_bloc/models/user_model.dart';
import 'package:restapi_bloc/repos/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => UserRepository(),
        child: home(),
      ),
    );
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bloc"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoaded) {
              List<UserModel> userList = state.users;
              print(userList);
               ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (_, index) {
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].FirstName,
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          userList[index].LastName,
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                        trailing: CircleAvatar(backgroundImage: NetworkImage(userList[index].Avator),),
                      ),
                    );
                  });
            }
             
            if (state is UserError){
              return Center(child: Text("An error occured while fetching"));
            }
            
          else{
             return Center(child: Text("Please wait as I debug"));
          }
          },
        ),
      ),
    );
  }
}
