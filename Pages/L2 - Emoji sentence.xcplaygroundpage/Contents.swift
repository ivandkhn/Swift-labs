//
//  Lab #2 - Emoji replacer
//  Created by Иван Дахненко on 20.11.2019.
//  Copyright © 2019 Ivan Dakhnenko. All rights reserved.
//

import Foundation

let sentences = [
    "I have one apple and two books!",
    "Please use key to open this door!",
    "I have got cat and dog"
]

let emojiList = EmojiList().getList()



/// Replaces word with the appripliate emoji symbol.
/// Punctuation marks on string edges are preserved.
func getEmojiRepresentation(forWord word: String) -> String? {
    if let emoji = emojiList[word] {
        return emoji
    }
    var wordTemp = word
    let lastChar = wordTemp.remove(at: word.index(before: word.endIndex))
    
    // Check ascii value to be sure that we didn't remove a letter.
    // Without this, come weird results cound happen, like "open" -> "o🖊", "use" -> "🇺🇸e".
    if let asciiValue = lastChar.asciiValue, asciiValue < 65, let emoji = emojiList[wordTemp] {
        return "\(emoji)\(lastChar)"
    }
    wordTemp = word
    let firstChar = wordTemp.remove(at: word.startIndex)
    if let asciiValue = firstChar.asciiValue, asciiValue < 65, let emoji = emojiList[wordTemp] {
        return "\(firstChar)\(emoji)"
    }
    return nil
}

for sentence in sentences {
    var replacedSentence = ""
    let words = sentence.components(separatedBy: " ")
    for word in words {
        if let replaced = getEmojiRepresentation(forWord: word) {
            replacedSentence.append(replaced)
        } else {
            replacedSentence.append(word)
        }
        replacedSentence.append(" ")
    }
    print(replacedSentence)
}
