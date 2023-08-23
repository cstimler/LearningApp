//
//  TestResultView.swift
//  Chris Module 5 L1 LearningApp
//
//  Created by October2022 on 8/23/23.
//

import SwiftUI

struct TestResultView: View {
    
    @EnvironmentObject var model:ContentModel
    
    var numCorrect: Int
    
    var resultHeading: String {
        
        guard model.currentModule != nil else {
            
        return ""
        }
        
        let pct = Double(numCorrect)/Double(model.currentModule!.test.questions.count)
       
        if pct > 0.5 {
            
            return "Awesome"
        } else if pct > 0.2 {
            
            return "Doing great!"
            
        } else {
            
            return "Keep learning."
        }
    }
    
    var body: some View {
        
        VStack {
            Spacer()
            Text(resultHeading)
                .font(.title)
            Text("You got \(numCorrect) out of \(model.currentModule?.test.questions.count ?? 0) questions")
            Spacer()
            Button(action: {
                // Send the user back to the home view
                
                model.currentTestSelected = nil
            }
                   
                   ,
                   
                   label: {
                
                ZStack {
                    
                    RectangleCard(color: .green)
                        .frame(height: 48)
                    
                    Text("Completed")
                        .bold()
                        .foregroundColor(.white)
                }
               
                
                
            })
            .padding()
            Spacer()
            
        }
        
        
        
    }
}

