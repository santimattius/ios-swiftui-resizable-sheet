//
//  CourseDetailView.swift
//  SwiftUI Resizable Sheet
//
//  Created by Santiago Mattiauda on 10/6/22.
//

import SwiftUI

struct CourseDetailView: View {
    var course: Course

    var body: some View {
        VStack(alignment: .center) {
            HeaderView(course: self.course)
            DescriptionView(icon: nil,content: self.course.description)
            Spacer(minLength: 12.0)
        }
    }
}

struct TitleBar: View{
    var titleText: String
    var body: some View{
        Text(titleText)
        .font(.headline)
        .foregroundColor(.primary)
        .padding()
    }
}

struct HeaderView: View{
    var course: Course
    
    var body: some View{
        Image(course.image)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Spacer()
                        Text(course.name)
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                        Text(course.level.description)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(course.level.color)
                            .cornerRadius(5)
                    }
                    Spacer()
                }
            .padding()
        )
    }
}

struct DescriptionView: View{
    var icon: String?
    var content: String
    
    var body: some View{
        HStack{
            if icon != nil{
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(content)
                .font(.system(.body, design: .rounded))
            Spacer()
        }.padding(.horizontal)
    }
}


struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: courses[0])
    }
}
