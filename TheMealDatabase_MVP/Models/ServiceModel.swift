//
//  ServiceModel.swift
//  TheMealDatabase_MVP
//
//  Created by Nilay Patel on 12/16/23.
//

import Foundation

class ServiceModel: ObservableObject {
    
    @Published var meals: [Meals] = []
    @Published var mealsDetail: MealsDetail?
    
    func fetchMeals() async throws {
        var request = URLRequest(url: URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!)
        let (data, _ ) = try await URLSession.shared.data(for: request)
        let mealsResponse = try JSONDecoder().decode(MealsResponse.self, from: data)
        meals = mealsResponse.meals
    }
    
    func fetchMealsDetails(id: String) async throws {
        print("id is \(id)")
        var request = URLRequest(url: URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!)
        let (data, _ ) = try await URLSession.shared.data(for: request)
        let mealsDetailResponse = try JSONDecoder().decode(MealsDetailResponse.self, from: data)
        mealsDetail = mealsDetailResponse.meals[0]
        print(data)
        print(mealsDetail)
    }
}
