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
    MemoryAllocator::mem_init();
    test_mem_allocator();
    return 0;
}