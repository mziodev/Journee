//
//  ContentView.swift
//  Journee
//
//  Created by MZiO on 7/5/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Query(
        sort: \Log.creationDate,
        order: .reverse
    ) private var allLogs: [Log]
    
    
    /*
     This is a second Query for this view, it's a filtered-predicate one but I need to compare the dates without the time part
     
     Watch this link out (dynamic queries): https://www.hackingwithswift.com/quick-start/swiftdata/filtering-the-results-from-a-swiftdata-query
     
     AI responded this (it's interesting for the Date extension):
     
     struct MyView: View {
         @Query(Person.self, where: { $0.createdAt?.dateOnly == Date.now.dateOnly }) var peopleCreatedToday: [Person]

         var body: some View {
             VStack {
                 // Display people created today
                 ForEach(peopleCreatedToday) { person in
                     Text(person.name)
                 }
             }
         }
     }

     extension Date {
         var dateOnly: Date {
             let calendar = Calendar.current
             let components = calendar.dateComponents([.year, .month, .day], from: self)
             return calendar.date(from: components) ?? self
         }
     }

    */
    
    static var today: Date {
        Date.now
    }
    
    @Query(filter: #Predicate<Log> { $0.creationDate == today }) var todayLogs: [Log]
    
    @Environment(\.modelContext) var modelContext
    
    @State private var showingNewLogView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(allLogs, id: \.creationDate) { log in
                    NavigationLink(destination: LogView(log: log)) {
                        LogRowView(log: log)
                    }
                }
                .onDelete(perform: deleteLogs)
            }
            .navigationTitle("Journee")
            .navigationDestination(isPresented: $showingNewLogView) {
                let newLog = Log(
                    creationDate: .now,
                    modificationDate: .now,
                    content: ""
                )
                
                LogView(log: newLog)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Text("\(allLogs.count) entries")
                        .font(.caption)
                    Spacer()
                    Button {
                        if allLogs.count > 0 { }
                        showingNewLogView = true
                    } label: {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
            .toolbarBackground(.visible, for: .bottomBar)
        }
    }
    
    func deleteLogs(at offSets: IndexSet) {
        for offSet in offSets {
            let log = allLogs[offSet]
            
            modelContext.delete(log)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
