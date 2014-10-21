//
//  ViewController.m
//  Attributor
//
//  Created by LuQuan Intrepid on 10/20/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import "ViewController.h"
#import "TextStatsViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headline;
@property (weak, nonatomic) IBOutlet UITextView *body;
@property (weak, nonatomic) IBOutlet UIButton *outlineButton;
@property (weak, nonatomic) IBOutlet UIButton *unoutlineButton;

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Analyze Text"]) {
        if ([segue.destinationViewController isKindOfClass:[TextStatsViewController class]]) {
            TextStatsViewController *tsvc = (TextStatsViewController *)segue.destinationViewController;
            tsvc.textToAnalyze = self.body.textStorage;
        }
    }
}
- (IBAction)changeBodySelectionColorToMatchBackgroundColorOfButton:(UIButton *)sender
{
    [self.body.textStorage addAttribute:NSForegroundColorAttributeName
                                  value:sender.backgroundColor
                                  range:self.body.selectedRange];
}

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
    
    //Set attribute of Outline button after loading the view
    NSMutableAttributedString *outlineTitle = [[NSMutableAttributedString alloc] initWithString:self.outlineButton.currentTitle];
    [outlineTitle setAttributes:@{NSStrokeWidthAttributeName : @3 ,
                                  NSStrokeColorAttributeName : self.outlineButton.tintColor}
                          range:NSMakeRange(0, [outlineTitle length])];
    [self.outlineButton setAttributedTitle:outlineTitle forState:UIControlStateNormal]; //unlike textlabel, must get the button, edit it, and set it
    
    //Set attribute of Unoutline button after loading the view
    NSMutableAttributedString *unoutlineTitle = [[NSMutableAttributedString alloc] initWithString:self.unoutlineButton.currentTitle];
    
    [unoutlineTitle setAttributes:@{NSStrokeWidthAttributeName : @3 ,
                                    NSStrokeColorAttributeName : self.unoutlineButton.tintColor}
                            range: NSMakeRange(0, [unoutlineTitle length])];
    [self.unoutlineButton setAttributedTitle:unoutlineTitle forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
