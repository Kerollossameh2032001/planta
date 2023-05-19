import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String socialMediaName;
  final void Function()? onPressed;
  final Widget socialMediaLogo;
  final Color color;

  const CustomSocialButton({
    Key? key,
    required this.socialMediaName,
    this.onPressed,
    required this.socialMediaLogo,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width*0.8938,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(color),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              socialMediaLogo,
              const SizedBox(width: 10),
              Text(
                socialMediaName,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}