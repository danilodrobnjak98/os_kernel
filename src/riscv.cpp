#include "../h/riscv.hpp"

#include "../lib/console.h"
#include "../test/printing.hpp"
#include "../h/tcb.hpp"
#include "../h/scb.hpp"
#include "../h/MemoryAllocator.hpp"

void Riscv::popSppSpie()
{
    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

size_t Riscv::readSyscallReg()
{
    size_t code;
    __asm__ volatile ("mv %0, a0" : "=r" (code));
    return code;
}

void Riscv::putReturnValue(int retValueInt , void* memAllocValue)
{
    if(memAllocValue == nullptr && retValueInt == INVALID_RETURN_VALUE)
    {
        printString("Mem alloc return nullptr value! \n");
        return;
    }
    if(memAllocValue != nullptr && retValueInt == INVALID_RETURN_VALUE) // mem_alloc success
    {
        __asm__ volatile("csrw sscratch, %0" : : "r" (memAllocValue));
        return;
    }
    else if(memAllocValue== nullptr && retValueInt != INVALID_RETURN_VALUE)
    {
        __asm__ volatile("csrw sscratch, %0" : : "r" (retValueInt));
        return;
    }
}

void Riscv::handleSupervisorTrap()
{
    uint64 scause = r_scause();

    if (scause == ECALL_USER || scause == ECALL_SUPER)
    {
        uint64 volatile sepc = r_sepc() + 4;
        uint64 volatile sstatus = r_sstatus();
        uint64 sysCallRegisterCode = readSyscallReg();

        if (sysCallRegisterCode == SysCallRegistersID::_MEM_ALLOC)
        {
            uint64 memAllocArgument;
            __asm__ volatile("mv %0, a1" : "=r" (memAllocArgument));
            void* returnVal = MemoryAllocator::mem_alloc(memAllocArgument);
            putReturnValue(INVALID_RETURN_VALUE, returnVal);
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_MEM_FREE)
        {
            void* memFreeArgument;
            __asm__ volatile("mv %0, a1" : "=r" (memFreeArgument));
            int returnVal = MemoryAllocator::mem_free(memFreeArgument);
            putReturnValue(returnVal, nullptr);
        }
        else if (sysCallRegisterCode == SysCallRegistersID::_GETC)
        {
            char retVal = __getc();
            __asm__ volatile("csrw sscratch, %0" : : "r" (retVal));
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_PUTC)
        {
            char argumentPutc;
            __asm__ volatile("mv %0, a1" : "=r" (argumentPutc));
            __putc(argumentPutc);
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_THREAD_DISPATCH)
        {
            TCB::dispatch();
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_THREAD_CREATE)
        {
            TCB** handle;
            TCB::Body function;
            void* args;
            __asm__ volatile ("ld %[handle], 11 * 8(s0)": [handle] "=r"(handle));
            __asm__ volatile ("ld %[func], 12 * 8(s0)": [func] "=r"(function));
            __asm__ volatile ("ld %[arg], 13 * 8(s0)": [arg] "=r"(args));

            *handle = TCB::createThread(function, args);
            putReturnValue(0, nullptr);
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_THREAD_EXIT)
        {
            TCB::threadExit();
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_SEM_OPEN)
        {
            sem_t *handle;
            uint val;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            __asm__ volatile("mv %0, a2" : "=r" (val));
            *handle = new SCB(handle, val);
            int ret = 0;
            putReturnValue(ret, nullptr);
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_SEM_CLOSE)
        {
            sem_t handle;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            delete handle;
            int ret = 0;
            putReturnValue(ret, nullptr);
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_SEM_SIGNAL)
        {
            sem_t handle;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            int ret = handle->signal();
            putReturnValue(ret, nullptr);
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_SEM_WAIT)
        {
            sem_t handle;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            int ret = handle->wait();
            putReturnValue(ret, nullptr);
        }
        else if(sysCallRegisterCode == SysCallRegistersID::_SEM_TRYWAIT)
        {
            sem_t handle;
            __asm__ volatile("mv %0, a1" : "=r" (handle));
            int ret = handle->tryWait();
            putReturnValue(ret, nullptr);
        }

        w_sstatus(sstatus);
        w_sepc(sepc);
    } else if (scause == SOFTWARE_INTERRUPT)
    {
        mc_sip(SIP_SSIP);
    } else if (scause == HARDWARE_INTERRUPT)
    {
        console_handler();
    } else
    {
       // printString("0" + scause);
        printString("DANILOOOOO \n");
        // unexpected trap cause
        if(scause == 0x0000000000000002UL)printString("Error 2\n");
        if(scause == 0x0000000000000005UL)printString("Error 5\n");
        if(scause == 0x0000000000000007UL)printString("Error 7\n");
    }
}