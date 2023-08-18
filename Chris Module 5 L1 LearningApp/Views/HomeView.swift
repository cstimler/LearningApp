//
//  HomeView.swift
//  Chris Module 5 L1 LearningApp
//
//  Created by October2022 on 8/4/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading){
                Text("What do you want to do today?")
                    .padding(.leading, 20)
                // NavigationView
                ScrollView {
                    
                    LazyVStack {
                        
                        ForEach(model.modules) { module in
                            
                            
                            VStack (spacing: 20){
                                
                                
                                NavigationLink(destination: ContentView().onAppear(perform: {
                                    
                                    model.beginModule(module.id)
                             //       let _ = print("Module ID learn is  \(module.id)")
                                    
                                    
                                }),
                                               tag:(module.id),
                                               selection: $model.currentContentSelected,
                                               label:
                                                {
                                                HomeViewRow(image: module.content.image, title:"Learn \(module.category)", description: module.content.description, count: "\(module.content.lessons.count) Lessons", time: module.content.time)
                                               })
                            
                                
                                // Learning card
                                NavigationLink(destination: TestView()
                                    .onAppear(perform: {
                                        model.beginTest(module.id)
                                //        let _ = print("Module ID test is  \(module.id)")
                                    }), tag:module.id, selection: $model.currentTestSelected)
                                {
                                    
                                    // Test card
                                    HomeViewRow(image: module.test.image, title:"\(module.category) Test", description: module.test.description, count: "\(module.test.questions.count) Lessons", time: module.test.time)
                                }
                                
                      //          NavigationLink(destination: EmptyView()) {
                        //            EmptyView()
               //                 }
                            }
                            
                        }
                    }
                    .padding()
                    .accentColor(.black)
                    
                }
                
            }
            .navigationTitle("Get Started")
           // .navigationBarBackButtonHidden(true)
            
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ContentModel())
    }
}
