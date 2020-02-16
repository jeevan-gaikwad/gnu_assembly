#ifndef _DOUBLY_CLL_H
#define _DOUBLY_CLL_H

#include<stdio.h>
#include<stdlib.h>

#define SUCCESS 0
#define FAILURE 1
#define LIST_EMPTY 2
#define ELEMENT_NOT_FOUND
#define TRUE 0
#define FALSE 1

typedef int data_t;
typedef int result_t;

struct _node{
	data_t data;
	struct _node *prev,*next;
};
typedef struct _node list_t;
typedef struct _node node_t;


list_t *create_list();
result_t insert_beg(list_t *list,data_t data);
result_t insert_end(list_t *list,data_t data);
result_t insert_after(list_t *list,data_t e_data,data_t new_data);
result_t insert_before(list_t *list,data_t e_data,data_t new_data);

result_t delete_data(list_t *list,data_t e_data);
result_t delete_end(list_t *list);
result_t delete_beg(list_t *list);

result_t is_list_empty(list_t *list);
result_t search(list_t *list,data_t data);
result_t destroy_list(list_t **pp_list);
void display_list(list_t *list);

#endif
