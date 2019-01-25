import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarView extends CustomPainter {
  Paint mHelpPaint;
  Paint mPaint;
  BuildContext context;

  StarView(this.context) {
    mHelpPaint = new Paint();
    mHelpPaint.style = PaintingStyle.stroke;
    mHelpPaint.color = Color(0xffBBC3C5);
    mHelpPaint.isAntiAlias = true;

    mPaint = new Paint();
    mPaint.style = PaintingStyle.fill;
    mPaint.color = Colors.red;
    mPaint.isAntiAlias = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    canvas.drawPath(gridPath(20, winSize), mHelpPaint);

    canvas.translate(0, 320);

    canvas.save(); //绘制n角星
    for (int i = 5; i < 10; i++) {
      canvas.translate(64, 0);
      canvas.drawPath(nStarPath(i, 30, 15), mPaint);
    }
    canvas.restore();

    canvas.translate(0, 70);
    canvas.save(); //绘制正n角星
    for (int i = 5; i < 10; i++) {
      canvas.translate(64, 0);
      canvas.drawPath(regularStarPath(i, 30), mPaint);
    }
    canvas.restore();

    canvas.translate(0, 70);
    canvas.save(); //绘制正n边形
    for (int i = 5; i < 10; i++) {
      canvas.translate(64, 0);
      canvas.drawPath(regularPath(i, 30), mPaint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  //绘制网格路径
  Path gridPath(int step, Size winSize) {
    Path path = new Path();

    for (int i = 0; i < winSize.height / step + 1; i++) {
      path.moveTo(0, step * i.toDouble());
      path.lineTo(winSize.width, step * i.toDouble());
    }

    for (int i = 0; i < winSize.width / step + 1; i++) {
      path.moveTo(step * i.toDouble(), 0);
      path.lineTo(step * i.toDouble(), winSize.height);
    }
    return path;
  }

  //绘制坐标系
  void drawCoo(Canvas canvas, Size coo, Size winSize) {
    //初始化网格画笔
    Paint paint = new Paint();
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    //绘制直线
    canvas.drawPath(cooPath(coo, winSize), paint);
    //左箭头
    canvas.drawLine(new Offset(winSize.width, coo.height), new Offset(winSize.width - 10, coo.height - 6), paint);
    canvas.drawLine(new Offset(winSize.width, coo.height), new Offset(winSize.width - 10, coo.height + 6), paint);
    //下箭头
    canvas.drawLine(new Offset(coo.width, winSize.height - 90), new Offset(coo.width - 6, winSize.height - 10 - 90), paint);
    canvas.drawLine(new Offset(coo.width, winSize.height - 90), new Offset(coo.width + 6, winSize.height - 10 - 90), paint);
  }

  Path cooPath(Size coo, Size winSize) {
    Path path = new Path();
    //x正半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(winSize.width, coo.height);
    //x负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width - winSize.width, coo.height);
    //y负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, coo.height - winSize.height);
    //y负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, winSize.height);
    return path;
  }

  Path nStarPath(int num, double R, double r) {
    Path path = new Path();
    double perDeg = 360 / num; //尖角的度数
    double degA = perDeg / 2 / 2;
    double degB = 360 / (num - 1) / 2 - degA / 2 + degA;

    path.moveTo(cos(rad(degA)) * R, (-sin(rad(degA)) * R));
    for (int i = 0; i < num; i++) {
      path.lineTo(cos(rad(degA + perDeg * i)) * R, -sin(rad(degA + perDeg * i)) * R);
      path.lineTo(cos(rad(degB + perDeg * i)) * r, -sin(rad(degB + perDeg * i)) * r);
    }
    path.close();
    return path;
  }

  double rad(double deg) {
    return deg * pi / 180;
  }

  Path regularStarPath(int num, double R) {
    double degA, degB;
    if (num % 2 == 1) {
      //奇数和偶数角区别对待
      degA = 360 / num / 2 / 2;
      degB = 180 - degA - 360 / num / 2;
    } else {
      degA = 360 / num / 2;
      degB = 180 - degA - 360 / num / 2;
    }
    double r = R * sin(rad(degA)) / sin(rad(degB));
    return nStarPath(num, R, r);
  }

  Path regularPath(int num, double R) {
    double r = R * cos(rad(360 / num / 2));
    return nStarPath(num, R, r);
  }
}
