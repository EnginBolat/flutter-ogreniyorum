import 'package:flutter/material.dart';
import 'package:note_app/widget/not_ekle.dart';

class NotEkleButton extends StatelessWidget {
  const NotEkleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.add,
      ),
      onPressed: () => _dersEkle(context),
      foregroundColor: Colors.white,
    );
  }
}

void _dersEkle(BuildContext ctx) {
  showModalBottomSheet(
      // enableDrag: true,
      // isScrollControlled: true,
      context: ctx,
      builder: (bCtx) {
        return const NotEkle();
      });
}
