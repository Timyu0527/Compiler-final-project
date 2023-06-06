#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct Node{
    int num, type; // type: 0 for int, 1 for char *
    char *str;
    struct Node *next;
};

void init(struct Node **head);
void print_list(struct Node *head);
void push_back(struct Node **head, int type, int num, char *str);
void pop_front(struct Node **head);
void *top(struct Node *head, int type);