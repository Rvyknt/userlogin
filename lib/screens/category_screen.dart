import 'package:flutter/material.dart';
import 'package:userlogin/widgtes/custom_app_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: CustomAppBar(
          title: 'Category',
        ),
      ),
      body: Center(
        child: Text('Category page'),
      ),
    );
  }
}
