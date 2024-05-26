#include "../h/syscall_c.hpp"
#include "../test/printing.hpp"

using size_t = decltype(sizeof(0));

void *operator new(size_t n)
{
    void* ret =  mem_alloc(n);
    return  ret;
}

void *operator new[](size_t n)
{
    return mem_alloc(n);
}

void operator delete(void *p) noexcept
{
   int sts = mem_free(p);
   if(sts != 0)
   {
       printString("ERROR delete(), mem_free prilikom brisanja!\n");
   }
}

void operator delete[](void *p) noexcept
{
    int sts = mem_free(p);
    if(sts != 0)
    {
        printString("ERROR delete(), mem_free prilikom brisanja!\n");
    }
}