//
//  MyQueue.swift
//  Stack and Queue
//
//  Created by Aseel Alshohatee on 6/12/19.
//  Copyright © 2019 Aseel Alshohatee. All rights reserved.
//

import Foundation


struct MyQueue<Element> {
    var items: [Element] = [Element]();
    
    var count: Int {   //computed property
        return items.count;
    }
    
    // MARK: - Mutating methods
    mutating func enqueue(_ item: Element) {
        items.append(item);
    }
    
    mutating func dequeue() -> Element {
        guard !items.isEmpty else {
            fatalError("can't take blood from a stone");
        }
        return items.removeFirst();
    }
}

extension MyQueue {
    //to make it easy to display the MyQueue in a UITableView
    // Item 0 is the first one enqueue.
    // Item count - 1 is the most recently dequeue.
    
    func get(_ i: Int) -> Element {
        guard (0 ..< count).contains(i) else {
            fatalError("can't get item \(i) of \(count)");
        }
        return items[i];
    }
}


