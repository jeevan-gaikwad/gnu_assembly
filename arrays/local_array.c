#include<stdio.h>
#include<stdlib.h>
void array_test(int arr[],int size){
	int i=0;
	arr[0]=11;
	arr[1]=22;
	for(i=0;i<5;i++)
		printf("arr[%d]:%d\n",i,arr[i]);
}

int main(){
	int arr[5];
	arr[0]=99;
	array_test(arr,5);
	exit(EXIT_SUCCESS);
}
