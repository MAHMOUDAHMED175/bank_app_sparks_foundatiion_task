
import 'package:fiels/models/bank_info.dart';
import 'package:fiels/utils/database_helper.dart';
import 'package:flutter/material.dart';

class BalanceDetail extends StatefulWidget{

  final BankInfo _bankInfo;
  BalanceDetail(this._bankInfo);

  @override
  State<StatefulWidget> createState() {
    return BalanceDetailState(this._bankInfo);
  }
}

class BalanceDetailState extends State<BalanceDetail>{

  BankHelper helper = BankHelper();
  BankInfo _bankInfo;

  BalanceDetailState(this._bankInfo);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("Balance Detail"),
      centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: Column(
              children: [
                Center(
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.person, size: 200,
                  color: Colors.deepPurpleAccent,),
                  radius: 120,
                ),),
                Spacer(flex: 1,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name : "+_bankInfo.fullName!,
                  style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                    SizedBox(height: 16,),
                    Text("Mobile : (+20)"+_bankInfo.mobile.toString(),
                        style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                    SizedBox(height: 16,),
                    Text("Email : "+_bankInfo.email!,
                        style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                    SizedBox(height: 16,),
                    Text("Account Number : "+_bankInfo.accountNum.toString(),
                        style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                    SizedBox(height: 16,),
                    Text("IFSC code : "+_bankInfo.ifsc.toString(),
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                    SizedBox(height: 16,),
                    Text("Current Balance : "+_bankInfo.balance.toString(),
                      style: TextStyle(fontSize: 20, fontStyle: FontStyle.normal),),
                    SizedBox(height: 16,),
                  ],
                ),
                Spacer(flex: 2,)
              ],
          ),
        ),
    );
  }
}
