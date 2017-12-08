CFLAGS  = -std=c99
CFLAGS += -g
CFLAGS += -Wall
CFLAGS += -Wextra
CFLAGS += -pedantic
CFLAGS += -Werror

VFLAGS  = --quiet
VFLAGS += --tool=memcheck
VFLAGS += --leak-check=full
VFLAGS += --error-exitcode=1

.DEFAULT_GOAL := test

isogram: isogram.out
	@./isogram.out

test: tests.out
	@./tests.out

memcheck: tests.out
	@valgrind $(VFLAGS) ./tests.out
	@echo "Memory check passed"

clean:
	rm -f *.o *.out

isogram.out: src/isogram.c src/isogram.h
	@echo Compiling $@
	@cc $(CFLAGS) src/isogram.c src/main.c -o isogram.out

tests.out: test/test_isogram.c src/isogram.c src/isogram.h
	@echo Compiling $@
	@cc $(CFLAGS) src/isogram.c test/vendor/unity.c test/test_isogram.c -o tests.out
