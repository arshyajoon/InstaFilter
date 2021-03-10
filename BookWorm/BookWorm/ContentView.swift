//
//  ContentView.swift
//  BookWorm
//
//  Created by Arshya GHAVAMI on 2/17/21.
//

import SwiftUI

struct Student  {
    var id: UUID
    var name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book2.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book2.title, ascending: true),
        NSSortDescriptor(keyPath: \Book2.author, ascending: true)
    ]) var books: FetchedResults<Book2>

    @State private var showingAddScreen = false
    
    func isOneStar(book: Book) -> Color {
        if book.rating == 1 {
            return Color.red
        }
        return Color.black
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let book = books[offset]

            // delete it from the context
            moc.delete(book)
        }

        // save the context
        try? moc.save()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown Title")
                                .foregroundColor(book.rating == 1 ? .red : .black)
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
               .navigationBarTitle("Bookworm")
            .navigationBarItems(leading: EditButton(), trailing: Button(action:{
                   self.showingAddScreen.toggle()
               }) {
                   Image(systemName: "plus")
               })
               .sheet(isPresented: $showingAddScreen) {
                   AddBookView().environment(\.managedObjectContext, self.moc)
               }
       }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    @Environment(\.managedObjectContext) var moc
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, moc)
//    }
//}
