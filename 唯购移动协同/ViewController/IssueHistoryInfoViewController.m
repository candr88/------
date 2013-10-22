//
//  IssueHistoryInfoViewController.m
//  唯购移动协同
//
//  Created by 泽峰 何 on 12-12-5.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "IssueHistoryInfoViewController.h"

@implementation IssueHistoryInfoViewController
@synthesize webView,issueId;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.webView ==nil&&self.issueId!=nil&&self.issueId.length!=0)//进行判断
    {
        NSString * issueUrl=[NSString stringWithFormat:@"http://wztx2007.gnway.net:8090/WorkFlow/WFShow?task_id=919"];//处理网址
        self.webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
        NSURL *url= [[[NSURL alloc] initWithString:issueUrl] autorelease];//设置URl
        NSURLRequest *rqst= [[[NSURLRequest alloc] initWithURL:url] autorelease];
        [self.webView loadRequest:rqst];
        self.webView.backgroundColor=[UIColor clearColor];
        self.webView.scalesPageToFit= NO;
        [self.view addSubview:self.webView];
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.issueId=nil;
    self.webView=nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(void)dealloc
{
    [super dealloc];
    [issueId release];
    [webView release];
}
@end
