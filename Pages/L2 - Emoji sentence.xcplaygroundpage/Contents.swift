//
//  Lab #2 - Emoji replacer
//  Created by Иван Дахненко on XX.11.2019.
//  Copyright © 2019 Ivan Dakhnenko. All rights reserved.
//

import Foundation

let sentence = "I have one apple and two books!"

let emojiList = EmojiList().getList()
var replacedSentence = ""
let words = sentence.components(separatedBy: " ")
for word in words {
    if let emoji = emojiList[word] {
        // if is is just emoji, replace it.
        replacedSentence.append(emoji)
    } else {
        // else try to remove first and last character,
        // as there cound be punctuation marks with no spaces between them.
        var wordTemp = word
        let lastCchar = wordTemp.remove(at: word.index(before: word.endIndex))
        if let emoji = emojiList[wordTemp] {
            replacedSentence.append(emoji)
            replacedSentence.append(lastCchar)
        } else {
            wordTemp = word
            let firstChar = wordTemp.remove(at: word.startIndex)
            if let emoji = emojiList[wordTemp] {
                replacedSentence.append(firstChar)
                replacedSentence.append(emoji)
            } else {
                // nothing found, meaning it's just a word
                replacedSentence.append(word)
            }
        }
    }
    replacedSentence.append(" ")
}

print(replacedSentence)

