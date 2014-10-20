//
//  ViewController.m
//  Attributor
//
//  Created by LuQuan Intrepid on 10/20/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UITextView *body;

@end

@implementation ViewController

- (IBAction)changeBodySelectionColorToMatchBackgroundColorOfButton:(UIButton *)sender
{
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}
//- (IBAction)outlineBodySelection:(id)sender
//{
//    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-3 ,
//                                           NSStrokeColorAttributeName : [UIColor blackColor]}
//                                   range:self.body.selectedRange];
//}

- (IBAction)outlineBodySelection:(UIButton *)sender
{
    [self.body.textStorage addAttributes:@{NSStrokeWidthAttributeName : @-3 ,
                                           NSStrokeColorAttributeName : [UIColor blackColor]}
                                           range:self.body.selectedRange];
}

- (IBAction)unoutlineBodySelection:(UIButton *)sender
{
    [self.body.textStorage removeAttribute:NSStrokeWidthAttributeName range:self.body.selectedRange];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
