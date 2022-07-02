import 'package:amugeona/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _TopPart(
            onHeartPressed: onHeartPressed,
            onPicturePressed: onPicturePressed,
            onDatePressed: onDatePressed,
          ),
          _MainPicture(),
        ],
      ),
    );
  }

  void onHeartPressed() {}

  void onPicturePressed() {}

  void onDatePressed() {}
}

class _MainPicture extends StatelessWidget {
  const _MainPicture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Image.asset('asset/img/middle_image.png'),
    );
  }
}

class _TopPart extends StatelessWidget {
  final VoidCallback onDatePressed;
  final VoidCallback onPicturePressed;
  final VoidCallback onHeartPressed;

  const _TopPart({
    required this.onPicturePressed,
    required this.onDatePressed,
    required this.onHeartPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          renderIconButton(
            onPressed: onHeartPressed,
            iconData: Icons.favorite,
          ),
          Row(
            children: [
              renderIconButton(
                onPressed: onDatePressed,
                iconData: Icons.calendar_month,
              ),
              renderIconButton(
                onPressed: onPicturePressed,
                iconData: Icons.photo,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget renderIconButton({
    required VoidCallback onPressed,
    required IconData iconData,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: IconButton(
        iconSize: 32.0,
        color: PRIMARY_COLOR,
        onPressed: onPressed,
        icon: Icon(iconData),
      ),
    );
  }
}
