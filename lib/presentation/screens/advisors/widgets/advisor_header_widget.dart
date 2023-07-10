import 'package:flutter/material.dart';
import 'package:schools/core/utils/resorces/image_path.dart';

class AdvisorHeaderWidget extends StatelessWidget {
  final String studentName;
  final String studentImage;

  const AdvisorHeaderWidget({
    Key? key,
    required this.studentName,
    required this.studentImage,
  }) : super(key: key);

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
          ClipOval(
            child: Image.network(
              studentImage,
              width: 45,
              height: 45,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(ImagesPath.advisorPlaceHolder);
              },
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            studentName,
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
