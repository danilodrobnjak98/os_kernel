#include "../h/tcb.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/syscall_cpp.hpp"

TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
int TCB::posThrID = 0;
//
// Only way off thread creation, constructor is private
//
TCB *TCB::createThread(Body body, void* args)
{
    return new TCB(body, TIME_SLICE, args);
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
// wrapper for CPP api
//
void TCB::ThreadClassWrapper(void* argument)
{
    Thread* thread = static_cast<Thread*>(argument);
    thread->run();
}
//
// thread wrapper method
//
void TCB::threadWrapper()
{
    Riscv::popSppSpie();
    running->body(running->arguments);
    running->setFinished(true);
    thread_dispatch();
}
//
//  private constructor
//
TCB::TCB(Body body, uint64 timeSlice, void* args) :
        body(body),
        stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
        context({
                        (uint64)(&threadWrapper),
                        stack != nullptr ? (uint64)(&stack[STACK_SIZE]) : 0
                }),
        timeSlice(timeSlice),
        finished(false),
        arguments(args),
        threadID(++posThrID)
{
    if (body != nullptr) {
        Scheduler::put(this);
    }
}
//
// default constructor
//
TCB::TCB()
:
stack(nullptr),
finished(false)
{

}
//
//  thread exit
//
void TCB::threadExit()
{
    running->setFinished(true);
    timeSliceCounter = 0;
    thread_dispatch();
}
//
// TCB destructor
//
TCB::~TCB()
{
    if (stack)
        delete[] stack;
}
//
// getters and setters
//
bool TCB::isFinished() const
{
    return finished;
}

void TCB::setFinished(bool value)
{
    finished = value;

}

uint64 TCB::getTimeSlice() const
{
    return timeSlice;
}

void TCB::setTimeSlice(uint64 ts)
{
    timeSlice = ts;
}

void TCB::setBody(Body b)
{
    body = b;
}

TCB::Body TCB::getBody() const
{
    return body;
}
void TCB::setArg(void* arg)
{
    arguments = arg;
}

void* TCB::getArg() const
{
    return arguments;
}

int TCB::getThrID() const
{
    return threadID;
}