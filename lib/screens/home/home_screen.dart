import 'package:flutter/material.dart';
import 'package:pretium_finance/utils/color_manager.dart';

import '../../Widgets/transaction_item.dart';
import '../../utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


final List<Map<String, String>> transactions = [
  {
    "title": "Mobile",
    "amount": "KES 500",
    "datetime": "Jan 03, 07:57",
  },
  {
    "title": "Mobile",
    "amount": "KES 500",
    "datetime": "Jan 03, 07:53",
  },
  {
    "title": "Mobile",
    "amount": "KES 1200",
    "datetime": "Jan 01, 18:21",
  },
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
        toolbarHeight: 65,
        title:Row(
          mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Hello, Chris  ',
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Text('👋'),
        ],
      ),
      centerTitle:  true,
      backgroundColor: ColorManager.secondary,
      elevation:0,  
      automaticallyImplyLeading: true,
      leading:Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.pink,
            child: Text(
              'G',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      actions: [
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.notifications_none),
            onPressed: () {
              // Notification button action
            },
          ),
        ],
      ),
      body: SafeArea(
       child:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Card 1: Balance
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF005055), Color(0xFF01737A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top row with copy and eye icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.copy, color: Colors.white),
                      Icon(Icons.visibility, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Available Balance',
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'KES 51,792.33',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '\$ 400.71',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Card 2: Financial Services
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                children: [
                  // Top Row: Title and country
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Financial Services",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Kenya",
                            style: TextStyle(color: Colors.teal),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: Colors.teal),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),

                  // Icons row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildServiceIcon(Icons.send, "Send Money"),
                      _buildServiceIcon(Icons.shopping_bag, "Buy Goods"),
                      _buildServiceIcon(Icons.receipt, "Paybill"),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 16),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent transactions",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ]
              ),  
            ),
            
              // ListView.builder(
              //   padding: const EdgeInsets.all(16),
              //   itemCount: transactions.length + 1, // +1 عشان الـ header
              //   itemBuilder: (context, index) {
              //     if (index == 0) {
              //       // العنوان العلوي
              //       return Padding(
              //         padding: const EdgeInsets.only(bottom: 16.0),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Recent transactions",
              //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              //             ),
              //             Text(
              //               "See all",
              //               style: TextStyle(
              //                 color: Colors.teal,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     } 
              //     // else {
              //     //   final tx = transactions[index - 1];
              //     //   return TransactionItem(
              //     //     title: tx["title"]!,
              //     //     amount: tx["amount"]!,
              //     //     datetime: tx["datetime"]!,
              //     //   );
              //     // }
              //   },
              // )  
          ],
        ),
      ),
      ),
    );
  }

  Future<void> _refresh() async {
    setState(() {});
    return Future.delayed(
      const Duration(seconds: 1)
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.teal.withOpacity(0.1),
          child: Icon(icon, color: Colors.teal),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
