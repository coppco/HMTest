//
//  ViewController.m
//  day04超级猜图
//
//  Created by M-coppco on 16/1/12.
//  Copyright © 2016年 M-coppco. All rights reserved.
//

#import "ViewController.h"
#import "Question.h" //model
#define kButtonW 40
#define kButtonH 40
#define kButtonM 10
#define kTotolcol 7
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *iconButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconW;//约束
@property (nonatomic, assign)CGFloat iconWW;
@property (nonatomic, assign)CGFloat iconHH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *iconT;
@property (nonatomic, strong)UIButton *cover; //挡板
@property (nonatomic, strong)NSArray *questions; //问题
@property (nonatomic, assign)NSInteger index;//当前题目
@property (weak, nonatomic) IBOutlet UILabel *noLabel;//序号
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;//标题
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;//金钱
@property (weak, nonatomic) IBOutlet UIButton *next;//下一题
@property (weak, nonatomic) IBOutlet UIView *answer;
@property (weak, nonatomic) IBOutlet UIView *tips;

@end

@implementation ViewController
//懒加载
- (NSArray *)questions {
    if (_questions == nil) {
        _questions = [Question question];
    }
    return _questions;
}
-(UIButton *)cover {
    if (_cover == nil) {
        //添加蒙版
        _cover = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _cover.backgroundColor = [[UIColor alloc] initWithWhite:0 alpha:0.5];
        _cover.alpha = 0;
        _cover.frame = self.view.bounds;
        [_cover addTarget:self action:@selector(bigPic:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:_cover];
    }
    return _cover;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconButton.adjustsImageWhenHighlighted = NO;  //按住button没有高亮状态
//    self.iconButton.showsTouchWhenHighlighted = YES;//点击高亮
    self.iconHH = self.iconH.constant;
    self.iconWW = self.iconW.constant;
    // Do any additional setup after loading the view, typically from a nib.
    
//    for (Question *q in self.questions) {
//        NSLog(@"%@", q);
//    }
    //数组的块代码遍历效率比for-in高
//    [self.questions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"%@", obj);
//        if (idx == 2) {
//            *stop = YES;
//        }
//    }];

    self.index = -1;
    [self nextQuestion:nil];
}
#pragma mark - 大图小图切换
- (IBAction)bigPic:(UIButton *)sender {
    if (self.cover.alpha == 0) {
        [self.view bringSubviewToFront:self.iconButton];
        [UIView animateWithDuration:0.5 animations:^{
            self.cover.alpha = 1;
            //        self.iconT.constant = (self.view.frame.size.height - self.view.frame.size.width) * 0.5;
            self.iconH.constant = self.view.frame.size.height / 2;
            self.iconW.constant = self.view.frame.size.width ;
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            self.cover.alpha = 0;
            self.iconH.constant = self.iconHH;
            self.iconW.constant = self.iconWW;
        }];
    }
}
#pragma mark - tips提示
- (IBAction)tipsH:(UIButton *)sender {
    //1. 答题区按钮文字清空
    for (UIButton *btn in self.answer.subviews) {
        if (btn.currentTitle.length != 0) {
            //代码执行点击方法
            [self answerButton:btn];
        }
    }
    //2.把正确答案的第一个文字,设置到答题区中
    Question *q = self.questions[self.index];
    NSString *first = [q.answer substringToIndex:1];
    //3. 取出文字对应的文字按钮
    for (UIButton *btn in self.tips.subviews) {
        if ([btn.currentTitle isEqualToString:first] && btn.hidden == NO) {
            [self clickOption:btn];
            break;
        }
    }
    //4. 扣分
    self.moneyLabel.text =[NSString stringWithFormat:@"%ld", [self.moneyLabel.text integerValue] - 500];
}

#pragma mark - 下一题
- (IBAction)nextQuestion:(id)sender {
    /**
     *  这个方法   最开始是一个整的方法,后来分拆为了3个方法,这个在以后要学会
     */
    //1. 当前答题的索引,索引递增
    self.index++;
    
    if (self.index == self.questions.count) {
        UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"提示" message:@"通关了" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [view show];
        return;
    }
    
    //2. 从数组中取题目
    Question  *q = self.questions[self.index];
    //3.设置基本信息
    [self createBase:q];
    //4.设置答案
    [self createAnswerButtons:q];
    //5 设置备选答案
    [self createOptionButtons:q];
    
}
/**
 *  创建基本信息
 */
- (void)createBase:(Question *)q {
    self.noLabel.text = [NSString stringWithFormat:@"%ld/%ld", self.index+1, self.questions.count];
    self.titleLabel.text = q.title;
//    [self.iconButton setImage:[UIImage imageNamed:q.icon] forState:(UIControlStateNormal)];
    [self.iconButton setImage:q.image1 forState:(UIControlStateNormal)];
    //最后一题禁用button
    //    if (self.index == 9) {
    //        self.next.enabled = NO;
    //    }
    self.next.enabled = (self.index < self.questions.count - 1);
}
/**
 *  创建答案按钮
 */
- (void)createAnswerButtons:(Question *)q {
    //4 创建答案按钮
    //先移除上一个的button
    for (UIButton *btn in self.answer.subviews) {
        [btn removeFromSuperview];
    }
    
    CGFloat answerW = self.view.bounds.size.width;
    //    CGFloat answerW = self.answer.bounds.size.width;
    NSLog(@"%f", answerW);
    /**
     * 这里注意:为什么开始 answerW为600?
     */
    NSInteger length = q.answer.length;
    CGFloat answerX = (answerW - kButtonW * length - kButtonM * (length - 1)) / 2;
    for (int i = 0; i < length; i++) {
        CGFloat x = answerX + i * (kButtonM + kButtonW);
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, kButtonW, kButtonH)];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:(UIControlStateNormal)];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:(UIControlStateHighlighted)];
        [btn addTarget:self action:@selector(answerButton:) forControlEvents:(UIControlEventTouchUpInside)];
        //设置颜色
        [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [self.answer addSubview:btn];
    }
}
/**
 *  创建备选区代码
 */
- (void)createOptionButtons:(Question *)q {
    //5.创建备选按钮
    //备选区按钮可以优化,  最开始每次创建之前先移除之前的,这样性能不够好,可以优化
    //先移除  优化后去掉
//    for (UIButton *btn in self.tips.subviews) {
//        [btn removeFromSuperview];
//    }
    
    
    if (self.tips.subviews.count != q.options.count) {
        //需要重新创建按钮
        CGFloat optionW = self.view.bounds.size.width;
        //    CGFloat optionW = self.tips.bounds.size.width;
        CGFloat optionX = (optionW - kTotolcol * kButtonW - (kTotolcol - 1) * kButtonM) / 2;
        for (int i = 0; i < q.options.count; i++) {
            int row = i / kTotolcol;
            int col = i % kTotolcol;
            CGFloat x = optionX + col * (kButtonM + kButtonW);
            CGFloat y = row * (kButtonH + kButtonM);
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, kButtonW, kButtonH)];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:(UIControlStateNormal)];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:(UIControlStateHighlighted)];
            //设置备选答案
            [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            [btn addTarget:self action:@selector(clickOption:) forControlEvents:(UIControlEventTouchUpInside)];
            [self.tips addSubview:btn];
        }
    }
        //已经存在只设置标题即可
        int i = 0;
        for (UIButton *btn in self.tips.subviews) {
            //恢复按钮的隐藏
            btn.hidden = NO;
            //设置备选答案
            [btn setTitle:q.options[i++] forState:(UIControlStateNormal)];
        }
}
#pragma mark -答题区按钮
- (void)answerButton:(UIButton *)button {
    //1. 按钮没有子 直接返回
    if (button.currentTitle.length == 0) {
        return;
    }
    //2. 如果有字, 清除文字, 候选区显示按钮
    UIButton *btn = [self optionButtonWithTitle:button.currentTitle];
    btn.hidden = NO;
    //3答案区文字清除
    [button setTitle:@"" forState:(UIControlStateNormal)];
    //4. 只要点击了答案按钮,颜色改回来
    [self setAnswerViewColor:[UIColor blackColor]];
}
- (UIButton *)optionButtonWithTitle:(NSString *)title {
    for (UIButton *btn in self.tips.subviews) {
        if ([btn.currentTitle isEqualToString:title] && btn.hidden) {
            return btn;
        }
    }
    return nil;
}
#pragma mark - 候选答案按钮
- (void)clickOption:(UIButton *)button {
    //1. 在答案区找到第一个文字为空的按钮
    UIButton *btn = [self firstAnswerButton];
    //如果没有找到返回,就是所有按钮都有字
    if (!btn) {
        //都有字
        [self judge];
    } else {
        //2. 将button的标题设置给答案区的按钮
        [btn setTitle:button.currentTitle forState:(UIControlStateNormal)];
        //3.将button隐藏
        button.hidden = YES;
        [self judge];
    }
    
}
//1. 在答案区找到第一个文字为空的按钮
- (UIButton *)firstAnswerButton {
    for (UIButton *btn in self.answer.subviews) {
        if (btn.currentTitle.length == 0) {
            return btn;
        }
    }
    return nil;
}
//判断结果
- (void)judge {
    //答案区的按钮都有文字
    BOOL isFull = YES;
    NSMutableString *str = [NSMutableString string];
    for (UIButton *btn in self.answer.subviews) {
        if (btn.currentTitle.length == 0) {
            isFull = NO;
            break;
        } else {
            [str appendString:btn.currentTitle];
        }
    }
    if (isFull) {
        //判断是否一致
        Question *q = self.questions[self.index];
        //相同
        if ([str isEqualToString:q.answer]) {
            [self setAnswerViewColor:[UIColor blueColor]];
            //加分
            self.moneyLabel.text =[NSString stringWithFormat:@"%ld", [self.moneyLabel.text integerValue] + 1000];
            //延迟执行
            [self performSelector:@selector(nextQuestion:) withObject:nil afterDelay:0.3];
        } else {
            //不相同
            [self setAnswerViewColor:[UIColor redColor]];
        }
    }
}
//修改答题区按钮颜色
- (void)setAnswerViewColor:(UIColor *)color {
    for (UIButton *btn in self.answer.subviews) {
        [btn setTitleColor:color forState:(UIControlStateNormal)];
    }
}
#pragma mark - 调整状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    /**
     *  UIStatusBarStyleDefault    dark
         UIStatusBarStyleLightContent  light
     */
    return UIStatusBarStyleLightContent;
}
/** 隐藏状态栏*/
- (BOOL)prefersStatusBarHidden {
    return NO;//yes 是隐藏,no是不隐藏
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
