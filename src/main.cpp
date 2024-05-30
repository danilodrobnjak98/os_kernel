#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/tcb.hpp"
#include "../test/printing.hpp"
#include "../test/userMain.hpp"

int main()
{
    MemoryAllocator::mem_init();
    Riscv::w_stvec((uint64) &Riscv::supervisorTrap);
    __asm__ volatile ("csrc sie, %[mask]" : : [mask] "r"(2));
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);
    thread_t run;
    thread_create(&run, nullptr, nullptr);

    TCB::running = run;
    userMain();

    printString("Finished Danilo Drobnjak\n");
    Riscv::mc_sstatus(Riscv::SSTATUS_SIE);
    delete TCB::running;

    return 0;
}
