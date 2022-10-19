game_name := example-game
warning_level := -Wall
CFLAGS := $(warning_level) $(shell pkg-config --cflags glfw3) $(shell pkg-config --cflags glm) 
CLIBS := $(shell pkg-config --static --libs glfw3) $(shell pkg-config --static --libs glm)

example-game : $(patsubst %.cpp,%.o,$(wildcard *.cpp)) Makefile
	$(CXX) $(CFLAGS) -o ${game_name} *.o $(CLIBS)

.PHONY : clean
clean :; rm -f *.o ${game_name}

%.o : %.cpp *.hpp; $(CXX) -c $(CFLAGS) -o $@ $<	


