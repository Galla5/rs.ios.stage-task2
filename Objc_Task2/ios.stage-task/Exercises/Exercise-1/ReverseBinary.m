#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    NSString *string = @"";
    NSUInteger x = n;

    while(x>0) {
        string = [[NSString stringWithFormat: @"%lu", x&1] stringByAppendingString:string];
        x = x >> 1;
    }
    if (string.length < 8) {
        NSMutableString *bitString = [[NSMutableString alloc] initWithCapacity:8];
        int zeroCount = abs(string.length - 8);
        for (int i = 1; i <= zeroCount; i++) {
            [bitString appendString:@"0"];
        }
        [bitString appendString: string];
        string = [NSString stringWithString:bitString];
    }
    
    int len = [string length];
    NSMutableString *reverseName = [[NSMutableString alloc] initWithCapacity:len];
    for(int i=len-1; i>=0; i--){
        [reverseName appendFormat:[NSString stringWithFormat:@"%c",[string characterAtIndex:i]]];
    }
    long result = strtol([reverseName UTF8String], NULL, 2);
    return result;
}

