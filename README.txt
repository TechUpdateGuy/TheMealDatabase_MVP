**MAXIMIZE APPLICATION WINDOW TO SEE NOTES CLEARLY**


# Excutive Summary
    - The API Endpoint `https://themealdb.com/api/json/v1/1/filter.php?c=Dessert` is used in file ServiceModel.swift
    - The API Endpoint `https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID` is used in file ServiceModel.swift
    - The Dessert are sorted Alphabetically using closure on line 30 of ContentView.swift
        -  `ForEach(meals.sorted(by: { $0.title ?? "" < $1.title ?? "" })) { meal in`
    - The Detail View we use to displace meal's data is RecipeDetailView in file RecipeDetailView.swift. It includes:
        -  Meal Name
        -  Ingredients/measurements
        -  Instructions
        -  (Optional) Image
        -  (Optional) Tags
        -  (Optional) Area
        -  (Optional) Source Link
                - Default Xcode behavior: Link won't open when tapped in preview mode. But does open in safari in iPhone Simulator.
        -  (Optional) YouTube Link
                - Default Xcode behavior: Link won't open when tapped in preview mode. But does open in safari in iPhone Simulator
    - The Dessert List View
        - (Optional) Search
            - Search for any dessert within list. If none are filtered out, then it shows all deserts by default



```
PROJECT STRUCTURE
│
├──• README.txt
|   // Instructions, Comments, Notes for the Project
│
└──▻ TheMealDatabase_MVP
    |──• TheMealDatabase_MVP.swift
    │   // The starting point of program.
    |   // It calls ContentView() in ContentView.Swift to Display App
    │
    ├──▻ Views
    │   ├──• ContentView.swift
    |   |   // (stuct) `ContentView` -> Fetch and Displays List of Desserts
    |   |   // (stuct) `MealDetailsNavigateView` -> Fetch details of Recipie and open `RecipeDetailView` else show progress indicator
    │   └──• RecipeDetailView.swift
    |       // (extension `String`, func formatParagraphAddSpaceLines) -> Format instruction text where there are missing space between paragraph
    |       // (stuct) `RecipeDetailView` -> Show recipe Image, Title, Tags, Area, Source, Youtube, Instruction
    │
    └──▻ Models
        ├──• ServiceModel.swift
        |   // (class) `ServiceModel` -> Fetch and parse JSON data
        |   //      (func) `fetchMeals` -> Fetches meals data from themealsdb.com api from `filter` endpoint
        |   //      (func) `fetchMealsDetail` -> Fetches recipe details from themealsdb.com api from `lookup` endpoint
        └──• JSONStructure.swift
            // (stuct) MealsResponse -> Container to Store `Meals` when JSON file is obtained and parsed
            // (stuct) MealsDetailResponse -> Container to Store `MealsDetail` when JSON file is obtained and parsed
            // (stuct) Meals -> Converts JSON file into Swift's Structure such that values can be obtained easily
            // (stuct) MealsDetail -> Converts JSON file into Swift's Structure such that values can be obtained easily
```


# Notes from Developer:

    - At the bottom of the page of socure code files `ContentView.Swift` and `RecipeDetailView.Swift` I have commented out xcode preview code used for UI testing purposes. This is an intentional decision to allow quick testing of UI code for reviewer without constantly switching back and forth between files.

    
            ```
            // Uncomment these part of code in source files

            // ContentView.Swift
            // -----------------
                #Preview {
                    ContentView()
                }

            // RecipeDetailView.Swift
            // -----------------
                /* Note: We are only using Meal's Id to lookup details in API endpoint.
                   Hence, changing `title` and `featuredImage` does not reflect changes in preview
                */
                #Preview {
                    MealDetailsNavigateView(meal:
                                        Meals(id: "52966", title: "", featuredImage: URL(string: "")),
                                    serviceModel: ServiceModel()
                    )
                }
            ```

    - In SwiftUI, AsyncImage breaks the `Vstack` layout contrains if not image is obtained before `Vstack` view is loaded. So it became important to put placeholders in place when image is not obtained.

    - When meal is tapped and shows a detail view, you will see a source link and youtube video link when its is available in JSON file. If it does show up, for either links, when you tap it in xcode preview mode then it won't open. However if you open link in simulator the app redirects it external safari app

