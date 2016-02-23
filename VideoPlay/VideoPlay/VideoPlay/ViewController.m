//
//  ViewController.m
//  VideoPlay
//
//  Created by ios on 16/2/23.
//  Copyright © 2016年 iOS.Wusanbao. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>


@interface ViewController ()

@property(nonatomic, strong) MPMoviePlayerController *con;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//自动跳到ApplePayChina视频播放

- (IBAction)play {
    
    
    //不带界面的
    
    //1.创建视频播放器
    NSString *path = [[NSBundle mainBundle]pathForResource:@"ApplePayChina.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    MPMoviePlayerController *con = [[MPMoviePlayerController alloc]initWithContentURL:url];
    
    //2.添加界面
    
    con.view.frame = CGRectMake(0, 0, 375, 375);
    
    [self.view addSubview:con.view];
    
    
    /*
     MPMovieControlStyleNone,       // No controls  没有
     MPMovieControlStyleEmbedded,   // Controls for an embedded view
     MPMovieControlStyleFullscreen  //显示全部控制台
     */
    
    //设置控制台的样式
    //con.controlStyle = MPMovieControlStyleNone;
    //con.controlStyle = MPMovieControlStyleEmbedded;
    con.controlStyle = MPMovieControlStyleFullscreen;
    
    //3.播放
    
    [con play];
    
    self.con = con;
    
    
    
    //4.添加通知Watch
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(watch) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

//接收到通知会自动播放AppleWatch

- (void)watch
{
    
    //切换下一个视频
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"AppleWatch.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.con.contentURL = url;
    
    
    //播放
    
    [self.con play];
    
    //PayUSA
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(payusa) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

//接收到通知会播放ApplePayUSA

- (void)payusa
{
    
    //切换下一个视频
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"ApplePayUSA.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.con.contentURL = url;
    
    
    //播放
    
    [self.con play];
    
    //dance
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dance) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}


//接收到通知会来到此方法

- (void)dance
{
    
    //切换下一个视频
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Alizee_La_Isla_Bonita.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    self.con.contentURL = url;
    
    
    //播放
    
    [self.con play];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(watch) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (void)test
{
    //带界面的
    
    //1.创建视频播放控制器
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"ApplePayChina.mp4" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    
    //2.展示
    
    [self presentViewController:vc animated:YES completion:nil];
    
}
@end
