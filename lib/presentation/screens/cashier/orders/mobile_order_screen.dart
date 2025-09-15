import 'package:flutter/material.dart';

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
          Container(height: 275, decoration: BoxDecoration(color: Colors.blue)),
          SizedBox(height: 13),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product title",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                Column(children: [Text("100"), Text('Base price')]),
              ],
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          Text(
            "Cup Size",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                label: Text('Regular', style: TextStyle(fontSize: 18)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ChoiceChip(
                label: Text('Medium', style: TextStyle(fontSize: 18)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ChoiceChip(
                label: Text('Large', style: TextStyle(fontSize: 18)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Ice Level",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                label: Text('Less Ice', style: TextStyle(fontSize: 18)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ChoiceChip(
                label: Text('Regular', style: TextStyle(fontSize: 18)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ChoiceChip(
                label: Text('More Ice', style: TextStyle(fontSize: 18)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "Sugar Level",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ChoiceChip(
                label: Text('0%', style: TextStyle(fontSize: 16)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ChoiceChip(
                label: Text('25%', style: TextStyle(fontSize: 16)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ChoiceChip(
                label: Text('50%', style: TextStyle(fontSize: 16)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ChoiceChip(
                label: Text('75%', style: TextStyle(fontSize: 16)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              ChoiceChip(
                label: Text('100%', style: TextStyle(fontSize: 16)),
                selected: false,
                padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
          SizedBox(height: 8),
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
              alignLabelWithHint: true,
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity, // full width
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // your POS theme color
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              onPressed: () {

              },
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
        ],
      ),
    );
  }
}
