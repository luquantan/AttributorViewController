//
//  TextStatsViewController.h
//  Attributor
//
//  Created by LuQuan Intrepid on 10/20/14.
//  Copyright (c) 2014 LuQuan Intrepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextStatsViewController : UIViewController

@property (strong, nonatomic) NSAttributedString *textToAnalyze;
//send it text to analyze, that is all it does. But it is an entire MVC. So its going to generate its own view...etc
@end
