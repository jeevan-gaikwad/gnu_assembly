#include<stdio.h>
#include<stdlib.h>
#include"Doubly_CLL.h"
#include"Doubly_CLL_common.h"
node_t* get_node(data_t data){
	node_t *node=get_block(1,sizeof(node_t));
	if(node!=NULL){
		node->data=data;
		return node;
	}
	return NULL;
}
node_t* search_node(list_t *list,data_t data){
	node_t *run=list->next;
	while(run!=list){
		if(run->data==data)
			return run;
		else
			run=run->next;
	}
	return NULL;
}
void generic_insert(list_t *e_node,list_t *new_node){
	new_node->next=e_node->next;
	new_node->prev=e_node;
	e_node->next->prev=new_node;
	e_node->next=new_node;
}
void generic_delete(list_t *e_node){
	e_node->prev->next=e_node->next;
	e_node->next->prev=e_node->prev;
	free(e_node);
}






