#include <stdbool.h>
#include <stdio.h>
#include "raindrops.h"

#define BUFFER_LENGTH 16

void convert(char *expected, int drops) {
    int offset = 0;
    if ((drops % 3) == 0) {
        snprintf(expected, BUFFER_LENGTH, "%s", "Pling");
        offset += 5;
    }
    if ((drops % 5) == 0) {
        snprintf(expected + offset, BUFFER_LENGTH - offset, "%s", "Plang");
        offset += 5;
    }
    if ((drops % 7) == 0) {
        snprintf(expected + offset, BUFFER_LENGTH - offset, "%s", "Plong");
        offset += 5;
    }
    if (offset == 0) {
        snprintf(expected, BUFFER_LENGTH, "%d", drops);
    }
}
