import 'package:blood_bank/core/api/dio_consumer.dart';
import 'package:blood_bank/core/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'widgets/home_view_body.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Out'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, AppRoutes.login),
          ),
        ],
      ),
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DioConsumer(dio: Dio()).post(
            "/api/v1/donors",
            isFormData: true,
            data: {
              "name": "test",
              "email": "test",
              "password": "test",
              "phone": "test",
              "bloodType": "test",
              "address": "test",
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
