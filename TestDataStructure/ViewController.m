//
//  ViewController.m
//  TestDataStructure
//
//  Created by xgb on 2017/9/3.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import "ViewController.h"
#import "BBSingleLinkedList.h"
#import "BBLinkedMap.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testSingleLinkedList];
    [self testLinkedMap];
}

- (void)testSingleLinkedList
{
    BBSingleLinkedNode *tmpNode = nil;
    BBSingleLinkedList *list = [BBSingleLinkedList new];
    for (int i = 0; i < 5; i ++) {
        BBSingleLinkedNode *node = [BBSingleLinkedNode new];
        node.key = @(i).stringValue;
        node.value = [NSString stringWithFormat:@"value%d",i];
        [list insertNode:node];
        
        if (i == 3) {
            tmpNode = node;
        }
    }
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNodeAtHead:[BBSingleLinkedNode nodeWithKey:@"8" value:@"value8"]];
    [list insertNodeAtHead:tmpNode];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list bringNodeToHead:tmpNode];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBSingleLinkedNode nodeWithKey:@"20" value:@"value20"] afterNodeForKey:tmpNode.key];
    [list insertNode:tmpNode afterNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBSingleLinkedNode nodeWithKey:@"10" value:@"value10"] beforeNodeForKey:tmpNode.key];
    [list insertNode:tmpNode beforeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBSingleLinkedNode nodeWithKey:@"11" value:@"value11"] beforeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBSingleLinkedNode nodeWithKey:@"12" value:@"value12"] beforeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBSingleLinkedNode nodeWithKey:@"13" value:@"value13"] beforeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list removeNode:tmpNode];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    BBSingleLinkedNode *node = [list nodeForKey:@"4"];
    [list bringNodeToHead:node];
    node = [list lastNode];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list reverse];
    [list readAllNode];
    NSInteger len = [list length];
    NSLog(@"\r\n==========\r\n");
    
}

- (void)testLinkedMap
{
    BBLinkedNode *tmpNode = nil;
    BBLinkedMap *list = [BBLinkedMap new];
    for (int i = 0; i < 5; i ++) {
        BBLinkedNode *node = [BBLinkedNode new];
        node.key = @(i).stringValue;
        node.value = [NSString stringWithFormat:@"value%d",i];
        [list insertNode:node];
        
        if (i == 3) {
            tmpNode = node;
        }
    }
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNodeAtHead:[BBLinkedNode nodeWithKey:@"8" value:@"value8"]];
    [list insertNodeAtHead:tmpNode];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list bringNodeToHead:tmpNode];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBLinkedNode nodeWithKey:@"20" value:@"value20"] afterNodeForKey:tmpNode.key];
    [list insertNode:tmpNode afterNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBLinkedNode nodeWithKey:@"10" value:@"value10"] beforeNodeForKey:tmpNode.key];
    [list insertNode:tmpNode beforeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBLinkedNode nodeWithKey:@"11" value:@"value11"] beforeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBLinkedNode nodeWithKey:@"12" value:@"value12"] beforeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list insertNode:[BBLinkedNode nodeWithKey:@"13" value:@"value13"] beforeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    [list removeNodeForKey:tmpNode.key];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    BBLinkedNode *node = [list nodeForKey:@"4"];
    [list bringNodeToHead:node];
    node = [list tailNode];
    [list readAllNode];
    NSLog(@"\r\n==========\r\n");
    NSInteger len = [list length];
    BBLinkedNode *headNode = [list headNode];
    BBLinkedNode *tailNode = [list tailNode];
    NSLog(@"\r\n==========\r\n");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
