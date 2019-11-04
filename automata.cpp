#include <bitset>
#include <stdio.h>
#include <iostream>
#define SIZE 200
using namespace std;


int main()
{
	std::bitset<SIZE> grid;
    grid.set(16);
	std::cout << grid.to_string() << "\n" ;
	for(int i = 0 ; i < 10 ; i++)
	{
		for(int j = 1; j < (SIZE -1 ); j++)
		{ 		
			if(grid[j] == 1)
			{

				grid.set(j-1);
				grid.set(j+1);
				grid.reset(j);
				j++;
			}
			
		}
		
		std::cout << grid.to_string() << "\n" ;


	}
}

