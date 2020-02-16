#include<stdio.h>
#include<stdlib.h>
#include"Doubly_CLL.h"
#include"Doubly_CLL_aux.h"

list_t *create_list(){
	node_t *node=get_node(0);
	if(node!=NULL){
		node->next=node;
		node->prev=node;
		return node;
	}else
		return NULL;
}
result_t insert_beg(list_t *list,data_t data){
	node_t *new_node;
	if(list!=NULL){
		new_node=get_node(data);
		generic_insert(list,new_node);
		return SUCCESS;
	}else
		return FAILURE;
}
result_t insert_end(list_t *list,data_t data){
	node_t *new_node;
	if(list!=NULL){
		new_node=get_node(data);
		generic_insert(list->prev,new_node);
		return SUCCESS;
	}else
		return FAILURE;
}
result_t insert_after(list_t *list,data_t data,data_t new_data){
	node_t *node=search_node(list,data);
	node_t *new_node;
	if(node!=NULL){
		new_node=get_node(new_data);
		generic_insert(node,new_node);
		return SUCCESS;
	}else
		return FAILURE;
}
result_t insert_before(list_t *list,data_t data,data_t new_data){
	node_t *node=search_node(list,data);
	node_t *new_node;
	if(node!=NULL){
		new_node=get_node(new_data);
		generic_insert(node->prev,new_node);
		return SUCCESS;
	}else
		return FAILURE;
}

result_t delete_data(list_t *list,data_t e_data){
	node_t *node=search_node(list,e_data);
	if(node!=NULL){
		generic_delete(node);
		return SUCCESS;
	}else
		return FAILURE;
}
result_t delete_end(list_t *list){
	if(list->prev!=list){
		generic_delete(list->prev);
		return SUCCESS;
	}else
		return FAILURE;
}
result_t delete_beg(list_t *list){
	if(list->next!=list){
		generic_delete(list->next);
		return SUCCESS;
	}else
		return FAILURE;
}

result_t is_list_empty(list_t *list){
	if(list->next==list && list->prev==list){
		return TRUE;
	}else
		return FALSE;
}
result_t search(list_t *list,data_t data){
	node_t *node=search_node(list,data);
	if(node!=NULL){
		return SUCCESS;
	}else
		return ELEMENT_NOT_FOUND;
}
result_t destroy_list(list_t **pp_list){
	node_t *list=*pp_list;
	node_t *run=list->next;
	node_t *run_back;
	while(run!=list){
		run_back=run->next;
		free(run);
		run=run_back;
	}
	free(list);
	*pp_list=NULL;
	return SUCCESS;
}

void display_list(list_t *list){
	node_t *run=list->next;
	printf("[BEG]<->");
	while(run!=list){
		printf("[%d]<->",run->data);			
		run=run->next;
	}
	printf("[END]\n");
}

