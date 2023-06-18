import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/image_path.dart';

class AdvisorHeaderWidget extends StatelessWidget {
  const AdvisorHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 75,
      color: const Color.fromRGBO(59, 187, 172, 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(
                    ImagesPath.advisorPlaceHolder,
                  ),
                  fit: BoxFit.fill),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const Text(
            "Name of Student",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 0.14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
