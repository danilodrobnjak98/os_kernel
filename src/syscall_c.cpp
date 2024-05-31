#include "../h/syscall_c.hpp"
#include "../h/util.hpp"

typedef uint64 uint64_t;

#define SYSCALL_0(id) ({ \
    uint64_t ret_value; \
    __asm__ volatile( \
        "mv a0, %1\n\t" \
        "ecall\n\t" \
        "mv %0, a0" \
        : "=r" (ret_value) \
        : "r" (id) \
    ); \
    ret_value; \
})

#define SYSCALL_1(id, arg1) ({ \
    uint64_t ret_value; \
    __asm__ volatile( \
        "mv a1, %2\n\t" \
        "mv a0, %1\n\t" \
        "ecall\n\t" \
        "mv %0, a0" \
        : "=r" (ret_value) \
        : "r" (id), "r" (arg1) \
    ); \
    ret_value; \
})

#define SYSCALL_2(id, arg1, arg2) ({ \
    uint64_t ret_value; \
    __asm__ volatile( \
        "mv a2, %3\n\t" \
        "mv a1, %2\n\t" \
        "mv a0, %1\n\t" \
        "ecall\n\t" \
        "mv %0, a0" \
        : "=r" (ret_value) \
        : "r" (id), "r" (arg1), "r" (arg2) \
    ); \
    ret_value; \
})

#define SYSCALL_3(id, arg1, arg2, arg3) ({ \
    uint64_t ret_value; \
    __asm__ volatile( \
        "mv a3, %4\n\t" \
        "mv a2, %3\n\t" \
        "mv a1, %2\n\t" \
        "mv a0, %1\n\t" \
        "ecall\n\t" \
        "mv %0, a0" \
        : "=r" (ret_value) \
        : "r" (id), "r" (arg1), "r" (arg2), "r" (arg3) \
    ); \
    ret_value; \
})

void* mem_alloc(size_t size)
{
    return (void*)SYSCALL_1(SysCallRegistersID::_MEM_ALLOC, size);
}

int mem_free(void *ptr)
{
    return (int)SYSCALL_1(SysCallRegistersID::_MEM_FREE, (uint64_t)ptr);
}

char getc()
{
    return (char)SYSCALL_0(SysCallRegistersID::_GETC);
}

void putc(char c)
{
    SYSCALL_1(SysCallRegistersID::_PUTC, (uint64_t)c);
}

void thread_dispatch()
{
    SYSCALL_0(SysCallRegistersID::_THREAD_DISPATCH);
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg)
{
    return (int)SYSCALL_3(SysCallRegistersID::_THREAD_CREATE, (uint64_t)handle, (uint64_t)start_routine, (uint64_t)arg);
}

int thread_exit()
{
    return (int)SYSCALL_0(SysCallRegistersID::_THREAD_EXIT);
}

int sem_open(sem_t* handle, unsigned init)
{
    return (int)SYSCALL_2(SysCallRegistersID::_SEM_OPEN, (uint64_t)handle, (uint64_t)init);
}

int sem_close(sem_t handle)
{
    return (int)SYSCALL_1(SysCallRegistersID::_SEM_CLOSE, (uint64_t)handle);
}

int sem_wait(sem_t id)
{
    return (int)SYSCALL_1(SysCallRegistersID::_SEM_WAIT, (uint64_t)id);
}

int sem_signal(sem_t id)
{
    return (int)SYSCALL_1(SysCallRegistersID::_SEM_SIGNAL, (uint64_t)id);
}

int sem_trywait(sem_t id)
{
    return (int)SYSCALL_1(SysCallRegistersID::_SEM_TRYWAIT, (uint64_t)id);
}

int sem_signalAll(sem_t id)
{
    return (int)SYSCALL_1(SysCallRegistersID::_SEM_SIGNAL_ALL, (uint64_t)id);
}
