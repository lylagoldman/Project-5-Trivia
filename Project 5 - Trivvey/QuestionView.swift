//
//  QuestionView.swift
//  Project 5 - Trivvey
//
//  Created by Lyla Goldman on 11/5/25.
//

import SwiftUI


struct QuestionView: View {
    let questions: [Question]
    let index: Int
    @State private var selectedAnswer: String? = nil
    
    func correctAnswer() -> Bool {
        return selectedAnswer == questions[index].answer
    }
    
    private var answerFeedback: some View {
        Group {
            if correctAnswer() {
                VStack {
                    Text("Correct!")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.green)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            } else {
                VStack {
                    Text("Try Again!")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.red)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
    }
    
    var body: some View {
        VStack {
            
            HStack {
                Text(questions[index].question)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal, 20)
                    .frame(width: 360, height: 120)
            }
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.black, lineWidth: 1)
                    .fill(Color.gray.opacity(0.1))
            )
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.bottom, 30)
    
            HStack {
                HStack {
                    Button {
                        selectedAnswer = "A"
                    } label: {
                        Text("A.")
                            .fontWeight(.bold)
                            .font(.title3)
                        Text(questions[index].A)
                            .fontWeight(.medium)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .frame(width: 160, height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 2)
                            .fill(Color.gray.opacity(0.1))
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                
                HStack {
                    Button {
                        selectedAnswer = "B"
                    } label: {
                        Text("B.")
                            .fontWeight(.bold)
                            .font(.title3)
                        Text(questions[index].B)
                            .fontWeight(.medium)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .frame(width: 160, height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 2)
                            .fill(Color.gray.opacity(0.1))
                    )
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 30)
            }
            .padding(.bottom, 10)
            
            HStack {
                Button {
                    selectedAnswer = "C"
                } label: {
                    HStack {
                        Text("C.")
                            .fontWeight(.bold)
                            .font(.title3)
                        Text(questions[index].C)
                            .fontWeight(.medium)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .frame(width: 160, height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 2)
                            .fill(Color.gray.opacity(0.1))
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 30)
                
                Button {
                    selectedAnswer = "D"
                } label: {
                    HStack {
                        Text("D.")
                            .fontWeight(.bold)
                            .font(.title3)
                        Text(questions[index].D)
                            .fontWeight(.medium)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .frame(width: 160, height: 80)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 2)
                            .fill(Color.gray.opacity(0.1))
                    )
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 30)
            }
            .padding(.top, 30)
            
            if selectedAnswer != nil {
                answerFeedback
                    .padding(.top, 20)
            }
            
            Spacer()
        }
    }
}

