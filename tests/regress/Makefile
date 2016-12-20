CFLAGS += -Wall -Werror -I../../include
LDLIBS += -L../../ -lunicorn -lpthread -lrt -lm

UNAME_S := $(shell uname -s)
ifneq ($(filter Darwin%,$(UNAME_S)),)
LDLIBS := $(LDLIBS:-lrt=)
endif

EXECUTE_VARS = LD_LIBRARY_PATH=../../cmocka/src:../../ DYLD_LIBRARY_PATH=../../

TESTS_SOURCE = $(wildcard *.c)
TESTS = $(TESTS_SOURCE:%.c=%)

.PHONY: all clean test

test: $(TESTS)

all: $(TESTS)

clean:
	rm -f $(TESTS)
