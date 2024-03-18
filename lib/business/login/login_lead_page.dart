import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/cpn/app_bar.dart';
import '../../theme/color_palettes.dart';

class LoginLeadPage extends StatelessWidget {
  const LoginLeadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/login_lead_page.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/ic_lead_login_gradient.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                      children: [ Text(
                        'Welcome to Pamigo',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF0F1010),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        Text(
                          'Connecting life and pets',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF0F1010),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ]
                  ),
                )
            ),
            Positioned(
              bottom: 80.w,
              left: 120.w,
              right: 120.w,
              child: _signInButton(), //_signInButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return Container(
        width: double.infinity,
        height: 112.w,
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 48.w, right: 24.w),
        decoration: BoxDecoration(
            color: Colors.white, //ColorPalettes.instance.primary,
            borderRadius: BorderRadius.circular(56.w)),
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: Text("Sign in",
                  style: TextStyle(
                      color: const Color(0xFF0F1010),
                      fontSize: 32.w,
                      fontWeight: FontWeight.w600)),
            ),
            onTap: () {
              print("click me");
            }
        )
    );
  }

}