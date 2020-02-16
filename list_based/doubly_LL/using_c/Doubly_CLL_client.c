#include<stdio.h>
#include<stdlib.h>
#include"Doubly_CLL.h"

int main(void){
	list_t *list=create_list();
	node_t *node;
	data_t data;
	result_t result;
	int i;

	srand(time(0));
	if(list!=NULL){
		printf("List created successfully!\n");
	}else
		printf("Failed to create the list.\n");
	
	result=is_list_empty(list);
	if(result==TRUE){
		printf("list is empty.\n");
	}else
		printf("list is not empty.\n");
	printf("Testing insert begining with 5 random elements..\n");
	for(i=0;i<5;i++){
		data=rand()%100;
		result=insert_beg(list,data);
		if(result==SUCCESS){
			printf("insert_beg: %d inserted successfully!\n",data);
		}else{
			printf("insert_beg: Failed to insert %d. Exiting..\n",data);
			exit(EXIT_FAILURE);
		}	
	}

	result=is_list_empty(list);
	if(result==TRUE){
		printf("list is empty.\n");
	}else
		printf("list is not empty.\n");
	display_list(list);
	insert_end(list,99);
	insert_end(list,77);

	printf("Testing insert end with 5 random elements..\n");
	for(i=0;i<5;i++){
		data=rand()%100;
		result=insert_end(list,data);
		if(result==SUCCESS){
			printf("insert_end: %d inserted successfully!\n",data);
		}else{
			printf("insert_end: Failed to insert %d. Exiting..\n",data);
			exit(EXIT_FAILURE);
		}	
	}
	display_list(list);
	printf("Testing delete data with 99\n");
	result=delete_data(list,99);
	if(result==SUCCESS){
		printf("99 deleted successfully!\n");
		display_list(list);
	}else
		printf("Failed to delete 99\n");
	
	result=insert_after(list,77,123);
	if(result==SUCCESS){
			printf("insert_after: %d inserted successfully after 77!\n",123);
			display_list(list);
		}else{
			printf("insert_beg: Failed to insert %d after 77. Exiting..\n",123);
			exit(EXIT_FAILURE);
	}
	result=insert_before(list,77,321);
	if(result==SUCCESS){
			printf("insert_before: %d inserted successfully before 77!\n",321);
			display_list(list);
		}else{
			printf("insert_before: Failed to insert %d before 77. Exiting..\n",321);
			exit(EXIT_FAILURE);
	}
	result=delete_beg(list);
	if(result==SUCCESS){
			printf("delete_beg success.\n");
			display_list(list);
		}else{
			printf("delete_beg failed\n");
			exit(EXIT_FAILURE);
	}
	result=delete_end(list);
	if(result==SUCCESS){
			printf("delete_end success.\n");
			display_list(list);
		}else{
			printf("delete_end failed\n");
			exit(EXIT_FAILURE);
	}


	result=destroy_list(&list);
	if(result==SUCCESS){
		printf("List destroyed successfully!\n");
	}else
		printf("Failed to destroy the list.\n");

	exit(EXIT_SUCCESS);
}
