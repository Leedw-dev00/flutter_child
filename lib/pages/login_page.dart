import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_page.dart';

class LoginPage extends StatelessWidget{
  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                  height: Get.height*0.5,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xFF55AC4B),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 60,),
                      Image.asset('assets/images/login_logo.png', width: Get.width*0.45, fit: BoxFit.fitWidth,),
                      SizedBox(height: 40.0),
                      SizedBox(
                        height: 50.0,
                        width: Get.width*0.75,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: '아이디를 입력해주세요',
                              hintStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(color: Colors.white, width: 0.0)
                              ),
                              filled: true,
                              fillColor: Colors.white
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      SizedBox(
                        height: 50.0,
                        width: Get.width*0.75,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: '비밀번호를 입력해주세요',
                              hintStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                  borderSide: BorderSide(color: Colors.red, width: 1.0)
                              ),
                              filled: true,
                              fillColor: Colors.white
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                              value: _isChecked,
                              onChanged: (bool? value){
                                _isChecked = true;
                              }
                          ),
                          Text('자동 로그인', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15.0),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40.0,),
                Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: Get.width*0.8,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: (){
                            Get.off(MainPage());
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Color(0xFF37912C), //background color of button
                              // side: BorderSide(width:3, color:Colors.brown), //border width and color
                              elevation: 3, //elevation of button
                              shape: RoundedRectangleBorder( //to set border radius to button
                                  borderRadius: BorderRadius.circular(30)
                              ),
                          ),
                          child: Text('로그인', style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),)
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('회원가입', style: TextStyle(color: Color(0xFF55AC4B)),),
                          Text('  |  ', style: TextStyle(color: Color(0xFF55AC4B)),),
                          Text('아이디 찾기', style: TextStyle(color: Color(0xFF55AC4B)),),
                          Text('  |  ', style: TextStyle(color: Color(0xFF55AC4B)),),
                          Text('비밀번호 찾기', style: TextStyle(color: Color(0xFF55AC4B)),),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}