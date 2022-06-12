//
//  ContentView.swift
//  SwiftUI Resizable Sheet
//
//  Created by Santiago Mattiauda on 10/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedCourse: Course?

    var body: some View {
        NavigationStack {
            List {
                ForEach(courses,id: \.id){ course in
                    CourseRow(course: course)
                        .onTapGesture {
                            self.selectedCourse = course
                        }.listRowSeparator(.hidden)
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle(Text("Swift Courses"))

        }
        .sheet(item: self.$selectedCourse) { course in
            CourseDetailView(course:course)
                .presentationDetents([
                    .medium,
                    .large
                ])
                .presentationDragIndicator(.visible)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
