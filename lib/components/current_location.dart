import 'package:flutter/material.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Vị trí của bạn'),
        content: const TextField(
          decoration: InputDecoration(hintText: 'Nhập vị trí...'),
        ),
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy', style: TextStyle(fontSize: 18),),
          ),
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.orange,
            child: const Text('Lưu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Giao hàng đến', style: TextStyle(color: Colors.grey.shade800, fontSize: 18),),
        GestureDetector(
          onTap: () => openLocationSearchBox(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('294, khu phố II', style: TextStyle(color: Colors.grey.shade800, fontSize: 18, fontWeight: FontWeight.w500)),
                const Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        )
      ],
    );
  }
}