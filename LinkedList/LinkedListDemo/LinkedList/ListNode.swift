//
//  ListNode.swift
//  LinkedListDemo
//
//  Created by mxl on 2021/6/3.
//

import UIKit

public class ListNode {
    //节点中的value，保存数据
    public var val: Int
    //节点中的next指针，指向下一个节点
    public var next: ListNode?
    
    //初始化方法
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
