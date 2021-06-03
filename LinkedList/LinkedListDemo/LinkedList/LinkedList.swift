//
//  LinkedList.swift
//  LinkedListDemo
//
//  Created by mxl on 2021/6/3.
//

import UIKit

class LinkedList: NSObject {
    //链表的长度
    var size: Int = 0
    //头节点指针
    var head: ListNode?
    
    /// 清空链表
    func clear() {
        size = 0
        head = nil
    }
    
    /// 添加元素
    func add(_ index: Int, _ value: Int) {
        
        if index == 0 {
            //新建一个节点,next指针指向第一个节点的
            let node = ListNode.init(value, head)
            
            //更新头节点指针
            head = node
            
        }else {
            //获取插入位置的前一个节点
            let prevNode = nodeOf(index - 1)
            
            //新建一个节点,next指针指向前一个节点的next
            let node = ListNode.init(value, prevNode?.next)
            
            //前一个节点的next指针指向新建节点
            prevNode?.next = node
        }
        
        //size+1
        size += 1
    }
    
    /// 删除元素
    func remove(_ index: Int) {
        //获取插入位置的前一个节点
        let prevNode = nodeOf(index - 1)
        
        prevNode?.next = prevNode?.next?.next
        
        
        
    }
    
    /// 获取index位置的节点
    func nodeOf(_ index: Int) -> ListNode? {
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node ?? nil
    }
    
    
    
    //修改
    func set(_ index: Int, _ value: Int) {
        let node = nodeOf(index)
        node?.val = value
    }
    
    //读取
    func indexOf(_ index: Int) -> Int {
        return nodeOf(index)?.val ?? 0
    }
    
    
}
