import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../core/controllers/home_ctrl.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _controller;

  const HomeScreen(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Pagination"),
        actions: [
          PopupMenuButton(
              initialValue: _controller.limit,
              onSelected: _controller.changeTotalPerPage,
              itemBuilder: (context) {
                return [
                  CheckedPopupMenuItem(
                    value: 15,
                    checked: _controller.limit == 15,
                    child: const Text("15 / pagination"),
                  ),
                  CheckedPopupMenuItem(
                    value: 25,
                    checked: _controller.limit == 25,
                    child: const Text("25 / pagination"),
                  ),
                  CheckedPopupMenuItem(
                    value: 50,
                    checked: _controller.limit == 50,
                    child: const Text("50 / pagination"),
                  )
                ];
              })
        ],
      ),
      body: Obx(
        () => LazyLoadScrollView(
          onEndOfPage: _controller.loadNextPage,
          isLoading: _controller.lastPage,
          child: ListView.builder(
            itemCount: _controller.users.length,
            itemBuilder: (context, index) {
              final user = _controller.users[index];
              return ListTile(
                leading: Image.network(user.avatar ?? ""),
                title: Text(user.name ?? "null"),
                subtitle: Text(user.id ?? "null"),
              );
            },
          ),
        ),
      ),
    );
  }
}
