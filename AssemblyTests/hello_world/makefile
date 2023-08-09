NASM = nasm
LD = ld

NASM_FLAGS = -f elf64
LD_FLAGS =

EXECUTABLE = hello

SRC = helloworld.asm main.asm
OBJ = $(SRC:.asm=.o)

.PHONY: all
all: clean $(EXECUTABLE)

.PHONY: debug
debug: add_debugger all

add_debugger:
	$(eval NASM_FLAGS += -g)

$(EXECUTABLE): $(OBJ)
	$(LD) $(LD_FLAGS) -o $@ $^

%.o: %.asm
	$(NASM) $(NASM_FLAGS) -o $@ $<

.PHONY: clean
clean:
	rm -f $(EXECUTABLE) $(OBJ)