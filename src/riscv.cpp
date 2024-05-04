#include "../h/riscv.hpp"

#include "../lib/console.h"
#include "../h/print.hpp"

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