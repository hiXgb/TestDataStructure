//
//  BBLinkedMap.h
//  TestInstruments
//
//  Created by xgb on 2017/9/1.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBLinkedNode : NSObject <NSCopying>

@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) BBLinkedNode *prev;
@property (nonatomic, strong) BBLinkedNode *next;

- (instancetype)initWithKey:(NSString *)key
                      value:(NSString *)value;

+ (instancetype)nodeWithKey:(NSString *)key
                      value:(NSString *)value;

@end

@interface BBLinkedMap : NSObject

- (void)insertNodeAtHead:(BBLinkedNode *)node;
- (void)insertNode:(BBLinkedNode *)node;
- (void)insertNode:(BBLinkedNode *)newNode beforeNodeForKey:(NSString *)key;
- (void)insertNode:(BBLinkedNode *)newNode afterNodeForKey:(NSString *)key;
- (void)bringNodeToHead:(BBLinkedNode *)node;

- (void)readAllNode;
- (void)removeNodeForKey:(NSString *)key;
- (void)removeTailNode;

- (NSInteger)length;
- (BOOL)isEmpty;

- (BBLinkedNode *)nodeForKey:(NSString *)key;
- (BBLinkedNode *)headNode;
- (BBLinkedNode *)tailNode;

@end
