#include "../lib/hw.h"
#include "../h/ccb.hpp"
#include "../h/print.hpp"

static uint64 fibonacci(uint64 n)
{
    if (n == 0 || n == 1) { return n; }
    if (n % 4 == 0) CCB::yield();
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA()
{
    uint8 i = 0;
    for (; i < 3; i++)
    {
        printString("A: i=");
        printInteger(i);
        printString("\n");
    }

    printString("A: yield\n");
    __asm__ ("li t1, 7");
    CCB::yield();

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));

    printString("A: t1=");
    printInteger(t1);
    printString("\n");

    uint64 result = fibonacci(20);
    printString("A: fibonaci=");
    printInteger(result);
    printString("\n");

    for (; i < 6; i++)
    {
        printString("A: i=");
        printInteger(i);
        printString("\n");
    }

    CCB::running->setFinished(true);
    CCB::yield();
}

void workerBodyB()
{
    uint8 i = 10;
    for (; i < 13; i++)
    {
        printString("B: i=");
        printInteger(i);
        printString("\n");
    }

    printString("B: yield\n");
    __asm__ ("li t1, 5");
    CCB::yield();

    uint64 result = fibonacci(23);
    printString("A: fibonaci=");
    printInteger(result);
    printString("\n");

    for (; i < 16; i++)
    {
        printString("B: i=");
        printInteger(i);
        printString("\n");
    }

    CCB::running->setFinished(true);
    CCB::yield();
}