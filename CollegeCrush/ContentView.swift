//
//  ContentView.swift
//  CollegeCrush
//
//  Created by Anshumali Karna on 18/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @AppStorage("isAuth") var isAuth: Bool = false
    var body: some View {
        NavigationStack {
            if isAuth {
                
            } else {
                GettingStartedView()
            }
        }
    }

    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
