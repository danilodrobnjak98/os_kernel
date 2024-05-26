#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"

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
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);

   // test_mem_allocator();
   while(true)
   {
       MemoryAllocator::printString("Unesite tekst string : ");
       char c = getc();
       MemoryAllocator::printString("\n");
       if (c == 'q') break;
   }

    return 0;
}
