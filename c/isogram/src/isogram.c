#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include "isogram.h"

bool is_isogram(const char * input) {
    for (int i = 0; input[i]; i++) {
        if (!isalpha(input[i])) continue;
        for (int j = i + 1; input[j]; j++) {
            if (tolower(input[i]) == tolower(input[j])) {
                return false;
            }
        }
    }
    return true;
}
