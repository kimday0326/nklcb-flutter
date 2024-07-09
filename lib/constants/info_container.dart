import 'package:flutter/material.dart';

Widget infoContainer = Container(
  padding: const EdgeInsets.all(16.0),
  margin: const EdgeInsets.only(bottom: 20.0),
  decoration: BoxDecoration(
    border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(10.0),
  ),
  child: const Row(
    children: [
      Icon(
        Icons.info,
        color: Colors.black87,
        size: 20,
      ),
      SizedBox(width: 8.0),
      Expanded(
        child: Text(
          '이 자료는 어떠한 상업적 용도로도 이용되지 않으며, 오직 정보 제공 목적으로만 사용됩니다. 원문이 제공되지 않은 경우, 우측 상단 링크를 통해 원문을 확인하시기 바랍니다.',
          style: TextStyle(fontSize: 11.0, color: Colors.black87),
        ),
      ),
    ],
  ),
);
