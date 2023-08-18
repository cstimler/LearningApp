//
//  ContentDetailView.swift
//  Chris Module 5 L1 LearningApp
//
//  Created by October2022 on 8/11/23.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    // my trying
 //   @State var navigated = false
    
    var body: some View {
        
        let lesson = model.currentLesson
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        
        
        // NavigationStack {
        VStack {
            
            
            if url != nil {
                
                // only show video if we get a valid URL
                
                VideoPlayer(player: AVPlayer(url: url!))
                    .cornerRadius(10)
            }
            
            // TODO: Description
            CodeTextView()
            // Show next lesson button only if there is a next lesson
            
            if model.hasNextLesson() {
                
                Button(action: {
                    // Advance the lesson
                    model.nextLesson()
                    
                    
                }, label: {
                    
                    ZStack {
                        
                        RectangleCard(color: Color.green)
                            .frame(height:48)
                        Text("Next Lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)")
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                    
                    
                    
                })
                
            }
            
            else {
                // Show the complete button instead
                
                VStack {
                    Button(action: {
                        // Take the user back to the home view
                        
                            model.currentContentSelected = nil
      //                  navigated = true
                        
                    }, label: {
                        
                        ZStack {
                            
                            RectangleCard(color: Color.green)
                                .frame(height:48)
                            Text("Complete")
                                .foregroundColor(.white)
                                .bold()
                            
                        }
                        
                        
                        
                        
                    })
                }
                
            }
            
        }
        .padding()
        .navigationBarTitle(lesson?.title ?? "")
     //   .navigationDestination(isPresented: $navigated)
   //     {  HomeView()
            
   //     }
    }
}


struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView().environmentObject(ContentModel())
    }
}
