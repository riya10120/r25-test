CC = gcc
CFLAGS = -Og -g -Wall

# Default target
all: build

# Build the executable
build:
	$(CC) $(CFLAGS) src/*.c lib/*.c -Iinclude -lm -o main.exe

# Run tests
check: build
	@echo "--------------------------------------------"
	@echo "Checking..."
	@echo "Test-1: "
	./main.exe test/sbus_data\[1\] test/sab_data[1]
	diff test/sab_data[1] test/expected[1]
	@echo "Test-2: "
	./main.exe test/sbus_data\[2\] test/sab_data[2]
	diff test/sab_data[2] test/expected[2]
	@echo "Test-3: "
	./main.exe test/sbus_data\[3\] test/sab_data[3]
	diff test/sab_data[3] test/expected[3]
	@echo "**** Success: ***"
	@echo "--------------------------------------------"

# Clean up build files
clean:
	del main.exe

.PHONY: clean check all build
