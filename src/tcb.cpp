#include "../h/tcb.hpp"
#include "../h/riscv.hpp"

TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

//
// Only way off thread creation, constructor is private
//
TCB *TCB::createThread(Body body)
{
    return new TCB(body, TIME_SLICE);
}
//
// yield method
//
void TCB::yield()
{
    __asm__ volatile ("ecall");
}
//
// dispatch method which will call contextSwitch from asm
//
void TCB::dispatch()
{
    TCB *old = running;
    if (!old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();

    TCB::contextSwitch(&old->context, &running->context);
}
//
// thread wrapper method
//
void TCB::threadWrapper()
{
    Riscv::popSppSpie();
    running->body();
    running->setFinished(true);
    TCB::yield();
}
//
//  private constructor
//
TCB::TCB(Body body, uint64 timeSlice) :
        body(body),
        stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
        context({
                        (uint64)(&threadWrapper),
                        stack != nullptr ? (uint64)(&stack[STACK_SIZE]) : 0
                }),
        timeSlice(timeSlice),
        finished(false)
{
    if (body != nullptr) {
        Scheduler::put(this);
    }
}