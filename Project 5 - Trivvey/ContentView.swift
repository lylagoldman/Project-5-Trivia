//
//  ContentView.swift
//  Project 5 - Trivvey
//
//  Created by Lyla Goldman on 11/4/25.

import SwiftUI

struct Question: Decodable, Identifiable {
    let id = UUID()
    let question: String
    let A: String
    let B: String
    let C: String
    let D: String
    let answer: String
}

func decode() -> [Question] {
    guard let url = Bundle.main.url(forResource: "questions", withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let decodedQuestions = try? JSONDecoder().decode([Question].self, from: data) else {
        return []
    }
    return decodedQuestions
}

struct ContentView: View {
    @State private var decodedQuestions = decode()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(decodedQuestions.prefix(10).indices, id: \.self) { index in
                    NavigationLink {
                        QuestionView(questions: decodedQuestions, index: index)
                    } label: {
                        Text(decodedQuestions[index].question)
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                }
            }
                
            .navigationTitle("Trivvey")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { decodedQuestions.shuffle()
                    } label: {
                        Image(systemName: "shuffle")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
