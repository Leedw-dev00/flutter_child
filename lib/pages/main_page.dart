import 'package:flutter/material.dart';
import 'package:flutter_child/pages/result_page.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';
import 'package:async/async.dart';


onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
}

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{

  String _message = "";
  final telephony = Telephony.instance;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  onMessage(SmsMessage message) async {
    setState(() {
      _message = message.body ?? "Error reading message body.";
    });
  }

  onSendStatus(SendStatus status) {
    setState(() {
      _message = status == SendStatus.SENT ? "sent" : "delivered";
    });
  }


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF55AC4B),
        centerTitle: true,
        title: Image.asset('assets/images/login_logo.png', width: 130.0,),
        actions: [
          Builder(
            builder: (BuildContext context){
              return GestureDetector(
                onTap: (){
                  Scaffold.of(context).openEndDrawer();
                },
                child: Image.asset('assets/images/ham.png'),
              );
            }
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 35.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: Get.height*0.05,),
              Container(
                width: Get.width,
                height: 350.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30.0,),
                    Image.asset('assets/images/heart.png', width: 300.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('88%', style: TextStyle(color: Color(0xFF37912C), fontSize: 18.0, fontWeight: FontWeight.w500),),
                        SizedBox(width: 20.0,)
                      ],
                    ),
                    SizedBox(height: 3.0,)
                  ],
                )
              ),
              SizedBox(height: Get.height*0.02,),
              Text('당신은 사랑 받기 위해 태어난 사람', style: TextStyle(color: Color(0xFF1D4617), fontSize: 21.0, fontWeight: FontWeight.bold),),
              Text('(집단 지성 사람들은 당신을 사랑합니다)', style: TextStyle(color: Color(0xFF3E7336), fontSize: 15.0, fontWeight: FontWeight.w500),),
              SizedBox(height: Get.height*0.05,),
              SizedBox(
                width: Get.width,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () async {
                      await telephony.openDialer(
                          "1566-2231"
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF37912C), //background color of button
                      // side: BorderSide(width:3, color:Colors.brown), //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(30)
                      ),
                    ),
                    child: Text('상담하기', style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),)
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF55AC4B)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: Get.height*0.02,),
                  Image.asset('assets/images/login_logo.png', width: Get.width*0.33,),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 25.0,
                      child: ElevatedButton(
                          onPressed: (){
                            print('로그아웃');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF276D2C), //background color of button
                            // side: BorderSide(width:3, color:Colors.brown), //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder( //to set border radius to button
                                borderRadius: BorderRadius.circular(30)
                            ),
                          ),
                          child: Text('로그아웃', style: TextStyle(color: Colors.white, fontSize: 12.0,),)
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,)
                ],
              )
            ),
            Card(
              elevation: 0.0,
              child: Column(
                  children: <Widget>[
                    Container(
                      width: Get.width*0.6,
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Color(0xFF276D2C)),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0))
                      ),
                      child: ListTile(
                        title: Text('Home', style: TextStyle(color: Color(0xFF276D2C), fontWeight: FontWeight.bold, fontSize: 15.0),),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Color(0xFF276D2C),),
                        onTap: (){
                          Get.off(MainPage());
                        },
                      ),
                    ),
                    Container(
                      width: Get.width*0.6,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Color(0xFF276D2C)),

                      ),
                      child: ListTile(
                        title: Text('결과보기', style: TextStyle(color: Color(0xFF276D2C), fontWeight: FontWeight.bold, fontSize: 15.0),),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Color(0xFF276D2C),),
                        onTap: (){
                          Get.off(ResultPage());
                        },
                      ),
                    ),
                    Container(
                      width: Get.width*0.6,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Color(0xFF276D2C)),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0))
                      ),
                      child: ListTile(
                        title: Text('설정', style: TextStyle(color: Color(0xFF276D2C), fontWeight: FontWeight.bold, fontSize: 15.0),),
                        trailing: Icon(Icons.keyboard_arrow_right, color: Color(0xFF276D2C),),
                        onTap: (){print('설정');},
                      ),
                    ),
                  ],
                )
              ),
          ],
        ),
      ),
    );
  }
}