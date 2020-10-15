PHONY: info 

MAJOR:=1
MINOR:=0
NAME:=jft
MODE:=info
VERSION:=$(MAJOR).$(MINOR)
GXXVERSION:= $(shell g++ --version | head -n 1)

CXXFLAGS=-fPIC -O3 -Wall -Werror --std=c++11
LDFLAGS=

SRCS=$(wildcard src/*.cpp)
OBJS=$(SRCS:%.cpp=%.o)

all: info $(NAME)

debug: CXXFLAGS=-fPIC -O3 -Wall -Werror -ggdb --std=c++11
debug: MODE:=debug
debug: info $(NAME)

release: MODE:=release
release: info $(NAME)

info:
	@echo "============================== Compilation Info ==============================="
	@echo "Compiler: $(GXXVERSION)"
	@echo "CXX Flags: $(CXXFLAGS)"
	@echo "LD Flags: $(LDFLAGS)"
	@echo "Sources: $(SRCS)"
	@echo "Objects: $(OBJS)"
	@echo "Binary: $(NAME)"
	@echo "Version: $(VERSION)"
	@echo "Mode: $(MODE)"
	@echo "==============================================================================="

$(NAME): $(OBJS)
	@echo "====== Compiling Application ======"
	$(CXX) $(CXXFLAGS) -o $(NAME) $(OBJS) -I. $(LDFLAGS)

%.o: %.d
	@echo "====== Creating Object:" $@ "======"
	$(CXX) $(CXXFLAGS) -c $(@:.o=.cpp) -o $@

clean:
	@echo "====== Cleaning Project ======"
	-rm -r src/*.o  
	-rm $(NAME)	

