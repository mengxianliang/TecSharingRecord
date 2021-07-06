//
//  ViewController.swift
//  LinkedListDemo
//
//  Created by mxl on 2021/6/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// 链表封装
//        linkedListTest()
        
        
        /// 创建链表
        let node5 = ListNode(5, nil)
        let node4 = ListNode(4, node5)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2, node3)
        let node1 = ListNode(1, node2)
        let head = node1
        head.printLinkedList()
        
        
        /// 237. 删除链表中的节点
        /// https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
//        deleteNode(node2)
//        head.printLinkedList()
        
        
        /// 203. 移除链表元素
        /// https://leetcode-cn.com/problems/remove-linked-list-elements/
        let newHead = removeElements(head, 2)
        newHead?.printLinkedList()
        
        /// 206. 反转链表
        /// https://leetcode-cn.com/problems/reverse-linked-list/
        
        
    }
    
    /// 链表封装测试
    func linkedListTest() {
        
        /// 创建一个链表
        let linkedList = LinkedList.init()
        
        /// 增
        linkedList.add(0, 0)
        linkedList.add(1, 1)
        linkedList.add(2, 2)
        linkedList.add(3, 3)
        linkedList.add(4, 4)
        linkedList.add(5, 5)
        linkedList.printLinkedList()
        
        /// 删
        linkedList.remove(5)
        linkedList.printLinkedList()
        
        /// 改
        linkedList.set(0, -1)
        linkedList.printLinkedList()
        
        /// 查
        let val = linkedList.valueOfIndex(2)
        print("value of index 2 = \(val)")
        
        /// 清空
        linkedList.clear()
        linkedList.printLinkedList()
    }

    
    /// 删除链表节点
    func deleteNode(_ node: ListNode?) {
        let next = node?.next
        /// 将链表先一个节点的value覆盖当前节点
        node?.val = next!.val
        /// 将当前节点的next指向下一个节点的next
        node?.next = next?.next
    }
    
    
    /// 移除链表元素
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        
        /// 创建一个虚拟节点，指向头节点
        let dummyNode = ListNode.init()
        dummyNode.next = head;
        
        /// 找到前一个节点
        var lastNode: ListNode? = dummyNode
        /// 当前遍历位置节点
        var currentNode = head
        
        /// 寻换结束条件，遍历到尾节点的next（nil）
        while currentNode != nil {
            /// 如果找到匹配的节点
            if currentNode?.val == val {
                /// 前一个节点的next执行当前节点的next（删除当前节点）
                lastNode?.next = currentNode?.next;
            }else {/// 没找到匹配节点
                /// 更新前一个节点
                lastNode = currentNode
            }
            /// 更新当前遍历位置节点
            currentNode = currentNode?.next
        }
        /// 返回链表的头节点
        return dummyNode.next
    }
    
    
//    /// 反转链表
//    func reverseList(_ head: ListNode?) -> ListNode? {
//
//    }
    
}

