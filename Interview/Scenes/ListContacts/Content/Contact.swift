import Foundation

struct Contact {
    var id: Int
    var name: String = ""
    var photoURL = ""
    var isLegacy: Bool
    
    init(id: Int, name: String, photoURL: String, isLegacy: Bool) {
        self.id = id
        self.name = name
        self.photoURL = photoURL
        self.isLegacy = isLegacy
    }
}
