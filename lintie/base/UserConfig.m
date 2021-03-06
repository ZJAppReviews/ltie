//
// Created by Away on 2018/5/20.
// Copyright (c) 2018 Away. All rights reserved.
//

#import "UserConfig.h"
#import "Literals.h"


@implementation FontInfo

- (instancetype)initWithFontName:(NSString *)fontName fontLabel:(NSString *)fontLabel {
    self = [super init];
    if (self) {
        self.fontName = fontName;
        self.fontLabel = fontLabel;
    }

    return self;
}

+ (instancetype)infoWithFontName:(NSString *)fontName fontLabel:(NSString *)fontLabel {
    return [[self alloc] initWithFontName:fontName fontLabel:fontLabel];
}

@end


@interface UserConfig ()
@end

@implementation UserConfig

+ (UserConfig *)instance {
    static UserConfig *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _fontInfos = @[
                FONT_INFO(FoneName_TYZ_XS, FoneLabel_TYZ_XS),
                FONT_INFO(FoneName_TYZ_KS, FoneLabel_TYZ_KS),
                FONT_INFO(FoneName_QG_KS, FoneLabel_QG_KS),
                FONT_INFO(FoneName_DB, FoneLabel_DB),
                FONT_INFO(FoneName_MZD, FoneLabel_MZD),
                FONT_INFO(FoneName_ZJJ_XS, FoneLabel_ZJJ_XS),
                FONT_INFO(FoneName_XC, FoneLabel_XC),
                FONT_INFO(FoneName_JBR, FoneLabel_JBR),
                FONT_INFO(FoneName_JL, FoneLabel_JL)
        ];
        _gridType = GridTypeMi;

        _color = [UIColor blackColor];

        _fontInfo = _fontInfos.firstObject;
    }

    return self;
}

- (NSArray *)colors {
    static NSArray *kColors = nil;
    if (!kColors) {
        kColors =  @[
                [UIColor blackColor],
                [UIColor redColor],
                [UIColor blueColor]
        ];
    }
    return kColors;
}

- (void)changeToNextColor {
    int len = (int)self.colors.count;

    int i = (int)[self.colors indexOfObject:self.color];
    if (i == NSNotFound) {
        self.color = [UIColor blackColor];
    } else {

        self.color = self.colors[(NSUInteger) (++i % len)];
    }

}

- (NSArray<NSString *> *)fontNames {

    return @[
            FoneName_JL,
            FoneName_TYZ_XS,
            FoneName_TYZ_KS,
            FoneName_QG_KS
    ];
}

@end
