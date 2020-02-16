#include<stdio.h>
#include<stdlib.h>

void *get_block(int no_of_elements,int size_per_element){
	void *temp=calloc(no_of_elements,size_per_element);
	return temp;
}

int main(int argc,char * argv[]){
	int * arr=NULL,i,no_of_ele;
	if(argc!=2){
		printf("Error:usage: %s <size of array>\n",argv[0]);
		exit(1);
	}
	no_of_ele=atoi(argv[1]);
	arr=(int*)get_block(no_of_ele,sizeof(int));
	srand(time(0));
	printf("Filling array with rand nos bet 0 to 1K..\n");
	for(i=0;i<no_of_ele;i++)
		arr[i]=rand()%1000;
	printf("Displaying elements of the array:\n");
	for(i=0;i<no_of_ele;i++){
		printf("%d ",arr[i]);
	}
	printf("\n");
	exit(0);
}
