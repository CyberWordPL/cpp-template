override MAKEFLAGS += -rR

BINNAME = template

CXX = g++
CFLAGS = \
	-Wall \
	-Wextra \
	-Werror \
	-Wpedantic \
	-std=c++23 \
	-O3 \
	-fpic

CPPFLAGS = \
	-I include \
	-MMD \
	-MP

CXXFILES = $(shell cd src && find . -name "*.cc")
OBJFILES = $(addprefix obj/,$(CXXFILES:.cc=.o))
DEPS = $(addprefix obj/,$(CXXFILES:.cc=.d))

build: $(OBJFILES)
	$(CXX) -o $(BINNAME) $(OBJFILES)

-include $(DEPS)

clear:
	rm -r obj $(BINNAME)

obj/%.o: src/%.cc
	mkdir -p obj
	$(CXX) $(CFLAGS) $(CPPFLAGS) -o $@ -c $<
