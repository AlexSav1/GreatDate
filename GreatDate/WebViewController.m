//
//  WebViewController.m
//  GreatDate
//
//  Created by Maxwell Schneider on 3/31/17.
//  Copyright © 2017 Alex Laptop. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//  **** Setup config, webview, and URLrequest ****
    WKWebViewConfiguration *webConfig = [[WKWebViewConfiguration alloc]init];
    WKWebView *webView = [[WKWebView alloc]initWithFrame:self.view.frame configuration:webConfig];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    
    request.URL = self.url;
    
    NSString *convertedString = [self.locationName stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSLog(@"%@", convertedString);
    
    
    if([request.URL isEqual:nil]){ request.URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.google.com/#q=%@&*", convertedString]];
    }
    
    if(webView.isLoading){
        
    }
    
    NSURLRequest *productRequest = [NSURLRequest requestWithURL:request.URL];
    
    [webView loadRequest:productRequest];
    
    [self.view addSubview:webView];
    
    
    // Do any additional setup after loading the view.
}



@end
