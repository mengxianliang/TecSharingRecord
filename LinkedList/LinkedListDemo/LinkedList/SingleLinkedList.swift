//
//  LinkedList.swift
//  LinkedListDemo
//
//  Created by mxl on 2021/6/3.
//  单向链表

import UIKit

class SingleLinkedList {
    /// 链表的长度
    var size: Int = 0
    /// 头节点指针
    private var head: ListNode?
        
    /// 增，在index位置添加元素
    func add(_ index: Int, _ value: Int) {
        
        //在0的位置插入需要特殊处理
        if index == 0 {
            //新建一个节点,next指针指向第一个节点的
            let node = ListNode.init(value, head)
            
            //更新头节点指针
            head = node
            
            /// 拿到最后一个节点
            let last = size == 0 ? head : nodeOf(size - 1)
            /// next指向第一个节点
            last?.next = node
            
            
        }else {
            //获取插入位置的前一个节点
            let prevNode = nodeOf(index - 1)
            
            //新建一个节点,next指针指向前一个节点的next（插入位置节点）
            let node = ListNode.init(value, prevNode?.next)
            
            //前一个节点的next指针指向新建节点
            prevNode?.next = node
        }
        
        //size+1
        size += 1
    }
    
    /// 删，删除index位置的元素
    func remove(_ index: Int) {
        //在0的位置插入需要特殊处理
        if index == 0 {
            if size == 1 {
                head = nil
            }else {
                /// 拿到最后一个节点
                let last = nodeOf(size - 1)
                head = head?.next
                /// 指向新的头节点
                last?.next = head
            }
        }else {
            //获取插入位置的前一个节点
            let prevNode = nodeOf(index - 1)
            prevNode?.next = prevNode?.next?.next
        }
        size -= 1
    }
    
    
    /// 改，修改链表index位置节点的元素
    func set(_ index: Int, _ value: Int) {
        let node = nodeOf(index)
        node?.val = value
    }
    
    /// 查，读取index位置的元素
    func valueOfIndex(_ index: Int) -> Int {
        return nodeOf(index)?.val ?? 0
    }
    
    /// 清空链表
    func clear() {
        size = 0
        head = nil
    }
    
    /// 打印链表
    func printLinkedList() {
        var string = "["
        guard head != nil else {
            print("linked list is empty !,size = \(size)")
            return
        }
        var tempNode = head
        while tempNode != nil {
            string.append("\(tempNode?.val ?? 0)")
            if tempNode?.next != nil {
                string.append(",")
            }
            tempNode = tempNode?.next
        }
        string.append("],size = \(size)")
        print(string)
    }
    
    /// 读取index位置的节点
    private func nodeOf(_ index: Int) -> ListNode? {
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node ?? nil
    }
    
}
