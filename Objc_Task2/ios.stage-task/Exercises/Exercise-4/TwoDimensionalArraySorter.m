#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {

    BOOL isOneDimensionalArray = true;
    for (NSArray* item in array) {
        if ([item isKindOfClass:[NSArray class]]) {
            isOneDimensionalArray = false;
        }
    }
    if (isOneDimensionalArray) {
        return @[];
    }
    NSMutableArray *digitsArray = [[NSMutableArray alloc] init];
    NSMutableArray *stringsArray = [[NSMutableArray alloc] init];
    
    for (NSArray* item in array) {
        
        for (int i = 0; i < item.count; i++) {
            if ([[item objectAtIndex:i] isKindOfClass:[NSString class]]) {
                [stringsArray addObject: [item objectAtIndex:i]];
            }
            if ([[item objectAtIndex:i] isKindOfClass:[NSNumber class]]) {
                [digitsArray addObject: [item objectAtIndex:i]];
            }
        }
    }
    
    NSArray *sortedDigitsArray = [digitsArray sortedArrayUsingSelector: @selector(compare:)];
    NSArray *sortedStringsArray = [stringsArray sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    if ((sortedDigitsArray.count != 0) && (sortedStringsArray.count == 0)) {
        return sortedDigitsArray;
    } else if ((sortedDigitsArray.count == 0) && (sortedStringsArray.count != 0)) {
        return sortedStringsArray;
    } else {
        return @[sortedDigitsArray, sortedStringsArray];
    }
}

@end

