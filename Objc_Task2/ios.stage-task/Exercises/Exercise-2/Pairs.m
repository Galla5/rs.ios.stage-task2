#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    int count = 0;

    for (NSNumber* item in array) {
        for (NSNumber* item1 in array) {
            if ((item.intValue - item1.intValue) == number.intValue) {
                count += 1;
            }
        }
    }
    return count;
}

@end

