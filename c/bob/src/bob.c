#include <stdbool.h>
#include <ctype.h>
#include <string.h>
#include "bob.h"

const char *fine = "Fine. Be that way!";
const char *whatever = "Whatever.";
const char *sure = "Sure.";
const char *chill = "Whoa, chill out!";

const char *hey_bob(const char *greeting) {
    if (greeting == 0) {
        return fine;
    }

    bool isEmpty = true;
    bool isYelling = true;
    bool hasLetters = false;
    char lastCharacter = '.';
    for(int i = 0; greeting[i]; i++) {
        if(isEmpty) {
            isEmpty = (greeting[i] == ' ');
        }
        if(isYelling) {
            isYelling = (!islower(greeting[i]));
        }
        if(!hasLetters) {
            hasLetters = isalpha(greeting[i]);
        }
        if(greeting[i] != ' ') {
            lastCharacter = greeting[i];
        }
    }

    if(isEmpty) { return fine; }
    if(isYelling && hasLetters) { return chill; }
    if(lastCharacter == '?') { return sure; }
    return whatever;
}
