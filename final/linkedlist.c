#include "linkedlist.h"

void init(struct Node **head){
    for(; *head != NULL;){
        pop_front(head);
    }
}

void push_back(struct Node **head, int type, int num, char *str){
    struct Node *cur = *head;
    if(cur == NULL){
        *head = (struct Node *)malloc(sizeof(struct Node));
        (*head)->type = type;
        if(type == 0) (*head)->num = num;
        else (*head)->str = strdup(str);
        (*head)->next = NULL;
        return;
    }
    for(; cur->next != NULL; cur = cur->next);
    cur->next = (struct Node *)malloc(sizeof(struct Node));
    cur->next->type = type;
    if(type == 0) cur->next->num = num;
    else cur->next->str = strdup(str);
    cur->next->next = NULL;
}

void pop_front(struct Node **head){
    struct Node *cur = *head;
    if(cur == NULL) return;
    *head = cur->next;
    free(cur);
}

void *top(struct Node *head, int type){
    if(head == NULL) return NULL;
    if(type == 0) return &(head->num);
    return head->str;
}

void print_list(struct Node *head){
    struct Node *cur = head;
    for(; cur != NULL; cur = cur->next){
        if(cur->type == 0) printf("%d", cur->num);
        else printf("%s", cur->str);
    }
    printf("\n");
}