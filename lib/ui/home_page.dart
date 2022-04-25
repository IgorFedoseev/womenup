import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/view_model.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: viewModel.onPressedBackButton,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: viewModel.onPressedRefreshButton,
          ),
        ],
      ),
      body: SafeArea(
        child: viewModel.webView(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        onPressed: viewModel.onPressedAddButton,
      ),
    );
  }
}
