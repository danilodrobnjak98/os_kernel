#include "../h/syscall_c.hpp"
#include "../h/util.hpp"

void* mem_alloc(size_t size)
{
    __asm__ volatile ("mv a1, %[size]":: [size] "r"(size));
    asm volatile("mv a0, %[id]" : :  [id]"r"(SysCallRegistersID::_MEM_ALLOC));
    __asm__ volatile ("ecall");
    uint64 ret_value;
    __asm__ volatile ("mv %[ret_value], a0" : [ret_value] "=r"(ret_value));
    return (void*)ret_value;
}

int mem_free(void *ptr) {
    asm volatile("mv a1, a0");
    asm volatile("mv a0, %0" : :  "r" (SysCallRegistersID::_MEM_FREE));
    __asm__ volatile ("ecall");
    int ret_value;
    __asm__ volatile ("mv %[ret_value], a0" : [ret_value] "=r"(ret_value));
    return ret_value;
}
