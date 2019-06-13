//
//  MyStack.swift
//  Stack and Queue
//
//  Created by Aseel Alshohatee on 6/12/19.
//  Copyright © 2019 Aseel Alshohatee. All rights reserved.
//


import Foundation;

// a generic struct.

struct MyStack<Element> {
    var items: [Element] = [Element]();
    
    var count: Int {   //computed property
        return items.count;
    }
    
    // MARK: - Mutating methods
    
    mutating func push(_ item: Element) {
        items.append(item);
    }
    
    mutating func pop() -> Element {
        guard !items.isEmpty else {
            fatalError("can't take blood from a stone");
        }
        return items.removeLast();
    }
}

extension MyStack {
    //To make it easy to display the MyStack in a UITableView
    // Item 0 is the first one pushed.
    // Item count - 1 is the most recently pushed.
    
    func get(_ i: Int) -> Element {
        guard (0 ..< count).contains(i) else {
            fatalError("can't get item \(i) of \(count)");
        }
        return items[i];
    }
}

