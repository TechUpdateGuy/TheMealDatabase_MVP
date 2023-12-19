//
//  ContentView.swift
//  TheMealDatabase_MVP
//
//  Created by Nilay Patel on 12/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchTerm: String = ""
    @State private var filteredMeals: [Meals] = []
    @StateObject private var serviceModel = ServiceModel()
    @State private var selectedMeal: Meals?

    // Search Within List
    private func performSearch(keyword: String) {
        filteredMeals = serviceModel.meals.filter { meal in
            meal.title?.contains(keyword) ?? false
        }
    }

    // If search cannot filter meals from list. Show all meals as default
    private var meals: [Meals] {
        filteredMeals.isEmpty ? serviceModel.meals : filteredMeals
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    // List of meals
                    ForEach(meals.sorted(by: { $0.title ?? "" < $1.title ?? "" })) { meal in
                        HStack {
                            // Image
                            AsyncImage(url: meal.previewThumbnail) { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 100, maxHeight: 100)
                            } placeholder: {
                                Text("Loading...")
                            }
                            // Title
                            Text(meal.title ?? "")
                        }
                        .onTapGesture {
                            selectedMeal = meal
                        }
                    }
                }
                // Capture search term
                .searchable(text: $searchTerm)
                // Search for item in list
                .onChange(of: searchTerm) { newValue in
                    performSearch(keyword: newValue)
                }
                // Load JSON data and display it in App
                .task {
                    do {
                        try await serviceModel.fetchMeals()
                    } catch {
                        print(error)
                    }
                }
                // Navigate to detail View when item is tapped
                .sheet(item: $selectedMeal) { meal in
                    MealDetailsNavigateView(meal: meal, serviceModel: serviceModel)
                }
            }
        }
    }
}


// Show Details of Meal. But if it takes time fetching JSON data, Show Progresss View
struct MealDetailsNavigateView: View {
    let meal: Meals
    @StateObject var serviceModel: ServiceModel
    @State private var mealDetail: MealsDetail?

        // Fetch Meals deatil by MEAL_ID
        func fetchMealDetails() {
            if let mealId = meal.id {
                Task {
                    do {
                        try await serviceModel.fetchMealsDetails(id: mealId)
                        mealDetail = serviceModel.mealsDetail
                    } catch {
                        print(error)
                    }
                }
            }
        }

        // Waiting Logic incase data loads slow
        var body: some View {
            NavigationView {
                if let mealDetail = mealDetail {
                    RecipeDetailView(mealDetail: mealDetail)
                } else {
                    ProgressView()
                }
            }
            .onAppear {
                fetchMealDetails()
            }
        }
}

// The basic syntax
//#Preview {
//    ContentView()
//}
