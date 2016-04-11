//
//  Question.m
//  day04超级猜图
//
//  Created by M-coppco on 16/1/16.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "Question.h"

@implementation Question
-(instancetype)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
        //这个方法可以在很多地方加, 打乱顺序,只打乱一次,  在控制器中使用,下一题的时候打乱
        [self randomOption];
    }
    return self;
}
+(instancetype)questionWithDictionary:(NSDictionary *)dic {
    return [[self alloc] initWithDictionary:dic];
}
+ (NSArray *)question {
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"questions.plist" ofType:nil]];
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self questionWithDictionary:dic]];
    }
    return arrayM;
}
//可以重写这个方法
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@:%p> {answer:%@, icon:%@, title:%@, options:%@}", self.class, self, self.answer, self.icon, self.title, self.options];
}
- (void)randomOption {
    self.options = [self.options sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        int seed = arc4random_uniform(2);
        if (seed) {
            return [obj1 compare:obj2];
        } else {
            return [obj2 compare:obj1];
        }
    }];
}
- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
    if ([key isEqualToString:@"icon"]) {
        self.image1 = [UIImage imageNamed:value];
    }
}
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {}
-(void)setNilValueForKey:(NSString *)key {}
@end
