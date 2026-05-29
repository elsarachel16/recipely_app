import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final notifications = [

      {
        "title": "New recipe from Natalia Luca",
        "subtitle":
            "Healthy Taco Salad was just published.",
        "time": "2m ago",
      },

      {
        "title": "Your weekly digest",
        "subtitle":
            "5 trending breakfasts you might love.",
        "time": "1h ago",
      },

      {
        "title": "Saved for later",
        "subtitle":
            "Don't forget your blueberry pancakes.",
        "time": "Yesterday",
      },

      {
        "title": "Olivia Reed posted a recipe",
        "subtitle":
            "Chicken Skewers — perfect for the grill.",
        "time": "2d ago",
      },
    ];

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5FFFC),

      body: SingleChildScrollView(

        child: Column(
          children: [

            Container(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 24,
              ),

              decoration: BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.teal
                        .withOpacity(0.05),

                    blurRadius: 20,
                  ),
                ],
              ),

              child: Row(
                children: [

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color(0xFF005B50),
                    ),
                  ),

                  const SizedBox(width: 14),

                  Text(
                    "Notifications",

                    style:
                        GoogleFonts.poppins(
                      fontSize: 34,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          const Color(
                        0xFF005B50,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 50,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    "Recipe Updates",

                    style:
                        GoogleFonts.poppins(
                      fontSize: 54,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          const Color(
                        0xFF001E1A,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Recipe activity, creator updates and weekly digests.",

                    style:
                        GoogleFonts.poppins(
                      fontSize: 22,

                      color:
                          Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 40),

                  Column(
                    children:
                        notifications.map((item) {

                      return Container(
                        margin:
                            const EdgeInsets.only(
                          bottom: 24,
                        ),

                        padding:
                            const EdgeInsets.all(24),

                        decoration: BoxDecoration(
                          color: Colors.white,

                          borderRadius:
                              BorderRadius.circular(
                            30,
                          ),

                          border: Border.all(
                            color:
                                Colors.grey.shade200,
                          ),
                        ),

                        child: Row(
                          children: [

                            CircleAvatar(
                              radius: 28,

                              backgroundColor:
                                  const Color(
                                0xFFA8E6DC,
                              ).withOpacity(0.25),

                              child: const Icon(
                                Icons.auto_awesome,

                                color:
                                    Color(
                                  0xFF6CCFC1,
                                ),
                              ),
                            ),

                            const SizedBox(width: 20),

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  Text(
                                    item["title"]!,

                                    style:
                                        GoogleFonts
                                            .poppins(
                                      fontSize: 24,

                                      fontWeight:
                                          FontWeight
                                              .w600,
                                    ),
                                  ),

                                  const SizedBox(
                                      height: 6),

                                  Text(
                                    item["subtitle"]!,

                                    style:
                                        GoogleFonts
                                            .poppins(
                                      fontSize: 18,

                                      color: Colors
                                          .grey
                                          .shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              item["time"]!,

                              style:
                                  GoogleFonts
                                      .poppins(
                                fontSize: 18,

                                color:
                                    Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}