//
//  SwiftUIView.swift
//  LearnSwift
//
//  Created by Куат Оралбеков on 25.09.2023.
//

import SwiftUI
import LanguageSupport
import CodeEditorView



struct SwiftUIView: View {
    
    struct TextLocated<Entity>: Hashable, Equatable
    {
        static func == (lhs: SwiftUIView.TextLocated<Entity>, rhs: SwiftUIView.TextLocated<Entity>) -> Bool {
            return lhs.identifier == rhs.identifier
        }
        
        var identifier: String {
                return UUID().uuidString
            }
            
            public func hash(into hasher: inout Hasher) {
                return hasher.combine(identifier)
            }
            
          
        
        
        
        
        
        
        
      let location: TextLocation
      let entity:   Entity
    }

    struct TextLocation {
      let zeroBasedLine:   Int   // starts from line 0
      let zeroBasedColumn: Int   // starts from column 0
    }
    
    
    @State private var text:     String                    = "My awesome code..."
      @State private var position: CodeEditor.Position       = CodeEditor.Position()
      @State private var messages: Set<TextLocated<Message>> = Set()

      @Environment(\.colorScheme) private var colorScheme: ColorScheme

      var body: some View {
          
          
          CodeEditor(text: $text, position: $position, messages: $messages, language: .swift())
          .environment(\.codeEditorTheme,
                       colorScheme == .dark ? Theme.defaultDark : Theme.defaultLight)
      }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
