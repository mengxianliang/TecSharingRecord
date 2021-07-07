//
//  LinkedList.swift
//  LinkedListDemo
//
//  Created by mxl on 2021/7/7.
//  双向链表

import UIKit

private class DoubleListNode {
    /// 定义属性
    public var val: Int
    public var prev: DoubleListNode?
    public var next: DoubleListNode?
    
    /// 初始化方法
    public init(_ val: Int, _ prev: DoubleListNode?,_ next: DoubleListNode?) {
        self.prev = prev
        self.val = val
        self.next = next
    }
}


class LinkedList: NSObject {
    /// 链表的长度
    var size: Int = 0
    /// 头节点指针
    private var first: DoubleListNode?
    /// 尾节点指针
    private var last: DoubleListNode?
    
    /// 增，在index位置添加元素
    func add(_ index: Int, _ value: Int) {
        if index == size {/// 在尾部插入节点
            let lastNode = last
            let newNode = DoubleListNode.init(value, lastNode, nil)
            last = newNode
            
            if lastNode == nil {/// 如果链表是空的情况
                first = last
            }else {
                lastNode?.next = newNode
            }
        }else {
            /// 读取插入位置节点
            let node = nodeOf(index)
            /// 读取插入位置节点的prev
            let prev = node?.prev
            
            let newNode = DoubleListNode.init(value, prev, node)
            newNode.next = node
            newNode.prev = prev
            
            node?.prev = newNode
            
            if prev == nil {/// 插入位置是头节点
                first = newNode
            }else {/// 中间节点
                prev?.next = newNode
            }
        }
        

        //size+1
        size += 1
    }

//    /// 删，删除index位置的元素
//    func remove(_ index: Int) {
//        //在0的位置插入需要特殊处理
//        if index == 0 {
//            head = head?.next
//        }else {
//            //获取插入位置的前一个节点
//            let prevNode = nodeOf(index - 1)
//            prevNode?.next = prevNode?.next?.next
//        }
//        size -= 1
//    }
//
//
//    /// 改，修改链表index位置节点的元素
//    func set(_ index: Int, _ value: Int) {
//        let node = nodeOf(index)
//        node?.val = value
//    }
//
//    /// 查，读取index位置的元素
//    func valueOfIndex(_ index: Int) -> Int {
//        return nodeOf(index)?.val ?? 0
//    }

    /// 清空链表
    func clear() {
        size = 0
        
        /// 清空prev指针
        var node = first
        while node != nil {
            node?.prev = nil
            node = node?.next
        }
        
        first = nil
        last = nil
    }
//
//    /// 打印链表
//    func printLinkedList() {
//        var string = "["
//        guard head != nil else {
//            print("linked list is empty !,size = \(size)")
//            return
//        }
//        var tempNode = head
//        while tempNode != nil {
//            string.append("\(tempNode?.val ?? 0)")
//            if tempNode?.next != nil {
//                string.append(",")
//            }
//            tempNode = tempNode?.next
//        }
//        string.append("],size = \(size)")
//        print(string)
//    }
    
    /// 读取index位置的节点
    private func nodeOf(_ index: Int) -> DoubleListNode? {
        if index < size/2 {/// 靠近头节点
            var node = first
            for _ in 0...index {
                node = node?.next
            }
            return node ?? nil
        }else {/// 靠近尾节点
            var node = last
            for _ in stride(from: size - 1, through:index, by: -1) {
                node = node?.prev
            }
            return node ?? nil
        }
    }
    
}
