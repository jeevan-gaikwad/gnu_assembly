#ifndef _DOUBLY_CLL_AUX_H
#define _DOUBLY_CLL_AUX_H
	
#include<stdio.h>
#include"Doubly_CLL.h"
#include"Doubly_CLL_common.h"
node_t* get_node(data_t data);
node_t* search_node(list_t *list,data_t data);
void generic_insert(list_t *e_node,list_t *new_node);
void generic_delete(list_t *e_node);
#endif
