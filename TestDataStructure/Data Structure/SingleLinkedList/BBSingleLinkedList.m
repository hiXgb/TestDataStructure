//
//  BBSingleLinkedList.m
//  TestInstruments
//
//  Created by xgb on 2017/9/1.
//  Copyright © 2017年 xgb. All rights reserved.
//

#import "BBSingleLinkedList.h"

@implementation BBSingleLinkedNode

- (instancetype)initWithKey:(NSString *)key
                      value:(NSString *)value
{
    if (self = [super init]) {
        _key = key;
        _value = value;
    }
    return self;
}

+ (instancetype)nodeWithKey:(NSString *)key
                      value:(NSString *)value
{
    return [[[self class] alloc] initWithKey:key value:value];
}

#pragma mark - NSCopying
- (id)copyWithZone:(nullable NSZone *)zone
{
    BBSingleLinkedNode *newNode = [[BBSingleLinkedNode allocWithZone:zone] init];
    newNode.key = self.key;
    newNode.value = self.value;
    newNode.next = self.next;
    return newNode;
}

@end

@interface BBSingleLinkedList ()

@property (nonatomic, strong) BBSingleLinkedNode *headNode;
@property (nonatomic, strong) NSMutableDictionary *innerMap;

@end

@implementation BBSingleLinkedList

- (instancetype)init
{
    self = [super init];
    if (self) {
        _innerMap = [NSMutableDictionary new];
    }
    return self;
}

#pragma mark - public
- (void)insertNodeAtHead:(BBSingleLinkedNode *)node
{
    if (!node || node.key.length == 0) {
        return;
    }
    
    if ([self isNodeExists:node]) {
        return;
    }
    
    _innerMap[node.key] = node;
    if (_headNode) {
        node.next = _headNode;
        _headNode = node;
    } else {
        _headNode = node;
    }
}

- (void)insertNode:(BBSingleLinkedNode *)node
{
    if (!node || node.key.length == 0) {
        return;
    }
    
    if ([self isNodeExists:node]) {
        return;
    }
    
    _innerMap[node.key] = node;
    
    if (!_headNode) {
        _headNode = node;
        return;
    }
    BBSingleLinkedNode *lastNode = [self lastNode];
    lastNode.next = node;
}

- (void)insertNode:(BBSingleLinkedNode *)newNode beforeNodeForKey:(NSString *)key
{
    if (key.length == 0 || !newNode || newNode.key.length == 0) {
        return;
    }
    
    if ([self isNodeExists:newNode]) {
        return;
    }
    
    if (!_headNode) {
        _headNode = newNode;
        return;
    }
    
    BBSingleLinkedNode *node = _innerMap[key];
    if (node) {
        _innerMap[newNode.key] = newNode;
        BBSingleLinkedNode *aheadNode = [self nodeBeforeNode:node];
        if (aheadNode) {
            aheadNode.next = newNode;
            newNode.next = node;
        } else {
            _headNode = newNode;
            newNode.next = node;
        }
        
    } else {
        [self insertNode:newNode];  //insert to tail
    }
}

- (void)insertNode:(BBSingleLinkedNode *)newNode afterNodeForKey:(NSString *)key
{
    if (key.length == 0 || !newNode || newNode.key.length == 0) {
        return;
    }
    
    if ([self isNodeExists:newNode]) {
        return;
    }
    
    if (!_headNode) {
        _headNode = newNode;
        return;
    }
    
    BBSingleLinkedNode *node = _innerMap[key];
    if (node) {
        _innerMap[newNode.key] = newNode;
        newNode.next = node.next;
        node.next = newNode;
    } else {
        [self insertNode:newNode];  //insert to tail
    }
}

- (void)removeNode:(BBSingleLinkedNode *)node
{
    if (!node || node.key.length == 0) {
        return;
    }
    [_innerMap removeObjectForKey:node.key];
    
    if (node.next) {
        node.key = node.next.key;
        node.value = node.next.value;
        node.next = node.next.next;
    } else {
        BBSingleLinkedNode *aheadNode = [self nodeBeforeNode:node];
        aheadNode.next = nil;
    }
}

- (void)bringNodeToHead:(BBSingleLinkedNode *)node
{
    if (!node || !_headNode) {
        return;
    }
    
    if ([node isEqual:_headNode]) {
        return;
    }
    
    BBSingleLinkedNode *aheadNode = [self nodeBeforeNode:node];
    aheadNode.next = node.next;
    node.next = _headNode;
    _headNode = node;
}

- (BBSingleLinkedNode *)nodeForKey:(NSString *)key
{
    if (key.length == 0) {
        return nil;
    }
    BBSingleLinkedNode *node = _innerMap[key];
    return node;
}

- (BBSingleLinkedNode *)headNode
{
    return _headNode;
}

- (BBSingleLinkedNode *)lastNode
{
    BBSingleLinkedNode *last = _headNode;
    while (last.next) {
        last = last.next;
    }
    return last;
}

- (void)reverse
{
    BBSingleLinkedNode *prev = nil;
    BBSingleLinkedNode *current = _headNode;
    BBSingleLinkedNode *next = nil;
    
    while (current) {
        next = current.next;
        current.next = prev;
        prev = current;
        current = next;
    }
    
    _headNode = prev;
}

- (void)readAllNode
{
    BBSingleLinkedNode *tmpNode = _headNode;
    while (tmpNode) {
        NSLog(@"node key -- %@, node value -- %@", tmpNode.key, tmpNode.value);
        tmpNode = tmpNode.next;
    }
}

- (NSInteger)length
{
    NSInteger _len = 0;
    for (BBSingleLinkedNode *node = _headNode; node; node = node.next) {
        _len ++;
    }
    return _len;
}

- (BOOL)isEmpty
{
    return _headNode == nil;
}

#pragma mark - private
- (BBSingleLinkedNode *)nodeBeforeNode:(BBSingleLinkedNode *)node
{
    BBSingleLinkedNode *targetNode = nil;
    BBSingleLinkedNode *tmpNode = _headNode;
    while (tmpNode) {
        if ([tmpNode.next isEqual:node]) {
            targetNode = tmpNode;
            break;
        } else {
            tmpNode = tmpNode.next;
        }
    }
    return targetNode;
}

- (BOOL)isNodeExists:(BBSingleLinkedNode *)node
{
    BBSingleLinkedNode *tmpNode = _headNode;
    while (tmpNode) {
        if ([tmpNode isEqual:node]) {
            return YES;
        }
        tmpNode = tmpNode.next;
    }
    return false;
}

@end
