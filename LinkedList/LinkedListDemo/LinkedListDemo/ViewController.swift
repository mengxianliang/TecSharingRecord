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
//        singleLinkedListTest()
        
        /// 237. 删除链表中的节点
        /// https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
        /// 创建链表
//        let node5 = ListNode(5, nil)
//        let node4 = ListNode(4, node5)
//        let node3 = ListNode(3, node4)
//        let node2 = ListNode(2, node3)
//        let node1 = ListNode(1, node2)
//        let head = node1
//        head.printLinkedList()
//        print("删除链表中的节点\(node2.val)")
//        deleteNode(node2)
//        head.printLinkedList()
        
        /// 203. 移除链表元素
        /// https://leetcode-cn.com/problems/remove-linked-list-elements/
        /// 创建链表
//        let head = createTestLinkedList()
//        head.printLinkedList()
//        print("移除链表元素\(2)")
//        let newHead = removeElements(head, 2)
//        newHead?.printLinkedList()
        
        /// 206. 反转链表
        /// https://leetcode-cn.com/problems/reverse-linked-list/
//        let head = createTestReverseLinkedList()
//        head.printLinkedList()
//        print("反转链表")
        
        /// 递归测试，计算阶乘
//        let num = factorial(10)
//        print("最终结果：10的阶乘 = \(num)")
        
        /// 递归方式反转链表
//        let newHead = reverseLinkedList(head)
//        newHead?.printLinkedList()
        
        /// 迭代方式反转链表
//        let newHead = reverseLinkedList2(head)
//        newHead?.printLinkedList()
        
        /// 141. 环形链表
        /// https://leetcode-cn.com/problems/linked-list-cycle/
//        let head1 = createTestLinkedList()
//        if hasCycle(head1) {
//            print("链表中有环")
//        }else {
//            print("链表中没有环")
//        }
//
//        let head2 = createTestCycleLinkedList()
//        if hasCycle(head2) {
//            print("链表中有环")
//        }else {
//            print("链表中没有环")
//        }
        
        /// 双向链表测试
//        linkedListTest()
        
    }
    
    //MARK:--------------------单向链表封装测试
    func singleLinkedListTest() {
        
        /// 创建一个链表
        let linkedList = SingleLinkedList.init()
        
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
    
    //MARK:--------------------双向链表封装测试
    func linkedListTest() {
        
        /// 创建一个链表
        let linkedList = LinkedList.init()
        
        /// 增
        linkedList.add(0, 1)
        linkedList.add(1, 2)
        linkedList.add(2, 3)
        linkedList.add(3, 4)
        linkedList.add(4, 5)
        linkedList.add(5, 6)
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

    
    //MARK:--------------------删除链表节点
    func deleteNode(_ node: ListNode?) {
        let next = node?.next
        /// 将链表先一个节点的value覆盖当前节点
        node?.val = next!.val
        /// 将当前节点的next指向下一个节点的next
        node?.next = next?.next
    }
    
    //MARK:--------------------移除链表元素
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        
        /// 创建一个虚拟头节点，指向头节点
        let dummyHead = ListNode.init()
        dummyHead.next = head
        
        /// 找到前一个节点
        var prevNode: ListNode? = dummyHead
        /// 当前遍历位置节点
        var currentNode = head
        
        /// 寻换结束条件，遍历到尾节点的next（nil）
        while currentNode != nil {
            /// 如果找到匹配的节点
            if currentNode?.val == val {
                /// 前一个节点的next执行当前节点的next（删除当前节点）
                prevNode?.next = currentNode?.next;
            }else {/// 没找到匹配节点
                /// 更新前一个节点
                prevNode = currentNode
            }
            /// 更新当前遍历位置节点
            currentNode = currentNode?.next
        }
        /// 返回链表的头节点
        return dummyHead.next
    }
    
    //MARK:--------------------递归举例
    /// 一般来说，递归需要有边界条件、递归前进段和递归返回段。当边界条件不满足时，递归前进；当边界条件满足时，递归返回。（摘自百度百科）
    /// 举例：求n的阶乘, 10! = 10*9*8*7*6*5*4*3*2*1 = 10 * 9 !
    /// 9! = 9 * 8!，8! = 8 * 7!，7! = 7 * 6!........
    /// f(10) = 10 * f(9) -> f(n) = n * f(n -1)
    
    func factorial(_ n: Int) -> Int {
        /// 一、当边界条件不满足时，递归前进
        if n <= 2 {
            print("触发递归边界条件n = \(n)")
            /// 三、当边界条件满足时，递归调用结束
            return n
        }
        
        /// 二、边界条件不满足时，递归前进（调用自身方法）
        print("递归调用：传入参数：n = \(n)")
        let result = n * factorial(n - 1)
        
        print("递归计算：\(n)的阶乘 = \(result)")
        
        return result
    }
    
    //MARK:--------------------反转链表
    /// 递归方式
    func reverseLinkedList(_ head: ListNode?) -> ListNode? {
        /// 一、边界条件：1、空链表。2、递归调用到链表最后一个节点
        if head == nil || head?.next == nil {
            /// 三、递归调用结束
            return head
        }
        
        /// 二、边界条件不满足时，递归前进
        let newHead = self.reverseLinkedList(head?.next);
        
        /// 递归计算：
        /// 反转上一个节点的next
        head?.next?.next = head
        /// 再反转第一个节点的next
        head?.next = nil
        
        return newHead
    }
    
    /// 迭代方式
    func reverseLinkedList2(_ head: ListNode?) -> ListNode? {
        /// 特殊情况1、空链表 2、链表只有一个节点
        if head == nil || head?.next == nil {
            return head
        }
        // 保存旧链表的head
        var oldHead = head
        // 建一个新的链表的head
        var newHead: ListNode? = nil
        
        while oldHead != nil {
            //保存旧链表的下一个节点
            let nextNode = oldHead?.next
            
            //反转当前head位置的节点
            oldHead?.next = newHead
            
            //保存已经反转节点为新链表的head
            newHead = oldHead
            
            //更新旧链表表头位置
            oldHead = nextNode
        }
        
        return newHead
    }
    
    //MARK:--------------------判断链表中是否有环
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {return false}
        /// 慢指针
        var slow = head
        /// 快指针
        var fast = head?.next
        /// 让两个指针跑圈，如果有环的话，一定能遇到
        while fast != nil && fast?.next != nil {
            slow = slow?.next ?? nil
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
        }
        return false
    }
    
    
    //MARK:--------------------测试链表数据
    /// 创建链表 [1,2,3,4,5]
    func createTestLinkedList() -> ListNode {
        let node5 = ListNode(5, nil)
        let node4 = ListNode(4, node5)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2, node3)
        let node1 = ListNode(1, node2)
        return node1
    }
    
    /// 创建链表 [5,4,3,2,1]
    func createTestReverseLinkedList() -> ListNode {
        let node1 = ListNode(1, nil)
        let node2 = ListNode(2, node1)
        let node3 = ListNode(3, node2)
        let node4 = ListNode(4, node3)
        let node5 = ListNode(5, node4)
        return node5
    }
    
    /// 创建链表 [1,2,3,4,5] 5->3
    func createTestCycleLinkedList() -> ListNode {
        let node5 = ListNode(5, nil)
        let node4 = ListNode(4, node5)
        let node3 = ListNode(3, node4)
        let node2 = ListNode(2, node3)
        let node1 = ListNode(1, node2)
        /// 5->3
        node5.next = node3
        return node1
    }
}

