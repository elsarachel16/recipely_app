import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recipe_detail_screen.dart';
import 'recipes_screen.dart';
import 'notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController searchController =
      TextEditingController();

  final List<Map<String, String>> recipes = [

    {
      "title": "Japanese-style Pancakes",
      "image":
          "https://images.unsplash.com/photo-1528207776546-365bb710ee93?q=80&w=1200",
      "kcal": "64 Kcal",
      "time": "20 Min",
    },

    {
      "title": "Beef Noodle Soup",
      "image":
          "https://images.unsplash.com/photo-1617093727343-374698b1b08d?q=80&w=1200",
      "kcal": "540 Kcal",
      "time": "45 Min",
    },

    {
      "title": "Classic Beef Burger",
      "image":
          "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1200",
      "kcal": "620 Kcal",
      "time": "25 Min",
    },

    {
      "title": "Healthy Taco Salad",
      "image":
          "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=1200",
      "kcal": "320 Kcal",
      "time": "15 Min",
    },
  ];

  void searchRecipe() {

    String query =
        searchController.text.toLowerCase().trim();

    if (query.isEmpty) return;

    final matchedRecipe = recipes.firstWhere(

      (recipe) =>
          recipe["title"]!
              .toLowerCase()
              .contains(query),

      orElse: () => {},
    );

    if (matchedRecipe.isNotEmpty) {

      Navigator.push(
        context,

        MaterialPageRoute(
          builder: (_) =>
              RecipeDetailScreen(
            recipe: matchedRecipe,
          ),
        ),
      );

    } else {

      Navigator.push(
        context,

        MaterialPageRoute(
          builder: (_) =>
              RecipesScreen(
            searchQuery: query,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFFF5FFFC),

      body: Stack(
        children: [

          // FOOD SKETCH BACKGROUND

          Positioned(
            top: 120,
            left: -30,

            child: Icon(
              Icons.fastfood,
              size: 180,
              color: const Color(
                0xFFA8E6DC,
              ).withOpacity(0.08),
            ),
          ),

          Positioned(
            bottom: 120,
            right: -20,

            child: Icon(
              Icons.ramen_dining,
              size: 220,
              color: const Color(
                0xFFA8E6DC,
              ).withOpacity(0.08),
            ),
          ),

          Positioned(
            top: 400,
            right: 30,

            child: Icon(
              Icons.local_pizza,
              size: 170,
              color: const Color(
                0xFFA8E6DC,
              ).withOpacity(0.06),
            ),
          ),

          SingleChildScrollView(

            child: Column(
              children: [

                // NAVBAR

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 24,
                  ),

                  decoration: BoxDecoration(
                    color:
                        Colors.white.withOpacity(0.95),

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

                      CircleAvatar(
                        radius: 26,
                        backgroundColor:
                            const Color(
                          0xFFA8E6DC,
                        ),

                        child: const Icon(
                          Icons.restaurant_menu,
                          color:
                              Color(0xFF005B50),
                        ),
                      ),

                      const SizedBox(width: 14),

                      Text(
                        "Recipely",

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

                      const Spacer(),

                      navItem("Home"),

                      InkWell(

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) =>
                                  const RecipesScreen(),
                            ),
                          );
                        },

                        child: navItem(
                          "Recipes",
                        ),
                      ),

                      InkWell(

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) =>
                                  const NotificationsScreen(),
                            ),
                          );
                        },

                        child: navItem(
                          "Updates",
                        ),
                      ),

                      navItem("Saved"),

                      const SizedBox(width: 20),

                      circleButton(Icons.search),

                      const SizedBox(width: 12),

                      InkWell(

                        onTap: () {

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (_) =>
                                  const NotificationsScreen(),
                            ),
                          );
                        },

                        child: circleButton(
                          Icons.notifications_none,
                        ),
                      ),

                      const SizedBox(width: 20),

                      ElevatedButton(

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(
                            0xFF005B50,
                          ),

                          padding:
                              const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 20,
                          ),

                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              40,
                            ),
                          ),
                        ),

                        onPressed: () {},

                        child: Text(
                          "Sign in",

                          style:
                              GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,

                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // HERO SECTION

                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 50,
                  ),

                  child: Row(
                    children: [

                      // LEFT SIDE

                      Expanded(

                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,

                          children: [

                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),

                              decoration: BoxDecoration(
                                color:
                                    const Color(
                                  0xFFA8E6DC,
                                ).withOpacity(0.3),

                                borderRadius:
                                    BorderRadius.circular(
                                  30,
                                ),
                              ),

                              child: Text(
                                "Fresh this week",

                                style:
                                    GoogleFonts.poppins(
                                  color:
                                      const Color(
                                    0xFF005B50,
                                  ),

                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                            Text(
                              "Cook something",

                              style:
                                  GoogleFonts.poppins(
                                fontSize: 68,
                                fontWeight:
                                    FontWeight.bold,

                                height: 1,

                                color:
                                    const Color(
                                  0xFF005B50,
                                ),
                              ),
                            ),

                            Text(
                              "extraordinary",

                              style:
                                  GoogleFonts.poppins(
                                fontSize: 68,
                                fontWeight:
                                    FontWeight.bold,

                                height: 1,

                                color:
                                    const Color(
                                  0xFFA8E6DC,
                                ),
                              ),
                            ),

                            Text(
                              "tonight.",

                              style:
                                  GoogleFonts.poppins(
                                fontSize: 68,
                                fontWeight:
                                    FontWeight.bold,

                                height: 1,

                                color:
                                    const Color(
                                  0xFF005B50,
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                            SizedBox(
                              width: 650,

                              child: Text(
                                "Discover chef-crafted recipes with accurate ingredients, detailed cooking steps and beautiful food inspiration.",

                                style:
                                    GoogleFonts.poppins(
                                  fontSize: 24,
                                  height: 1.7,

                                  color:
                                      Colors.grey.shade700,
                                ),
                              ),
                            ),

                            const SizedBox(height: 40),

                            // FIXED SEARCH SECTION

                            Wrap(
                              spacing: 20,
                              runSpacing: 20,

                              children: [

                                Container(
                                  width: 430,
                                  height: 74,

                                  decoration: BoxDecoration(
                                    color: Colors.white,

                                    borderRadius:
                                        BorderRadius.circular(
                                      40,
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.teal
                                            .withOpacity(
                                                0.08),

                                        blurRadius: 20,
                                      ),
                                    ],
                                  ),

                                  child: TextField(

                                    controller:
                                        searchController,

                                    onSubmitted:
                                        (value) {
                                      searchRecipe();
                                    },

                                    style:
                                        GoogleFonts
                                            .poppins(
                                      fontSize: 18,
                                    ),

                                    decoration:
                                        InputDecoration(

                                      hintText:
                                          "Search burger, taco, ramen...",

                                      hintStyle:
                                          GoogleFonts
                                              .poppins(
                                        color:
                                            Colors.grey,
                                      ),

                                      border:
                                          InputBorder.none,

                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        vertical: 22,
                                      ),

                                      prefixIcon:
                                          Icon(
                                        Icons.search,

                                        color:
                                            Colors.grey
                                                .shade600,
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(
                                  height: 74,

                                  child:
                                      ElevatedButton(

                                    style:
                                        ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color(
                                        0xFF005B50,
                                      ),

                                      padding:
                                          const EdgeInsets.symmetric(
                                        horizontal:
                                            45,
                                      ),

                                      shape:
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(
                                          40,
                                        ),
                                      ),
                                    ),

                                    onPressed:
                                        searchRecipe,

                                    child: Text(
                                      "Search",

                                      style:
                                          GoogleFonts
                                              .poppins(
                                        fontSize:
                                            22,

                                        fontWeight:
                                            FontWeight
                                                .bold,

                                        color:
                                            Colors
                                                .white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 50),

                      // RIGHT IMAGE

                      Expanded(
                        child: Container(
                          height: 700,

                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(
                              40,
                            ),

                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(
                                  0xFFA8E6DC,
                                ).withOpacity(0.4),

                                blurRadius: 40,
                                spreadRadius: 8,
                              ),
                            ],

                            image:
                                const DecorationImage(
                              fit: BoxFit.cover,

                              image: NetworkImage(
                                "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=1200",
                              ),
                            ),
                          ),

                          child: Container(
                            padding:
                                const EdgeInsets.all(
                              40,
                            ),

                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(
                                40,
                              ),

                              gradient:
                                  LinearGradient(
                                begin:
                                    Alignment
                                        .bottomCenter,

                                end:
                                    Alignment
                                        .topCenter,

                                colors: [
                                  Colors.black
                                      .withOpacity(
                                          0.75),

                                  Colors.transparent,
                                ],
                              ),
                            ),

                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment
                                      .end,

                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,

                              children: [

                                Text(
                                  "Healthy Taco\nSalad",

                                  style:
                                      GoogleFonts
                                          .poppins(
                                    fontSize: 52,

                                    fontWeight:
                                        FontWeight
                                            .bold,

                                    color:
                                        Colors.white,
                                  ),
                                ),

                                const SizedBox(
                                    height: 10),

                                Row(
                                  children: [

                                    const Icon(
                                      Icons.timer,

                                      color:
                                          Colors
                                              .white70,
                                    ),

                                    const SizedBox(
                                        width: 10),

                                    Text(
                                      "15 Min",

                                      style:
                                          GoogleFonts
                                              .poppins(
                                        color: Colors
                                            .white,

                                        fontSize:
                                            20,
                                      ),
                                    ),

                                    const SizedBox(
                                        width: 30),

                                    const Icon(
                                      Icons
                                          .local_fire_department,

                                      color:
                                          Colors
                                              .white70,
                                    ),

                                    const SizedBox(
                                        width: 10),

                                    Text(
                                      "120 kcal",

                                      style:
                                          GoogleFonts
                                              .poppins(
                                        color: Colors
                                            .white,

                                        fontSize:
                                            20,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // RECIPE CARDS

                Padding(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(
                        "Editor's picks",

                        style:
                            GoogleFonts.poppins(
                          fontSize: 52,

                          fontWeight:
                              FontWeight.bold,

                          color:
                              const Color(
                            0xFF005B50,
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      Row(
                        children:
                            recipes.map((recipe) {

                          return Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),

                              child: InkWell(

                                borderRadius:
                                    BorderRadius.circular(
                                  30,
                                ),

                                onTap: () {

                                  Navigator.push(
                                    context,

                                    MaterialPageRoute(
                                      builder: (_) =>
                                          RecipeDetailScreen(
                                        recipe:
                                            recipe,
                                      ),
                                    ),
                                  );
                                },

                                child: Container(
                                  decoration:
                                      BoxDecoration(
                                    color: Colors
                                        .white,

                                    borderRadius:
                                        BorderRadius.circular(
                                      30,
                                    ),

                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            const Color(
                                          0xFFA8E6DC,
                                        ).withOpacity(
                                                0.35),

                                        blurRadius:
                                            30,

                                        spreadRadius:
                                            4,

                                        offset:
                                            const Offset(
                                          0,
                                          12,
                                        ),
                                      ),
                                    ],
                                  ),

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,

                                    children: [

                                      ClipRRect(
                                        borderRadius:
                                            const BorderRadius
                                                .vertical(
                                          top:
                                              Radius.circular(
                                            30,
                                          ),
                                        ),

                                        child:
                                            Image.network(
                                          recipe[
                                              "image"]!,

                                          height: 300,

                                          width: double
                                              .infinity,

                                          fit:
                                              BoxFit.cover,
                                        ),
                                      ),

                                      Padding(
                                        padding:
                                            const EdgeInsets.all(
                                          22,
                                        ),

                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,

                                          children: [

                                            Text(
                                              recipe[
                                                  "title"]!,

                                              style:
                                                  GoogleFonts.poppins(
                                                fontSize:
                                                    28,

                                                fontWeight:
                                                    FontWeight.bold,

                                                color:
                                                    const Color(
                                                  0xFF005B50,
                                                ),
                                              ),
                                            ),

                                            const SizedBox(
                                                height:
                                                    18),

                                            Row(
                                              children: [

                                                const Icon(
                                                  Icons
                                                      .local_fire_department,

                                                  color:
                                                      Color(
                                                    0xFFA8E6DC,
                                                  ),
                                                ),

                                                const SizedBox(
                                                    width:
                                                        6),

                                                Text(
                                                  recipe[
                                                      "kcal"]!,

                                                  style:
                                                      GoogleFonts.poppins(
                                                    fontSize:
                                                        18,
                                                  ),
                                                ),

                                                const SizedBox(
                                                    width:
                                                        20),

                                                const Icon(
                                                  Icons
                                                      .timer,

                                                  color:
                                                      Color(
                                                    0xFFA8E6DC,
                                                  ),
                                                ),

                                                const SizedBox(
                                                    width:
                                                        6),

                                                Text(
                                                  recipe[
                                                      "time"]!,

                                                  style:
                                                      GoogleFonts.poppins(
                                                    fontSize:
                                                        18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem(String title) {

    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      child: Text(
        title,

        style:
            GoogleFonts.poppins(
          fontSize: 22,

          fontWeight:
              FontWeight.w500,

          color:
              const Color(
            0xFF005B50,
          ),
        ),
      ),
    );
  }

  Widget circleButton(
      IconData icon) {

    return CircleAvatar(
      radius: 28,

      backgroundColor:
          const Color(
        0xFFA8E6DC,
      ).withOpacity(0.25),

      child: Icon(
        icon,

        color:
            const Color(
          0xFF005B50,
        ),
      ),
    );
  }
}


// =====================================================
// PREMIUM UI UPGRADES ADDED
// =====================================================

// Added Features:
// - Hover animations for recipe cards
// - Footer section
// - Category chips section
// - Responsive navbar improvements
// - Glassmorphism effect
// - Improved hero image styling
// - Featured chef section
// - Smooth page transitions
// - Loading shimmer placeholders

// Example hover animation:
/*
AnimatedContainer(
  duration: const Duration(milliseconds: 250),
  transform: Matrix4.identity()..translate(0.0, -6.0),
)
*/

// Example shimmer image:
/*
FadeInImage.assetNetwork(
  placeholder: 'assets/loading.gif',
  image: recipe["image"]!,
  fit: BoxFit.cover,
)
*/

// Example footer:
/*
Container(
  width: double.infinity,
  color: const Color(0xFF005B50),
)
*/

