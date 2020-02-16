#include<stdio.h>
#include<stdlib.h>

void* get_block(int,int);
int main(void){
	void *temp=get_block(1,4);
	if(temp!=NULL){
		printf("get_block success\n");
	}else
		printf("get_block failed\n");

	exit(EXIT_SUCCESS);
}
