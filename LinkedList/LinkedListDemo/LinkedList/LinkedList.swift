//
//  LinkedList.swift
//  LinkedListDemo
//
//  Created by mxl on 2021/6/3.
//

import UIKit

let Element_Not_Found = -1

class LinkedList: NSObject {
    //链表的长度
    var size: Int = 0
    //链表的头节点
    var first: ListNode?
    
    
    //清空链表
    func clear() {
        
    }
    
    //添加
    func add(_ val: Any?) {
        
    }
    //删除
    func remove(_ index: Int) {
        
    }
    
    //修改
    func set(_ index: Int, _ element: Any?) {
        
    }
    //读取
    func indexOf(_ element: Any?) -> Int {
        return 0
    }
    
    
    //是否包含节点
    func contains(_ element: Any) -> Bool {
        return indexOf(element) != Element_Not_Found
    }
    
    //获取节点位置
    //是否为空
    func isEmpty() -> Bool {
        return size == 0
    }
    
}
