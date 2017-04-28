//
//  main.m
//  Arr
//
//  Created by 赵哲 on 2017/4/26.
//  Copyright © 2017年 赵哲. All rights reserved.
//

#import <Foundation/Foundation.h>


//定义了一个数据类型（数组）

typedef struct array
{
    int *pBase;//存储的是数组第一个元素的地址
    int len;//数组所能容纳的最大元素的个数
    int count;//数组当前有效元素的个数
//    int increment;//自动增长因子（暂时不考虑）
}Arr;
void init_arr(Arr *array,int length);
void add_element_arr(Arr *array,int val);
void insert_element_arr(Arr *array,int index,int val);
void delete_element_arr(Arr *array,int index,int *val);//删除的元素用指针实现接收
void get_element_arr(Arr *array,int index);
void show_arr(Arr *array);//输出数组
bool isEmpty(Arr *array);//是不是空的
bool isFull(Arr *array);//是不是满的
void sort_arr(Arr *array);//排序
void inversion_arr(Arr *array);//倒序

int main(int argc, const char * argv[]) {
    Arr array;
    init_arr(&array,10);
    
    add_element_arr(&array, 11);
    add_element_arr(&array, 33);
    add_element_arr(&array, 22);
    add_element_arr(&array, 55);
    add_element_arr(&array, 44);
    
    
//    insert_element_arr(&array, 1, 99);
//    
//    int val ;
//    delete_element_arr(&array,1, &val);
//    printf("删除元素%d\n",val);
    
//    inversion_arr(&array);
    
    sort_arr(&array);
    
    
//    printf("%p\n%d\n%d\n",array.pBase,array.len,array.count);
    show_arr(&array);
    return 0;
}
//初始化
void init_arr(Arr *array,int length)
{
    array->pBase = (int *)malloc(sizeof(Arr) * length);
    if (array->pBase == NULL) {
        printf("动态内存分配失败");
        exit(-1);//终止程序
    }else
    {
        array->len = length;
        array->count = 0;
    }
    return;
}
//是不是空的
bool isEmpty(Arr *array)
{
    if (array->count == 0) {
        return true;
    }else
    {
           return false;
    }
}
//是不是满
bool isFull(Arr *array)
{
    if (array->len == array->count) {
        return true;
    }else
    {
        return false;
    }
}
//输出数组
void show_arr(Arr *array)
{
    if (isEmpty(array)) {
        //数组为空
        printf("数组为空");
    }else
    {
        for (int i = 0; i < array->count; i++) {
            printf("%d\n", array->pBase[i]);
        }
    }
}
//添加元素
void add_element_arr(Arr *array,int val)
{
    if (isFull(array)) {
        printf("数组已经满了");
    }else
    {
        array->pBase[array->count] = val;
         ++array->count;
    }
}
//插入数组
void insert_element_arr(Arr *array,int index,int val)
{
    if (isFull(array)) {
        printf("数组已满");
        return;
    }
    
    if (index < 1 || index > array->count + 1) {
        printf("插入索引错误");
        return;
    }
    
    for (int i = array->count - 1; i >= index - 1; i--) {
        array->pBase[i + 1] = array->pBase[i];
    }
    array->count ++;
    array->pBase[index - 1] = val;
}
//删除元素
void delete_element_arr(Arr *array,int index,int *val)
{
    if (isEmpty(array)) {
        printf("数组为空，不能删除");
    }
    
    if (index < 1 || index > array->count) {
        printf("删除索引错误");
    }
    
    *val = array->pBase[index - 1];
    
    for (int i = index; i < array->count; ++i) {
        array->pBase[i - 1] = array->pBase[i];
    }
    array->count--;
}
//倒序
void inversion_arr(Arr *array)
{
    int i = 0;
    int j = array->count - 1;
    int temp;
    
    while (i < j) {
        temp = array->pBase[i];
        array->pBase[i] = array->pBase[j];
        array->pBase[j] = temp;
        ++i;
        --j;
    }
}
//排序（冒泡）
void sort_arr(Arr *array)
{
    bool isSort = true;
    for (int i = 0; i < array->count - 1 && isSort; i++) {
        isSort = false;
        for (int j = 0; j < array->count - i- 1 ; j++) {
            if (array->pBase[j] > array->pBase[j + 1]) {
                isSort = true;
                int  temp = array->pBase[j + 1];
                array->pBase[j + 1] = array->pBase[j];
                array->pBase[j] = temp;
            }
        }
    }
}

























