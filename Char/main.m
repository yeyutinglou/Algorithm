//
//  main.m
//  Char
//
//  Created by jyd on 16/4/5.
//  Copyright © 2016年 jyd. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        char str[] = "hello wrold";
//        NSLog(@"%d\r\n",recurLength(str));
//        NSLog(@"%d\r\n",lastWordLenth(str, recurLength(str)));
     
        NSLog(@"%s",str);
    }
    return 0;
}
///递归取字符串的长度
int recurLength(char * str)
{
    if (str[0] == '\0') {
        return 0;
    }else{
        return recurLength(str +1) +1;
    }
}


///字符串中最后一个单词的长度
int lastWordLenth(char *str, int len)
{
    int lastLen = 0;
    int index = len -1;
    while (index >= 0 && str[index --] != ' ') {
        lastLen++;
    }
    return lastLen;
}

int lastWordLenth2(char *str)
{
    int lastLen = 0;
    int index = 0;
    while (str[index] != '\0') {
        if (str[index] == ' ') {
            lastLen = 0;
        }else{
            lastLen ++;
        }
        index ++;
    }
    return lastLen;
}

///对字符串进行反转


void  Reverse(char *str, int begin, int end)
{
    char temp;
    while (begin < end) {
        temp  = str[begin];
        str[begin] = str[end];
        str[end] = temp;
        begin++;
        end--;
    }
   

}

///对整个字符串进行反转
void Reverse_second(char *str, int len)
{
    int begin, i, j;
    for (i= 0; i < len;) {
        begin = i;
        for (j = i; j < len; j++) {
            if (str[j] == ' ') {
                break;
            }
            Reverse(str, begin, j-1);
        }
    }
    
}

///排序字符串，使得大写字母排在前面，小写字母在后面

void strSort(char *str)
{
    int index = -1;
    int pos = 0;
    char temp;
    for (; str[pos] != '\0'; pos ++) {
        if (str[pos] >= 'A' && str[pos] <= 'Z') {
            index ++;
            temp = str[index];
            str[index] = str[pos];
            str[pos] = temp;
            
        }
    }
    
}

///使得小写字符位置不变

void strSort2(char *str)
{
    int len = 0;
    int pos = 0;
    char temp;
    while (str[pos] != '\0') {
        pos++;
        len++;
        int index = len - 1;
        for (; index >= 0 ; index--) {
            if (str[index] >= 'a' && str[index] <= 'z') {
                temp = str[index];
                str[index] = str[pos];
                str[pos] = temp;
            }
        }
    }
}

///冒泡排序

void bulldle(int *array, int num)
{
    int i, j, temp;
    for (i = 0; i < num -1; i++) {
        for (j = i +1; j < num; j++) {
            if (array[i] < array[j]) {
                temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
}


///插入排序
void insertSort(int *array, int n)
{
    int i, j, temp;
    for (i = 1; i < n; i++) {
        temp = array[i];
        for (j = i - 1; j >= 0; j--) {
            if (array[j] > temp) {
                array[j + 1] = array[j];
            }else{
                break;
            }
            array[j + 1] = temp;
        }
    }
}

///将一个数组以某一个基准点划分为两个子数组
int partition(int *array, int left, int right)
{
    int key = array[right];//以最后一个为基准点
    int i = left -1;
    int temp;
    //开始以基准点为标准分割序列
    for (int j = left; j < right; j++) {
        if (array[j] < key) {
            i++;
            temp = array[j];
            array[j] = array[i];
            array[i] = temp;
        }
    }
    //将基准点放到合适的位置上
    temp = array[i + 1];
    array[i + 1] = array[right];
    array[right] = temp;
    return i + 1;
}

///快速排序

void quickSort(int *array, int left, int right)
{
    if (left < right) {
        int k = partition(array, left, right);
        quickSort(array, left, k - 1);
        quickSort(array, k + 1, right);
    }
}

//第二种分割的方法
void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

int partition2(int *array, int low, int high)
{
    int key = array[low];
    while (low < high) {
        while (low < high && array[high] >= key) {
            high--;
            swap(&array[low], &array[high]);
        }
        while (low < high && array[low] <= key) {
            swap(&array[low], &array[high]);
        }
    }
    return low;
}

///第二种分割方法下的快速排序
void quickSort2(int *array, int left, int right)
{
    int i, j, key;
    if (left < right) {
        i = left;
        j = right;
        key = array[i];
        do {
            while (array[j] > key && i < j) {
                j--;
                if (i < j) {
                    array[i] = array[j];
                    i++;
                }
            }
            while (array[i] < key && i < j) {
                i++;
                if (i > j) {
                    array[j] = array[i];
                    j--;
                }
            }
        } while (i != j);
        
        array[i] = key;
        quickSort2(array, left, i - 1);
        quickSort2(array, i + 1, right);
    }
}

///二分查找法
int binarySearch (int *array, int n, int key)
{
    int low = 0;
    int higt = n-1;
    int mid;
    if (low > higt) {
        return -1;
    }
    while (low <= higt) {
        mid = low + ((higt - low) >> 1);
        if (array[mid] == key) {
            return mid;
        }else if (array[mid] > key){
            higt = mid - 1;
        }else{
            low = mid + 1;
        }
    }
    return -1;
}

//在一个有序序列中，查找某一个元素在该序列中的下限索引
//找到第一个不小于该元素的下标索引
int lowerBound(int *array, int low, int high, int key)
{
    int mid;
    if (low > high) {
        return -1;
    }
    while (low <= high) {
        mid = low + ((high - low) >> 1);
        if (array[mid] < key) {
            low = mid + 1;
        }else{
            high = mid - 1;
        }
    }
    return low;
}

/*在一个有序序列中，查找某一个元素在该序列中的上限索引
找到第一个大于该元素的下标索引 */
int upperBound(int *array, int low, int high, int key)
{
    int mid;
    if (low > high) {
        return -1;
    }
    while (low <= high) {
        mid = low + ((high - low) >>1);
        if (array[mid] > key) {
            high = mid - 1;
        }else{
            low = mid + 1;
        }
    }
    return low;
}

typedef struct ListNode listNode;
struct ListNode {
    struct ListNode *next;
    int value;
};

void initList(listNode *head, int *array, int n)
{
    head = NULL;
    listNode *temp;
    listNode * record = NULL;
    
    for (int i = 1; i < n; i++) {
        temp ->next = NULL;
        temp ->value = array[i - 1];
        if (head == NULL) {
            head = temp;
            record = head;
        }else{
            record ->next = temp;
            record = temp;
        }
    }
}

void printList(listNode *list)
{
    listNode *temp = list;
    while (temp != NULL) {
        int a = temp ->value;
        temp = temp ->next;
    }
}

//单链表中节点的个数
int listNodeLength(listNode *node)
{
    if (node == NULL) {
        return 0;
    }
    int length = 0;
    listNode *current = node;
    while (current != NULL) {
        length ++;
        current = current ->next;
    }
    
    return length;
}

//递归的方法求链表的长度
int lenList(listNode *node)
{
    if (node == NULL) {
        return 0;
    }else{
        return lenList(node ->next) +1;
    }
}

//翻转链表
listNode * reverseList(listNode *node)
{
    if (node == NULL | node ->next == NULL) {
        return node;
    }
    listNode *reverseHead = NULL;
    listNode *current = node;
    while (current != NULL) {
        listNode *temp = current;
        current = current ->next;
        temp->next = reverseHead;
        reverseHead = temp;
    }
    return reverseHead;
}

//查找链表中倒数第K个节点
listNode *getKithNode(listNode *node, int k)
{
    if (k == 0 || node == NULL) {
        return NULL;
    }
    listNode *head = node;
    listNode *ehind = node;
    //前面的指针走到正向第K个节点
    while (k > 1 && head != NULL) {
        head = head ->next;
        k--;
    }
    //节点个数小于K，直接返回NULL
    if (k > 1 || head == NULL) {
        return NULL;
    }
    //前后两个指针一起向前走，直到前面的指针指向最后一个节点
    while (head ->next != NULL) {
        ehind = ehind ->next;
        head = head ->next;
    }
    //后面的指针所指向的节点就是倒数第K个节点
    return ehind;
}

//判断单链表中是否有环
BOOL hasCircle(listNode *node)
{
    listNode *fast = node;
    listNode *slow = node;
    while (fast != NULL && fast ->next != NULL) {
        fast = fast->next ->next;
        slow = slow ->next;
        if (slow == fast) {
            return true;
        }
        
    }
    return false;
}
