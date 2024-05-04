#ifndef _TCB_HPP_
#define _TCB_HPP_

#include "../lib/hw.h"
#include "scheduler.hpp"

// Thread Control Block
class TCB
{
public:
    // friends and consts
    friend class Riscv;

    using Body = void (*)();
   // using Body = void (*)(void *);

    static uint64 constexpr STACK_SIZE = 1024;
    static uint64 constexpr TIME_SLICE = 2;

    // creation and destruction
    static TCB *createThread(Body body);
    ~TCB() { delete[] stack; }

    // getters and setters
    bool isFinished() const { return finished; }
    void setFinished(bool value) { finished = value; }
    uint64 getTimeSlice() const { return timeSlice; }
    void setTimeSlice(uint64 ts) { timeSlice = ts; }

    // yield
    static void yield();

    // static attribute running thread
    static TCB *running;
private:
    TCB(Body body, uint64 timeSlice);

    struct Context
    {
        uint64 ra;
        uint64 sp;
    };

    Body body;
    uint64 *stack;
    Context context;
    uint64 timeSlice;
    bool finished;
    static uint64 timeSliceCounter;

    static void threadWrapper();
    static void contextSwitch(Context *oldContext, Context *runningContext);
    static void dispatch();
};
#endif //_TCB_HPP_
