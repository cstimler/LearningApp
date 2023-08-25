//
//  ContentViewRow.swift
//  Chris Module 5 L1 LearningApp
//
//  Created by October2022 on 8/9/23.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index:Int
    
    var body: some View {
        if model.currentModule != nil && model.currentModule!.content.lessons.count > index { // added this as bug fix
            let lesson = model.currentModule!.content.lessons[index]
            
            
            // Lesson card
            
            ZStack (alignment: .leading) {
                
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .frame(height: 66)
                
                HStack (spacing: 30) {
                    Text(String(index + 1))
                        .bold()
                    VStack (alignment: .leading){
                        
                        Text(lesson.title)
                        Text(lesson.duration)
                    }
                    
                }
                .padding()
            }
            .padding(.bottom, 5)
        }
    }
}
/*
struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRow()
    }
}
*/
