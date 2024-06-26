#ifndef _INITIALIZATION_HPP_
#define _INITIALIZATION_HPP_

#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/tcb.hpp"
#include "../test/printing.hpp"

namespace Initialization
{
    void Initialize()
    {
        MemoryAllocator::mem_init();

        Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
        __asm__ volatile ("csrc sie, %[mask]" : : [mask] "r"(2));
        Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

        thread_t run;
        thread_create(&run, nullptr, nullptr);
        TCB::running = run;
    }

    void Unitialize()
    {
        printString("Finished Danilo Drobnjak\n");
        Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
        delete TCB::running;
    }
}
#endif // _INITIALIZATION_HPP_