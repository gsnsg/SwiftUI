//
//  ContentView.swift
//  Bookworm
//
//  Created by Nikhi on 26/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    
    
    var body: some View {
        NavigationView {
            List{
                ForEach(books, id: \.id) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown Title")
                                .foregroundColor(book.rating == 1 ? Color.red : Color.black)
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                    
                }.onDelete(perform: deleteBooks)
            }
            .navigationBarTitle("Bookworm")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddScreen.toggle()
            }) {
                Image(systemName: "plus")
            })
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView().environment(\.managedObjectContext, self.context)
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            context.delete(book)
        }
        try? context.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
