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

char getc()
{
    __asm__ volatile("mv a0, %0" : : "r" (SysCallRegistersID::_GETC));
    __asm__ volatile("ecall");
    char retVal;
    __asm__ volatile("mv %0, a0" : "=r" (retVal));
    return retVal;
}

void putc(char c)
{
    __asm__ volatile("mv a1, a0");
    __asm__ volatile("mv a0, %0" : : "r" (SysCallRegistersID::_PUTC));
    __asm__ volatile("ecall");

}

void thread_dispatch ()
{
    __asm__ volatile("mv a0, %0" : : "r" (SysCallRegistersID::_THREAD_DISPATCH));
    __asm__ volatile("ecall");
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg)
{
    __asm__ volatile("mv a3, a2");
    __asm__ volatile("mv a2, a1");
    __asm__ volatile("mv a1, a0");
    __asm__ volatile("mv a0, %0" : : "r" (SysCallRegistersID::_THREAD_CREATE));

    __asm__ volatile ("ecall");

    int retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return retVal;
}

int thread_exit ()
{
    __asm__ volatile("mv a0, %0" : : "r" (SysCallRegistersID::_THREAD_EXIT));
    __asm__ volatile ("ecall");
    int retVal;
    __asm__ volatile ("mv %0, a0" : "=r"(retVal));
    return retVal;
}