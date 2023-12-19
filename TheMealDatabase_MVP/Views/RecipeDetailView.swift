//
//  MealsDetailView.swift
//  TheMealDatabase_MVP
//
//  Created by Nilay Patel on 12/16/23.
//

import SwiftUI
import Foundation


// The goal of this extension to add space between two pragraphs with no spaces.
// It mutates string replace STANDALONE new line character `\n` with \n\n`
//      `text \n text2` -> `text \n\n text2`
//      `text \n\n text2` -> No Change
//      `text \n\n\n text2` -> `No Change
extension String {
    func formatParagraphAddSpaceLines() -> String {
        do {
            let regex = try NSRegularExpression(pattern: "(?<!\\r?\\n)\\r\\n(?!\\r?\\n)", options: [])
            return regex.stringByReplacingMatches(in: self, options: [], range: NSRange(self.startIndex..., in: self), withTemplate: "\n\n")
        } catch {
            print("Regex error: \(error.localizedDescription)")
            return self
        }
    }
}

struct RecipeDetailView: View {
    let mealDetail: MealsDetail
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading, spacing: 10) {
                // Display recipe image
                
                if let imageUrl = mealDetail.strMealThumb, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: 250)
                                .cornerRadius(16)
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }.padding().frame(maxWidth: .infinity, alignment: .center)
                }
                
                
                Spacer()
                
                // Recipe Title
                Text(mealDetail.strMeal?.capitalized ?? "Unknown")
                    .font(.title)
                    .fontWeight(.bold)
                
                // Recipe Category, Area, Tags
                HStack {
                    Text("Category: \(mealDetail.strCategory ?? "Unknown")")
                    Spacer()
                    Text("Area: \(mealDetail.strArea ?? "Unknown")")
                }
                .foregroundColor(.gray)
                
                
                if let tags = mealDetail.strTags, !tags.isEmpty {
                    Text("Tags: \(tags)")
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Source Link
                if let source = mealDetail.strSource, !source.isEmpty {
                    HStack {
                        Image(systemName: "link.circle.fill")
                            .foregroundColor(.gray)
                        
                        Link("Source", destination: URL(string: source)!)
                            .foregroundColor(.blue)
                    }
                    
                }
                // Youtube Link
                if let youtubeLink = mealDetail.strYoutube, !youtubeLink.isEmpty {
                    HStack {
                        Image(systemName: "play.rectangle.fill")
                            .foregroundColor(.red)
                        
                        Link("Watch on Youtube", destination: URL(string: youtubeLink)!)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                }
                
                
                
                // Ingredients
                Text("Ingredients:")
                    .font(.title2)
                    .fontWeight(.bold)
                
                if let ingredient = mealDetail.strIngredient1, let measure = mealDetail.strMeasure1,   !ingredient.isEmpty,   measure.isEmpty {
                    Text("Ingredient Not Found")
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    if let ingredient = mealDetail.strIngredient1, let measure = mealDetail.strMeasure1,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient2, let measure = mealDetail.strMeasure2,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient3, let measure = mealDetail.strMeasure3,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient4, let measure = mealDetail.strMeasure4,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient5, let measure = mealDetail.strMeasure5,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient6, let measure = mealDetail.strMeasure6,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient7, let measure = mealDetail.strMeasure7,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient8, let measure = mealDetail.strMeasure8,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient9, let measure = mealDetail.strMeasure9,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient10, let measure = mealDetail.strMeasure10,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient11, let measure = mealDetail.strMeasure11,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient12, let measure = mealDetail.strMeasure12,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient13, let measure = mealDetail.strMeasure13,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient14, let measure = mealDetail.strMeasure14,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient15, let measure = mealDetail.strMeasure15,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient16, let measure = mealDetail.strMeasure16,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient17, let measure = mealDetail.strMeasure17,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient18, let measure = mealDetail.strMeasure18,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    
                    if let ingredient = mealDetail.strIngredient19, let measure = mealDetail.strMeasure19,   !ingredient.isEmpty,   !measure.isEmpty {
                        Text("• \(ingredient.capitalized): \(measure)")
                    }
                    

                    
                }
                
                Spacer()
                Spacer()
                
                // Instructions
                Text("Instructions:")
                    .font(.title2)
                    .fontWeight(.bold)
                if let instructions = mealDetail.strInstructions, !instructions.isEmpty {
                    
                    Text(mealDetail.strInstructions?.formatParagraphAddSpaceLines() ?? "No instructions available")
                        .lineLimit(nil)
                }
                
                
            }
            .padding()
            .fixedSize(horizontal: false, vertical: false)
            .multilineTextAlignment(.leading)
            
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Recipe Details")
    }
}

/* Note: We are only using Meal's Id to lookup details in API endpoint.
   Hence, changing `title` and `featuredImage` does not reflect changes in preview
*/

//#Preview {
//    MealDetailsNavigateView(meal:
//                        Meals(id: "52966", title: "", featuredImage: URL(string: "")),
//                    serviceModel: ServiceModel()
//    )
//}

