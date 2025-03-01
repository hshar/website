#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define a structure for a transaction
typedef struct Transaction {
    char type[10];  // Transaction type (Deposit/Withdraw)
    double amount;  // Transaction amount
} Transaction;

// Stack structure
#define MAX 5  // Maximum size of the stack
Transaction stack[MAX];
int top = -1;

// Function to check if the stack is full
int isFull() {
    return top == MAX - 1;
}

// Function to check if the stack is empty
int isEmpty() {
    return top == -1;
}

// Function to push a transaction onto the stack
void push(char *type, double amount) {
    if (isFull()) {
        printf("Stack Overflow: Cannot add more transactions.\n");
        return;
    }

    top++;
    strcpy(stack[top].type, type);
    stack[top].amount = amount;
    printf("Transaction %s of $%.2f added.\n", type, amount);
}

// Function to pop a transaction from the stack (undo)
void pop() {
    if (isEmpty()) {
        printf("No transactions to undo.\n");
        return;
    }

    printf("Undoing %s of $%.2f\n", stack[top].type, stack[top].amount);
    top--;
}

// Function to view the last transaction (peek)
void peek() {
    if (isEmpty()) {
        printf("No transactions available.\n");
        return;
    }

    printf("Last Transaction: %s of $%.2f\n", stack[top].type, stack[top].amount);
}

// Function to display all transactions
void displayTransactions() {
    if (isEmpty()) {
        printf("No transactions to display.\n");
        return;
    }

    printf("Transactions:\n");
    for (int i = 0; i <= top; i++) {
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Define a structure for a transaction
typedef struct Transaction {
    char type[10];  // Transaction type (Deposit/Withdraw)
    double amount;  // Transaction amount
} Transaction;

// Stack structure
#define MAX 5  // Maximum size of the stack
Transaction stack[MAX];
int top = -1;

// Function to check if the stack is full
int isFull() {
    return top == MAX - 1;
}

// Function to check if the stack is empty
int isEmpty() {
    return top == -1;
}

// Function to push a transaction onto the stack
void push(char *type, double amount) {
    if (isFull()) {
        printf("Stack Overflow: Cannot add more transactions.\n");
        return;
    }

    top++;
    strcpy(stack[top].type, type);
    stack[top].amount = amount;
    printf("Transaction %s of $%.2f added.\n", type, amount);
}

// Function to pop a transaction from the stack (undo)
void pop() {
    if (isEmpty()) {
        printf("No transactions to undo.\n");
        return;
    }

    printf("Undoing %s of $%.2f\n", stack[top].type, stack[top].amount);
    top--;
}

// Function to view the last transaction (peek)
void peek() {
    if (isEmpty()) {
        printf("No transactions available.\n");
        return;
    }

    printf("Last Transaction: %s of $%.2f\n", stack[top].type, stack[top].amount);
}

// Function to display all transactions
void displayTransactions() {
    if (isEmpty()) {
        printf("No transactions to display.\n");
        return;
    }

    printf("Transactions:\n");
    for (int i = 0; i <= top; i++) {
        printf("%d. %s of $%.2f\n", i + 1, stack[i].type, stack[i].amount);
    }
}

int main() {
    int choice;
    double amount;
    char type[10];

    while (1) {
        printf("\nSmart Banking System\n");
        printf("1. Deposit\n");
        printf("2. Withdraw\n");
        printf("3. Undo Last Transaction\n");
        printf("4. View Last Transaction\n");
        printf("5. View All Transactions\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter deposit amount: ");
                scanf("%lf", &amount);
                strcpy(type, "Deposit");
                push(type, amount);
                break;
            case 2:
                printf("Enter withdrawal amount: ");
                scanf("%lf", &amount);
                strcpy(type, "Withdraw");
                push(type, amount);
                break;
            case 3:
                pop();
                break;
            case 4:
                peek();
                break;
            case 5:
                displayTransactions();
                break;
            case 6:
                printf("Exiting...\n");
                exit(0);
                break;
            default:
                printf("Invalid choice! Please try again.\n");
        }
    }

    return 0;
}
