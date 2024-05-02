#include "../../h/MemoryAllocator.hpp"
#include "../../lib/console.h"

void test_memory_allocator_array()
{
    int n = 10;
    char* niz = (char*)MemoryAllocator::mem_alloc(n* sizeof(char));
    if(niz == nullptr)
        MemoryAllocator::printString("Neuspesna alokacija! \n");

    for(int i=0;i<n;i++)
        niz[i] = 'd';

    for(int i = 0; i < n; i++){
        __putc(niz[i]);
        __putc(' ');
    }

    __putc('\n');
    int status = MemoryAllocator::mem_free(niz);
    if(status != 0)
        MemoryAllocator::printString("Neuspesno brisanje! \n");
    else
        MemoryAllocator::printString("Uspesno brisanje! \n");


    // excpected output == >
    // d d d d d d d d d d
    // Uspesno brisanje!
}

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
        __putc('?');
        __putc('0' + x);
    }
    x++;
}

void checkStatus(int status) {
    static int y = 0;
    if(status) {
        __putc('0' + y);
        __putc('?');
    }
    y++;
}

void test_memory_allocator_matrix() {
    int n = 16;
    char** matrix = (char**)MemoryAllocator::mem_alloc(n*sizeof(char*));
    checkNullptr(matrix);
    for(int i = 0; i < n; i++) {
        matrix[i] = (char *) MemoryAllocator::mem_alloc(n * sizeof(char));
        checkNullptr(matrix[i]);
    }

    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            matrix[i][j] = 'k';
        }
    }

    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            __putc(matrix[i][j]);
            __putc(' ');
        }
        __putc('\n');
    }


    for(int i = 0; i < n; i++) {
        int status = MemoryAllocator::mem_free(matrix[i]);
        if(status != 0)
            MemoryAllocator::printString("Neupseno brisanje! \n");
        checkStatus(status);
    }
    int status = MemoryAllocator::mem_free(matrix);
    if(status != 0)
        MemoryAllocator::printString("Neupseno brisanje! \n");
    checkStatus(status);

    // matrica 16x16 popunjena sa 'k'
}