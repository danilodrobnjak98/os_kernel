#include "../h/ccb.hpp"
#include "../h/workers.hpp"
#include "../h/print.hpp"
#include "../h/MemoryAllocator.hpp"

extern void test_memory_allocator_array();
extern void test_memory_allocator_matrix();

void test_mem_allocator()
{
    test_memory_allocator_matrix();
    MemoryAllocator::printString("\n");
    test_memory_allocator_array();

}

int main()
{
    CCB *coroutines[3];
    MemoryAllocator::mem_init();
    coroutines[0] = CCB::createCoroutine(nullptr);
    CCB::running = coroutines[0];

    coroutines[1] = CCB::createCoroutine(workerBodyA);
    printString("CoroutineA created\n");
    coroutines[2] = CCB::createCoroutine(workerBodyB);
    printString("CoroutineB created\n");

    while (!(coroutines[1]->isFinished() &&
             coroutines[2]->isFinished()))
    {
        CCB::yield();
    }

    for (auto &coroutine: coroutines)
    {
        delete coroutine;
    }
    printString("Finished\n");

    return 0;
}
