//
//  ContentView.swift
//  Word Scrabble
//
//  Created by Nikhi on 07/08/20.
//  Copyright © 2020 nikhit. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Word", text: $newWord, onCommit: addWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text("\($0)")
                }
            }.navigationBarTitle(rootWord)
            .onAppear(perform: startGame)
            .alert(isPresented: $showingError) {
                    Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }.navigationBarItems(trailing:
                VStack {
                    Button("New Game"){
                                       self.usedWords = []
                                       self.rootWord = ""
                                       self.newWord = ""
                                       self.startGame()
                    }
                    Text("Score: \(score)")
                })
        }
        
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message;
        showingError = true
    }
    func addWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 3 else {
            wordError(title: "Whoops!", message: "Enter a word with 3 or more characters")
            return
        }
        // Check word
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already!", message: "Be more original")
            return
        }
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "This isn't a real word")
            return
        }
        score += 1
        usedWords.insert(answer, at: 0)
        newWord = ""
        
    }
    
    
    
    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
            }
        } else {
            fatalError("Could not load start.txt from bundle.")
        }
        
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false;
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound ? true : false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
