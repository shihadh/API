import 'package:cart/constant/text_constents.dart';
import 'package:cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<CartController>(context,listen: false).fetchadata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CartController>(
          builder: (context, value, child) {
            if (value.error != null) {
            return Center(child: Text("Error: ${value.error}"));
          }
          if (value.datas.isEmpty) {
            return Center(
              child: Text(TextConstents.noData),
            );
                }
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: value.datas.length,
                  itemBuilder: (context, index) {
                final item = value.datas[index];
                return ListTile(
                  leading: Image.network(
                    item.thumbnail ?? TextConstents.noData,
                    width: 50,
                    height: 50,
                    errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
                  ),
                  title: Text(item.title ?? TextConstents.noData),
                  subtitle: Text("Price: ₹${item.prize} | Qty: ${item.qaundity}"),
                  trailing: Text("Total: ₹${item.total}"),
                );
                            },
                  ),
              )
            ],
          );
          },
        ),
      ),
    );
  }
}