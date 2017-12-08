#include <ctype.h>
#include <stdlib.h>
#include <string.h>
#include "isogram.h"

bool is_isogram(const char * input) {
    int length = strlen(input);
    char lowercase[length];
    for (int i = 0; input[i]; i++) {
        lowercase[i] = tolower(input[i]);
    }

    for (int i = 0; lowercase[i]; i++) {
        if (lowercase[i] == '-' || lowercase[i] == ' ') { continue; }
        for (int j = i + 1; lowercase[j]; j++) {
            if (lowercase[i] == lowercase[j]) {
                return false;
            }
        }
    }
    return true;
}
