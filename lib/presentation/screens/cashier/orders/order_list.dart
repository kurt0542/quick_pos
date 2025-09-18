import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderList extends StatefulWidget {
  final double imageSize;

  const OrderList({super.key, this.imageSize = 60});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<Map<String, dynamic>> items = [
    {
      "name": "Cheeseburger",
      "description": "With extra cheese and bacon",
      "price": 120,
      "qty": 1,
      "image": "assets/images/burger.png",
    },
    {
      "name": "Fries",
      "description": "Large size with ketchup",
      "price": 80,
      "qty": 2,
      "image": "assets/images/fries.png",
    },
    {
      "name": "Soda",
      "description": "Medium cup, less ice",
      "price": 50,
      "qty": 1,
      "image": "assets/images/soda.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            "Items",
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                key: ValueKey(item["name"]),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${item["name"]} removed")),
                  );
                },
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: SizedBox(
                      width: widget.imageSize,
                      height: widget.imageSize,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(item["image"], fit: BoxFit.cover),
                      ),
                    ),
                    title: Text(
                      item["name"],
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          item["description"] ?? "",
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black87.withAlpha(130),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₱${item["price"]}",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            setState(() {
                              if (item["qty"] > 1) item["qty"]--;
                            });
                          },
                        ),
                        Text(
                          "${item["qty"]}",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () {
                            setState(() {
                              item["qty"]++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
