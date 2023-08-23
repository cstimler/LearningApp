//
//  TestView.swift
//  Chris Module 5 L1 LearningApp
//
//  Created by October2022 on 8/16/23.
//

import SwiftUI

struct TestView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var selectedAnswerIndex:Int?
    @State var numCorrect = 0
    @State var submitted = false
    
    var body: some View {
        
        if model.currentQuestion != nil {
            
            VStack (alignment: .leading){
                // Question number
                Text("Question \(model.currentQuestionIndex + 1) of \(model.currentModule?.test.questions.count ?? 0)")
                    .padding(.leading, 20)
                
                // Question
                CodeTextView()
                    .padding(.horizontal, 20)
                // Answers
                ScrollView {
                    VStack {
                        
                        ForEach(0..<model.currentQuestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                // Track the selected index
                                
                                selectedAnswerIndex = index
                            } label: {
                                ZStack {
                                    // Answer has not been submitted
                                    if submitted == false {
                                        
                                        RectangleCard(color: index == selectedAnswerIndex ? .gray : .white)
                                            .frame(height: 48)
                                        
                                    }
                                    else {
                                        // Answer has been submitted
                                        
                                        
                                        
                                        if index == selectedAnswerIndex && index == model.currentQuestion!.correctIndex {
                                            
                                            RectangleCard(color: Color.green)
                                                .frame(height: 48)
                                        }
                                        else if index == selectedAnswerIndex && index != model.currentQuestion!.correctIndex {
                                          // User has selected the wrong answer
                                            // Show a red background
                                            RectangleCard(color: Color.red)
                                                .frame(height: 48)
                                            
                                        } else if index == model.currentQuestion!.correctIndex {
                                            
                                            RectangleCard(color: Color.green)
                                                .frame(height: 48)
                                            
                                        }
                                        else {
                                            
                                            RectangleCard(color: .white)
                                                .frame(height: 48)
                                            
                                            
                                        }
                                        
                                        
                                        
                                    }
                                    
                                    
                                    
                                    Text(model.currentQuestion!.answers[index])
                                }
                                
                                
                            }
                            .disabled(submitted)
                            
                            
                            
                        }
                    }
                    .accentColor(.black)
                    .padding()
                    
                }
                // Button
                
                Button {
                    
                    // Check if answer has been submitted
                    if submitted == true {
                        
                        // Answer has already been submitted, move to next question
                        
                        model.nextQuestion()
                        submitted = false
                        selectedAnswerIndex = nil
                        
                        
                    }
                        else {
                            
                            // Submit the answer
                            // Change submitted state as true
                            submitted = true
                            
                            // Check the answer and increment the counter if correct
                            if selectedAnswerIndex == model.currentQuestion!.correctIndex {
                                
                                numCorrect += 1
                           //     let _ = print(numCorrect)
                            }
                        }
                    
                   
                } label: {
                    ZStack {
                        
                        
                        RectangleCard(color: .green)
                            .frame(height: 48)
                        Text(buttonText)
                            .foregroundColor(.white)
                            .bold()
                        
                        // Answer has been submitted
                        
                        
                        
                    }
                    
                }
                .padding()
                .disabled(selectedAnswerIndex == nil)
             //   .disabled(submitted)
            }
            .navigationBarTitle("\(model.currentModule?.category ?? "") Test")
        }
            
        else {
            // If current question is nil, we show the testresultview
         //   ProgressView()
            TestResultView(numCorrect: numCorrect)
        }
        
    }
    
    var buttonText:String {
        
        // Check if answer has been submitted
        if submitted == true {
            
            if model.currentQuestionIndex + 1 == model.currentModule!.test.questions.count {
                // This is the last question
                return "Finish"
                
            }
            
            else {
                
                return "Next"  // or finished
            }
            
           
        } else {
            return "Submit"
        }
        
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(ContentModel())
    }
}
