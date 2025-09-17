import 'package:flutter/material.dart';
import 'package:quick_pos/presentation/widgets/orderScreen/order_customization_selection.dart';

class MobileOrderScreen extends StatefulWidget {
  const MobileOrderScreen({super.key});

  @override
  State<MobileOrderScreen> createState() => _MobileOrderScreenState();
}

class _MobileOrderScreenState extends State<MobileOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: 275,
                width: 410,
                //temporary value as it needs to be adjusted for different screen sizes
                decoration: BoxDecoration(color: Colors.blue),
                child: Image.asset("", height: 275, fit: BoxFit.cover),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: InkWell(
                  onTap: () => (),
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(200),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 13),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product title",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Contains: Milk, Soy",
                      style: TextStyle(fontSize: 14, color: Colors.orange[700]),
                    ),
                  ],
                ),
                Column(children: [Text("100"), Text('Base price')]),
              ],
            ),
          ),

          SizedBox(height: 10),
          Divider(),
          OrderCustomizationSelection(
            title: 'Cup Size',
            options: ["Regular", "Medium", "Large"],
            defaultIndex: 0,
          ),
          SizedBox(height: 8),
          OrderCustomizationSelection(
            title: 'Ice Level',
            options: ["Less Ice", "Regular", "Extra Ice"],
            defaultIndex: 1,
          ),
          SizedBox(height: 8),
          OrderCustomizationSelection(
            title: 'Sugar Level',
            options: ["0%", "25%", "50%", "75%", "100%"],
            defaultIndex: 2,
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Notes:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                TextField(
                  cursorColor: Colors.blueAccent,
                  maxLines: 5,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Enter your notes',
                    labelStyle: TextStyle(
                      color: Colors.black
                    ),
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                onPressed: () {},
                child: Text(
                  "Add to Order",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
