//
//  ViewController.m
//  ScanNovel
//
//  Created by fenggeren on 2017/2/10.
//  Copyright © 2017年 fenggeren. All rights reserved.
//

#import "ViewController.h"
#import "SNNetwork.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [[SNNetwork sharedInstance] downloadNovelInfoWith:@"http://www.biquge.com/43_43821/" complete:^(NSError *error, SNNovelModel *model) {
        NSLog(@"%@---%@", error, model);
    }];
}

@end
