//
//  AddBookView.swift
//  Bookworm
//
//  Created by Nikhi on 26/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        let newBook = Book(context: self.context)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.genre = self.genre
                        newBook.rating = Int16(self.rating)
                        newBook.review = self.review
                        newBook.createdAt = Date()
                        newBook.id = UUID()
                        try? self.context.save()
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
