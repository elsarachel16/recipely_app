import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recipe_detail_screen.dart';

class RecipesScreen extends StatelessWidget {

  final String? searchQuery;

  const RecipesScreen({
    super.key,
    this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {

    final recipes = [

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
            "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1200",
        "kcal": "320 Kcal",
        "time": "15 Min",
      },

      {
        "title": "Beef Noodle Soup",
        "image":
            "https://images.unsplash.com/photo-1617093727343-374698b1b08d?q=80&w=1200",
        "kcal": "540 Kcal",
        "time": "45 Min",
      },

      {
        "title": "Margherita Pizza",
        "image":
            "https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1200",
        "kcal": "710 Kcal",
        "time": "30 Min",
      },

      {
        "title": "Chicken Biryani",
        "image":
            "https://images.unsplash.com/photo-1631515243349-e0cb75fb8d3a?q=80&w=1200",
        "kcal": "740 Kcal",
        "time": "50 Min",
      },

      {
        "title": "Grilled Steak",
        "image":
            "https://images.unsplash.com/photo-1544025162-d76694265947?q=80&w=1200",
        "kcal": "520 Kcal",
        "time": "28 Min",
      },

      {
        "title": "Sushi Platter",
        "image":
            "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?q=80&w=1200",
        "kcal": "280 Kcal",
        "time": "40 Min",
      },

      {
        "title": "Chicken Alfredo Pasta",
        "image":
            "https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?q=80&w=1200",
        "kcal": "690 Kcal",
        "time": "35 Min",
      },
    ];

    final filteredRecipes = recipes.where((recipe) {

      if (searchQuery == null ||
          searchQuery!.isEmpty) {
        return true;
      }

      return recipe["title"]!
          .toLowerCase()
          .contains(
            searchQuery!.toLowerCase(),
          );

    }).toList();

    return Scaffold(

      backgroundColor: const Color(0xFFF5FFFB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Color(0xFF005B50),
        ),

        title: Text(
          "All Recipes",

          style: GoogleFonts.poppins(
            color: const Color(0xFF005B50),
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
      ),

      body: Stack(
        children: [

          // FOOD SKETCH BACKGROUND

          Positioned(
            top: 100,
            left: -40,

            child: Icon(
              Icons.fastfood,
              size: 220,
              color: const Color(0xFFA8E6DC)
                  .withOpacity(0.08),
            ),
          ),

          Positioned(
            bottom: 50,
            right: -40,

            child: Icon(
              Icons.restaurant,
              size: 250,
              color: const Color(0xFFA8E6DC)
                  .withOpacity(0.08),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(30),

            child: GridView.builder(

              itemCount: filteredRecipes.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 4,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,

                childAspectRatio: 0.72,
              ),

              itemBuilder: (context, index) {

                final recipe = filteredRecipes[index];

                return InkWell(

                  borderRadius:
                      BorderRadius.circular(30),

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (_) =>
                            RecipeDetailScreen(
                          recipe: recipe,
                        ),
                      ),
                    );
                  },

                  child: Container(

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius:
                          BorderRadius.circular(30),

                      boxShadow: [

                        BoxShadow(
                          color:
                              const Color(0xFFA8E6DC)
                                  .withOpacity(0.25),

                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        // IMAGE

                        ClipRRect(
                          borderRadius:
                              const BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),

                          child: Image.network(
                            recipe["image"]!,

                            height: 250,
                            width: double.infinity,

                            fit: BoxFit.cover,
                          ),
                        ),

                        // TEXT

                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.all(20),

                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,

                              children: [

                                Text(
                                  recipe["title"]!,

                                  maxLines: 2,
                                  overflow:
                                      TextOverflow.ellipsis,

                                  style:
                                      GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight:
                                        FontWeight.bold,

                                    color:
                                        const Color(
                                      0xFF005B50,
                                    ),
                                  ),
                                ),

                                Row(
                                  children: [

                                    const Icon(
                                      Icons
                                          .local_fire_department,

                                      color:
                                          Color(
                                        0xFFA8E6DC,
                                      ),

                                      size: 22,
                                    ),

                                    const SizedBox(width: 6),

                                    Text(
                                      recipe["kcal"]!,

                                      style:
                                          GoogleFonts
                                              .poppins(
                                        fontSize: 16,
                                      ),
                                    ),

                                    const SizedBox(width: 18),

                                    const Icon(
                                      Icons.timer,

                                      color:
                                          Color(
                                        0xFFA8E6DC,
                                      ),

                                      size: 22,
                                    ),

                                    const SizedBox(width: 6),

                                    Text(
                                      recipe["time"]!,

                                      style:
                                          GoogleFonts
                                              .poppins(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}