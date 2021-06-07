//
//  ViewController.m
//  kedaxunfei
//
//  Created by mac on 2021/6/7.
//

#import "ViewController.h"
#import "IFlyMSC/IFlyMSC.h"

@interface ViewController ()<IFlySpeechSynthesizerDelegate>
@property (nonatomic, strong)  IFlySpeechSynthesizer * iFlySpeechSynthesizer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    IFlySpeechSynthesizer *   iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    self.iFlySpeechSynthesizer = iFlySpeechSynthesizer;
    iFlySpeechSynthesizer.delegate = self;
    // 语速【0-100】
    [iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant SPEED]];
    // 音量【0-100】
    [iFlySpeechSynthesizer setParameter:@"50" forKey:[IFlySpeechConstant VOLUME]];
    // 发音人默认xiaoyan
    [iFlySpeechSynthesizer setParameter:@"xiaoyan" forKey:[IFlySpeechConstant VOICE_NAME]];
    // 音频采样率【8000或16000】
    [iFlySpeechSynthesizer setParameter:@"16000" forKey:[IFlySpeechConstant SAMPLE_RATE]];
    // 保存音频路径(默认在Document目录下)
    [iFlySpeechSynthesizer setParameter:@"tts.pcm" forKey:[IFlySpeechConstant TTS_AUDIO_PATH]];
    //文本编码格式
    [iFlySpeechSynthesizer setParameter:@"unicode" forKey:[IFlySpeechConstant TEXT_ENCODING]];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.iFlySpeechSynthesizer startSpeaking:@"北京-上海"];

}
#pragma mark --- 语音合成代理方法
/**
 * 合成缓冲进度【0-100】
 */
- (void)onBufferProgress:(int)progress message:(NSString *)msg {
    NSLog(@"合成缓冲进度：%d/100",progress);
}
/**
 * 合成开始
 */
- (void)onSpeakBegin {
    NSLog(@"合成播放开始！");
}

/**
 * 合成播放进度【0-100】
 */
- (void)onSpeakProgress:(int)progress beginPos:(int)beginPos endPos:(int)endPos {
    NSLog(@"合成播放进度：%d/100",progress);

}
/**
 * 合成结束
 */
- (void)onCompleted:(IFlySpeechError *)error {
    NSLog(@"合成结束！");
}
@end
