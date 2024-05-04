#include "../h/MemoryAllocator.hpp"
using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    return MemoryAllocator::mem_alloc(n);
}

void *operator new[](size_t n)
{
    return MemoryAllocator::mem_alloc(n);
}

void operator delete(void *p) noexcept
{
   int sts = MemoryAllocator::mem_free(p);
   if(sts != 0)
   {
       MemoryAllocator::printString("ERROR delete(), mem_free prilikom brisanja!\n");
   }
}

void operator delete[](void *p) noexcept
{
    int sts = MemoryAllocator::mem_free(p);
    if(sts != 0)
    {
        MemoryAllocator::printString("ERROR delete(), mem_free prilikom brisanja!\n");
    }
}