#include<stdio.h>
#include<stdlib.h>
#include"Doubly_CLL_common.h"

void* get_block(int no_of_blocks,int size_per_block){
	void *temp=calloc(no_of_blocks,size_per_block);
	if(temp==NULL){
		fprintf(stderr,"get_block:Memory allocation failed.Exiting..\n");
		exit(EXIT_FAILURE);
	}else
		return temp;
}
