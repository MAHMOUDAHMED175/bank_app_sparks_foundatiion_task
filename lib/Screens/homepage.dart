import 'package:flutter/material.dart';

import 'Add_Customer/add_user.dart';
import 'Balance_Check/bank_list.dart';
import 'Transfer_Balance/trans_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Commercial Bank"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          //Spacer(flex: 2,),
          SizedBox(
              height: 200,
              width: double.infinity,
              child: Icon(Icons.monetization_on_outlined,size: 200,color: Colors.orange,)),
          Spacer(
            flex: 1,
          ),
          Text(
            "Welcome to our online banking system",
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          Spacer(
            flex: 1,
          ),
          Text(
            "This app is used only transfer of money between multiple customers and check balance.",
            textAlign: TextAlign.center,
          ),
          Spacer(
            flex: 1,
          ),
          Card(
            child: InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddUser())),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 20.0),
                        blurRadius: 30.0,
                        color: Colors.black12,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 110.0,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    child: Text(
                      "Add Customers",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22.0),
                            topLeft: Radius.circular(22.0),
                            bottomRight: Radius.circular(200.0))),
                  ),
                  Icon(
                    Icons.add_box,
                    size: 30.0,
                  )
                ]),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Card(
            child: InkWell(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BankList())),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 20.0),
                        blurRadius: 30.0,
                        color: Colors.black12,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 110.0,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    child: Text(
                      "Balance Check",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22.0),
                            topLeft: Radius.circular(22.0),
                            bottomRight: Radius.circular(200.0))),
                  ),
                  Icon(
                    Icons.account_balance,
                    size: 30.0,
                  )
                ]),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Card(
            child: InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TransList())),
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0.0, 20.0),
                        blurRadius: 30.0,
                        color: Colors.black12,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.0)),
                child: Row(children: <Widget>[
                  Container(
                    height: 50.0,
                    width: 110.0,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                    child: Text("Transaction Balance",
                        style: Theme.of(context).textTheme.bodySmall),
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(22.0),
                            topLeft: Radius.circular(22.0),
                            bottomRight: Radius.circular(200.0))),
                  ),
                  Icon(
                    Icons.double_arrow_sharp,
                    size: 30.0,
                  )
                ]),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ]),
      ),
    );
  }
}
