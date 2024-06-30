import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_cart/utils/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF6B23),
                      Color(0xFFFF6B23),
                      Color(0xFFFF9727),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Material(
                  shadowColor: primaryColor.withOpacity(0.2),
                  color: Colors.transparent,
                  elevation: 0.8,
                  borderRadius: BorderRadius.circular(5),
                  child: ExpansionTile(
                      collapsedIconColor: Colors.white,
                      iconColor: Colors.white,
                      trailing: AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: isExpanded ? 0 : 0.5,
                        child: SvgPicture.asset(
                          'assets/arrow_up.svg',
                        ),
                      ),
                      onExpansionChanged: (value) {
                        setState(() {
                          isExpanded = value;
                        });
                      },
                      backgroundColor: Colors.transparent,
                      collapsedBackgroundColor: Colors.transparent,
                      initiallyExpanded: true,
                      collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
                      shape: const RoundedRectangleBorder(side: BorderSide.none),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Breakfast',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Vat(5%) Service Charge(5%)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      children: [
                        Container(
                          color: backWhite,
                          child: ListView.separated(
                              itemCount: 5,
                              shrinkWrap: true,
                              primary: false,
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Transform.rotate(
                                        angle: 3.14 / 4,
                                        child: Container(
                                          height: 5,
                                          width: 5,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF6B23),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      Flexible(
                                        child: DottedLine(
                                          dashGradient: const [
                                            Color(0xFFFF6B23),
                                            Color(0xFFFF9727),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      Transform.rotate(
                                        angle: 3.14 / 4,
                                        child: Container(
                                          height: 5,
                                          width: 5,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFFF9727),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      DottedBorder(
                                        radius: Radius.circular(8),
                                        borderType: BorderType.RRect,
                                        color: primaryColor,
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            color: backgroundColor,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: Image.network(
                                              'https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg',
                                              height: 52,
                                              width: 52,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Food Name',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: textColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.5,
                                            child: Text(
                                              'Lorem ipsum dolor sit amet consectetur.',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF686868),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '\$50.00',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: accentColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Material(
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: primaryColor,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Text(
                                                  'Add',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: textColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$50.0',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Vat(5%) Service Charge included (5%)',
                      style: TextStyle(
                        fontSize: 12,
                        color: accentColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$5.0',
                      style: TextStyle(
                        fontSize: 18,
                        color: accentColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: primaryColor,
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$50.0',
                      style: TextStyle(
                        fontSize: 18,
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
