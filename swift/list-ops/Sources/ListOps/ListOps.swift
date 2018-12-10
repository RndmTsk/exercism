//Solution goes in Sources
struct ListOps {
    static func append<Element>(_ lhs: [Element], _ rhs: Element) -> [Element] {
        return append(lhs, [rhs])
    }

    static func append<Element>(_ lhs: [Element], _ rhs: [Element]) -> [Element] {
        return foldLeft(rhs, accumulated: lhs) { $0 + [$1] }
    }

    static func concat<Element>(_ elements: [Element] ...) -> [Element] {
        return foldLeft(elements, accumulated: [Element](), combine: append)
    }

    static func filter<Element>(_ elements: [Element], seive: (Element) -> Bool) -> [Element] {
        return foldLeft(elements, accumulated: [Element]()) { seive($1) ? append($0, $1) : $0 }
    }

    static func length<Element>(_ container: [Element]) -> Int {
        return foldLeft(container, accumulated: 0) { accumulator, _ in accumulator + 1 }
    }

    static func map<Element, TransformedElement>(_ elements: [Element], transform: (Element) -> TransformedElement) -> [TransformedElement] {
        return foldLeft(elements, accumulated: [TransformedElement]()) { append($0, transform($1)) }
    }

    static func foldLeft<Element, FoldedElement>(_ elements: [Element], accumulated: FoldedElement, combine: (FoldedElement, Element) -> FoldedElement) -> FoldedElement {
        var result = accumulated
        for element in elements {
            result = combine(result, element)
        }
        return result
    }

    static func foldRight<Element, FoldedElement>(_ elements: [Element], accumulated: FoldedElement, combine: (Element, FoldedElement) -> FoldedElement) -> FoldedElement {
        return foldLeft(reverse(elements), accumulated: accumulated) { combine($1, $0) }
    }

    static func reverse<Element>(_ elements: [Element]) -> [Element] {
        var result = [Element]()
        let elementCount = elements.count
        for index in 0..<elementCount {
            let reversedIndex = elementCount - index - 1
            result.append(elements[reversedIndex])
        }
        return result
    }
}
