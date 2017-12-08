#include <string.h>
#include "hamming.h"

int compute(const char * left, const char * right) {
    if (left == 0 && right == 0) {
        return 0;
    }
    if (left == 0 || right == 0) {
        return -1;
    }
    size_t length = strlen(left);
    if (length != strlen(right)) {
        return -1;
    }
    int result = 0;
    for (size_t i = 0; i < length; i++) {
        if (left[i] != right[i]) {
            result ++;
        }
    }
    return result;
}
