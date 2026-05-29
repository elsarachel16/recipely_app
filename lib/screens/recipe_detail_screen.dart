import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeDetailScreen extends StatelessWidget {

  final Map recipe;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {

    List<String> ingredients = [];
    List<String> steps = [];

    // BURGER

    if (recipe["title"] == "Classic Beef Burger") {

      ingredients = [
        "500g ground beef",
        "4 burger buns",
        "4 cheddar cheese slices",
        "1 tomato sliced",
        "1 onion sliced",
        "4 lettuce leaves",
        "4 tbsp burger sauce",
        "Salt & black pepper",
      ];

      steps = [
        "Season ground beef with salt and pepper.",
        "Shape into 4 patties.",
        "Cook patties for 4–5 minutes each side.",
        "Add cheese slices and melt.",
        "Toast burger buns lightly.",
        "Assemble burger with lettuce, tomato, onion and sauce.",
      ];
    }

    // TACO SALAD

    else if (recipe["title"] == "Healthy Taco Salad") {

      ingredients = [
        "2 cups lettuce",
        "200g cooked beef strips",
        "1 avocado sliced",
        "1 tomato diced",
        "1/2 onion sliced",
        "2 tbsp olive oil",
        "1 tbsp lemon juice",
        "Salt & pepper",
      ];

      steps = [
        "Wash and chop lettuce.",
        "Cook beef strips until browned.",
        "Slice avocado and onion.",
        "Combine all vegetables in a bowl.",
        "Top with cooked beef.",
        "Mix olive oil, lemon juice, salt and pepper for dressing.",
        "Drizzle dressing before serving.",
      ];
    }

    // NOODLE SOUP

    else if (recipe["title"] == "Beef Noodle Soup") {

      ingredients = [
        "300g beef slices",
        "200g noodles",
        "4 cups beef broth",
        "2 garlic cloves",
        "1 tbsp soy sauce",
        "1 tsp ginger",
        "2 spring onions",
        "Salt & pepper",
      ];

      steps = [
        "Boil beef broth in a large pot.",
        "Add garlic, ginger and soy sauce.",
        "Cook noodles separately for 5 minutes.",
        "Add beef slices into broth and simmer.",
        "Drain noodles and place into bowls.",
        "Pour hot broth and beef over noodles.",
        "Top with spring onions before serving.",
      ];
    }

    // PIZZA

    else if (recipe["title"] == "Margherita Pizza") {

      ingredients = [
        "1 pizza base",
        "1/2 cup tomato sauce",
        "200g mozzarella cheese",
        "Fresh basil leaves",
        "2 tbsp olive oil",
        "Salt",
      ];

      steps = [
        "Preheat oven to 220°C.",
        "Spread tomato sauce over pizza base.",
        "Add mozzarella cheese evenly.",
        "Bake for 12–15 minutes.",
        "Remove and top with basil leaves.",
        "Drizzle olive oil before serving.",
      ];
    }

    // BIRYANI

    else if (recipe["title"] == "Chicken Biryani") {

      ingredients = [
        "500g chicken",
        "2 cups basmati rice",
        "1 onion sliced",
        "2 tomatoes chopped",
        "2 tbsp biryani masala",
        "1 cup yogurt",
        "Fresh coriander",
      ];

      steps = [
        "Cook rice until 70% done.",
        "Fry onions until golden brown.",
        "Cook chicken with tomatoes and masala.",
        "Add yogurt and simmer.",
        "Layer rice over chicken mixture.",
        "Cook on low heat for 20 minutes.",
        "Garnish with coriander before serving.",
      ];
    }

    // STEAK

    else if (recipe["title"] == "Grilled Steak") {

      ingredients = [
        "400g beef steak",
        "2 tbsp butter",
        "2 garlic cloves",
        "1 tbsp olive oil",
        "Salt",
        "Black pepper",
      ];

      steps = [
        "Season steak generously with salt and pepper.",
        "Heat pan with olive oil.",
        "Cook steak 4 minutes per side.",
        "Add butter and garlic.",
        "Spoon butter over steak while cooking.",
        "Rest steak for 5 minutes before serving.",
      ];
    }

    // SUSHI

    else if (recipe["title"] == "Sushi Platter") {

      ingredients = [
        "2 cups sushi rice",
        "200g salmon",
        "Nori sheets",
        "1 cucumber",
        "1 avocado",
        "Soy sauce",
      ];

      steps = [
        "Cook sushi rice and cool it.",
        "Slice salmon, cucumber and avocado.",
        "Place rice on nori sheet.",
        "Add fillings in center.",
        "Roll tightly using sushi mat.",
        "Slice into equal pieces.",
      ];
    }
    // CHICKEN ALFREDO PASTA

else if (recipe["title"] == "Chicken Alfredo Pasta") {

  ingredients = [
    "250g fettuccine pasta",
    "2 chicken breasts sliced",
    "2 tbsp butter",
    "3 garlic cloves minced",
    "1 cup heavy cream",
    "1 cup parmesan cheese",
    "1 tbsp olive oil",
    "Salt",
    "Black pepper",
    "Parsley for garnish",
  ];

  steps = [

    "Boil salted water in a large pot and cook the fettuccine pasta until al dente. Drain and set aside.",

    "Season sliced chicken breasts with salt and black pepper.",

    "Heat olive oil in a large pan over medium heat and cook chicken for 5–6 minutes until golden brown and fully cooked.",

    "Remove chicken and set aside. In the same pan melt butter and sauté minced garlic for 1 minute until fragrant.",

    "Pour heavy cream into the pan and simmer for 2–3 minutes on low heat.",

    "Add parmesan cheese slowly while stirring continuously until the sauce becomes creamy and smooth.",

    "Return cooked chicken into the sauce and mix well.",

    "Add cooked pasta and toss everything together until evenly coated with Alfredo sauce.",

    "Garnish with chopped parsley and extra parmesan cheese before serving hot.",
  ];
}

    // DEFAULT

    else {

      ingredients = [
        "Fresh ingredients",
        "Seasoning",
        "Herbs",
      ];

      steps = [
        "Prepare ingredients.",
        "Cook carefully.",
        "Serve hot.",
      ];
    }

    return Scaffold(

      backgroundColor: const Color(0xFFF5FFFB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Color(0xFF005B50),
        ),

        title: Text(
          recipe["title"],

          style: GoogleFonts.poppins(
            color: const Color(0xFF005B50),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(30),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // IMAGE + STEPS

            Expanded(
              flex: 3,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),

                    child: Image.network(
                      recipe["image"],
                      height: 500,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Cooking Instructions",

                    style: GoogleFonts.poppins(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF005B50),
                    ),
                  ),

                  const SizedBox(height: 20),

                  ...steps.map((step) {

                    return Container(

                      margin: const EdgeInsets.only(bottom: 20),

                      padding: const EdgeInsets.all(24),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(24),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.04),

                            blurRadius: 12,
                          ),
                        ],
                      ),

                      child: Text(
                        step,

                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          height: 1.6,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(width: 30),

            // INGREDIENTS

            Expanded(
              flex: 2,

              child: Container(

                padding: const EdgeInsets.all(30),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(30),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.05),

                      blurRadius: 20,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      "Ingredients",

                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF005B50),
                      ),
                    ),

                    const SizedBox(height: 30),

                    ...ingredients.map((ingredient) {

                      return Container(

                        margin:
                            const EdgeInsets.only(
                          bottom: 20,
                        ),

                        padding:
                            const EdgeInsets.all(20),

                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFF3FFFB,
                          ),

                          borderRadius:
                              BorderRadius.circular(
                            20,
                          ),
                        ),

                        child: Row(
                          children: [

                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFFA8E6DC),
                            ),

                            const SizedBox(width: 18),

                            Expanded(
                              child: Text(
                                ingredient,

                                style:
                                    GoogleFonts
                                        .poppins(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}