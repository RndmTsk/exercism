//Solution goes in Sources

extension Collection {
    func accumulate<TransformedElement>(_ transform: (Element) -> TransformedElement) -> [TransformedElement] {
        // It is nonsense to avoid using map here, it simply iterates through each element applying a function.
        return map { transform($0) }

        /* The same can be accomplished with creating a temporary and a for-loop or forEach
         var temp: [TransformedElement]
         for element in self {
             temp.append(transform(element))
         }
         return temp
         */
    }
}
