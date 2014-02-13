using namespace std;

class Board {

public:

	Board() { }

	void draw() {
		if(printed) {
			printf("\033[8A");
		} else {
			printed = true;
		}
		for(int x = 0; x < 8; x++) {
			for(int y = 0; y < 8; y++) {
				if((x + y) % 2 == 0) {
					
				} else {

				}
				printf("%s ", board[x][y]);
			}
			printf("\n");
		}
	}

	void move(int fromColumn, int fromRow, int toColumn, int toRow) {
		board[toColumn][toRow] = board[fromColumn][fromRow];
		board[fromColumn][fromRow] = " ";
	}

private:

	static const char
	*WHITE_KING,
	*WHITE_QUEEN,
	*WHITE_ROOK,
	*WHITE_BISHOP,
	*WHITE_KNIGHT,
	*WHITE_PAWN,
	*BLACK_KING,
	*BLACK_QUEEN,
	*BLACK_ROOK,
	*BLACK_BISHOP,
	*BLACK_KNIGHT,
	*BLACK_PAWN;

	bool printed = false;

	const char* board[8][8] = {
		{BLACK_ROOK, BLACK_KNIGHT, BLACK_BISHOP, BLACK_QUEEN, BLACK_KING, BLACK_BISHOP, BLACK_KNIGHT, BLACK_ROOK},
		{BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN, BLACK_PAWN},
		{" ", " ", " ", " ", " ", " ", " ", " "},
		{" ", " ", " ", " ", " ", " ", " ", " "},
		{" ", " ", " ", " ", " ", " ", " ", " "},
		{" ", " ", " ", " ", " ", " ", " ", " "},
		{WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN, WHITE_PAWN},
		{WHITE_ROOK, WHITE_KNIGHT, WHITE_BISHOP, WHITE_QUEEN, WHITE_KING, WHITE_BISHOP, WHITE_KNIGHT, WHITE_ROOK}
	};

};

const char* Board::WHITE_KING   = "\e[37m\u265A";
const char* Board::WHITE_QUEEN  = "\e[37m\u265B";
const char* Board::WHITE_ROOK   = "\e[37m\u265C";
const char* Board::WHITE_BISHOP = "\e[37m\u265D";
const char* Board::WHITE_KNIGHT = "\e[37m\u265E";
const char* Board::WHITE_PAWN   = "\e[37m\u265F";

const char* Board::BLACK_KING   = "\e[30m\u265A";
const char* Board::BLACK_QUEEN  = "\e[30m\u265B";
const char* Board::BLACK_ROOK   = "\e[30m\u265C";
const char* Board::BLACK_BISHOP = "\e[30m\u265D";
const char* Board::BLACK_KNIGHT = "\e[30m\u265E";
const char* Board::BLACK_PAWN   = "\e[30m\u265F";