#include "../../test/printing.hpp"
#include "../../lib/console.h"

void test_memory_allocator_array()
{
    int n = 10;
    char* niz = new char[n];
    if (niz == nullptr)
        printString("Neuspesna alokacija!\n");

    for (int i = 0; i < n; i++)
        niz[i] = 'd';

    for (int i = 0; i < n; i++)
        __putc(niz[i]);
    printString("\n");
    delete[] niz;

    // excpected output == >
    // d d d d d d d d d d
    // Uspesno brisanje!
}


void test_memory_allocator_matrix() {
    int n = 16;
    char** matrix = new char*[n];
    if(matrix == nullptr)
    {
        printString("Matrix je nullptr \n");
        return;
    }
    for(int i = 0; i < n; i++) {
        matrix[i] = new char[n];
        if(matrix[i] == nullptr)
        {
            printString("Matrix i = ");
            printInt(i);
            printString(" nullptr\n");
            return;
        }
    }

    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            matrix[i][j] = 'k';
        }
    }

    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++)
        {
            __putc(matrix[i][j]);
            printString(" ");
        }
        printString("\n");
    }


    for(int i = 0; i < n; i++)
    {
        delete[] matrix[i];
    }
    delete[] matrix;

    // matrica 16x16 popunjena sa 'k'
}