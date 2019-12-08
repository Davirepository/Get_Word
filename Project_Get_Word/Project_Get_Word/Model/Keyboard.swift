//
//  Keyboard.swift
//  Project_Get_Word
//
//  Created by Давид on 08/12/2019.
//  Copyright © 2019 David. All rights reserved.
//

import Foundation

struct Keyboard {
    let letters: [String]
}

extension Keyboard {
    static var all: [String] {
        return ["А","Б","В","Г","Д","Е","Ё","Ж","З","И","Й","К","Л","М","Н","О","П","Р","С","Т","У","Ф","Х","Ц","Ч","Ш","Щ","Ъ"," ","Ы","Ь","Э","Ю","Я"," "]
    }
}
