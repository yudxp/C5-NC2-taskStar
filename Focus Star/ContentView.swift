//
//  ContentView.swift
//  Focus Star
//
//  Created by Yudha Hamdi Arzi on 21/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var showingSheet = false
  
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
              Section{
                ForEach(items.prefix(4)) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                        // Find all task on that target
                    } label: {
                        Image(systemName: "repeat.circle")
                        .padding()
                        Text(item.timestamp!, formatter: itemFormatter)
                        .frame(height: 60.0)
                    }
                }
                .onDelete(perform: deleteItems)
              }
              Section{
                Text("Region")
              }
            }
            .navigationTitle("TARGET")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                  HStack {
                    Button("+") {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        TargetView()
                    }
                  }
                }
              
            }
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//  private func addItem(){
//    showingSheet.toggle()
//    self.sheet(isPresented: $showingSheet){
//      TargetView()
//    }
//  }
  

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
