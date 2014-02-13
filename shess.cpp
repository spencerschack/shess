#include <stdio.h>
#include <string>
#include <unistd.h>

#include "board.cpp"

using namespace std;

/*
package main

import (
	"fmt"
	"time"
)

const (
	blue  = "\x1b[34m"
	green = "\x1b[32m"
)

func main() {
	fmt.Printf("%sHello world!\n", blue)
	time.Sleep(1000 * time.Millisecond)
	fmt.Printf("\033[1A%sHello world!\n", green)
}
*/

const char blue[]  = "\x1b[34m";
const char green[] = "\x1b[32m";
const char up[]    = "\033[1A";

void printColor(char str[], const char color[]) {
	printf("%s%s%s\n", up, color, str);
}

int main(int argc, char* argv[]) {
	Board board = Board();
	board.draw();
	sleep(1);
	board.move(1, 1, 2, 1);
	board.draw();
	sleep(1);
	return 0;
}
