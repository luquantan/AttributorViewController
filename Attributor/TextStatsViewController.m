//
//  TextStatsViewController.m
//  Attributor
//
//  Created by LuQuan Intrepid on 10/20/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import "TextStatsViewController.h"

@interface TextStatsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *colourfulCharactersLabel;
@property (weak, nonatomic) IBOutlet UILabel *outlineCharactersLabel;

@end

@implementation TextStatsViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
//    self.textToAnalyze = [[NSAttributedString alloc]initWithString:@"test" attributes:@{NSForegroundColorAttributeName : [UIColor greenColor], NSStrokeWidthAttributeName : @-3}];
    //this is for testing purposes. this will set the "model" for this MVC directly after the view loads.
    
}
- (void)setTextToAnalyze:(NSAttributedString *)textToAnalyze
{
    _textToAnalyze = textToAnalyze;
    if (self.view.window) { // If nil, im not on screen, then let viewWillAppear updateUI for me.
        [self updateUI];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateUI];
}

- (void)updateUI
{
    self.colourfulCharactersLabel.text = [NSString stringWithFormat:@"%lu colourful characters",[[self charactersWithAttribute:NSForegroundColorAttributeName] length]];
    
    self.outlineCharactersLabel.text = [NSString stringWithFormat:@"%lu outlined characters",[[self charactersWithAttribute:NSStrokeWidthAttributeName]length]];
}


- (NSAttributedString *)charactersWithAttribute:(NSString *) attributeName //will return a string that appends all the attribute in textToAnalyze
{
    NSMutableAttributedString *characters = [[NSMutableAttributedString alloc]init];
    
    int index = 0;
    while (index < [self.textToAnalyze length]) {
        NSRange range;
        id value = [self.textToAnalyze attribute:attributeName atIndex:index effectiveRange:&range];
        if (value) {
            [characters appendAttributedString:[self.textToAnalyze attributedSubstringFromRange:range]];
            index = (int)range.location + (int)range.length;
        } else {
            index++;
        }
    }
    return characters;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
