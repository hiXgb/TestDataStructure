//
//  BBSingleLinkedList.h
//  TestInstruments
//
//  Created by xgb on 2017/9/1.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBSingleLinkedNode : NSObject <NSCopying>

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) BBSingleLinkedNode *next;

- (instancetype)initWithKey:(NSString *)key
                      value:(NSString *)value;

+ (instancetype)nodeWithKey:(NSString *)key
                      value:(NSString *)value;

@end

@interface BBSingleLinkedList : NSObject

- (void)insertNode:(BBSingleLinkedNode *)node;
- (void)insertNodeAtHead:(BBSingleLinkedNode *)node;
- (void)insertNode:(BBSingleLinkedNode *)newNode beforeNodeForKey:(NSString *)key;
- (void)insertNode:(BBSingleLinkedNode *)newNode afterNodeForKey:(NSString *)key;

- (void)bringNodeToHead:(BBSingleLinkedNode *)node;

- (void)removeNode:(BBSingleLinkedNode *)node;

- (BBSingleLinkedNode *)nodeForKey:(NSString *)key;
- (BBSingleLinkedNode *)headNode;
- (BBSingleLinkedNode *)lastNode;

- (NSInteger)length;
- (BOOL)isEmpty;

- (void)reverse;
- (void)readAllNode;

@end
