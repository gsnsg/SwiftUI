//
//  DetailView.swift
//  Bookworm
//
//  Created by Nikhi on 26/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        return GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)

                    VStack {
                        Text(self.book.genre?.uppercased() ?? "FANTASY")
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(8)
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.75))
                            .clipShape(Capsule())
                            .offset(x: -5, y: -5)
                        Text(self.dateString(from: self.book.createdAt!))
                            .foregroundColor(.white)
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(.bottom)
                    }
                }
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)

                Text(self.book.review ?? "No review")
                    .padding()

                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)

                Spacer()
                
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Delete book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delete")) {
                    self.deleteBook()
                }, secondaryButton: .cancel()
            )
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }) {
            Image(systemName: "trash")
        })
        
    }
    func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateStr = formatter.string(from: date)
        return dateStr
    }
    
    func deleteBook() {
        context.delete(book)
        try? context.save()
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        
        let book = Book(context: context)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."

        return NavigationView {
            DetailView(book: book)
        }
    }
}
