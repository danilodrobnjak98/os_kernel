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
    friend class Thread;

    using Body = void (*)(void *);

    static uint64 constexpr STACK_SIZE = DEFAULT_STACK_SIZE;
    static uint64 constexpr TIME_SLICE = DEFAULT_TIME_SLICE;

    // creation and destruction
    static TCB *createThread(Body body, void* args);
    static void threadExit();
    static void ThreadClassWrapper(void* argument);

    ~TCB();

    // getters and setters
    bool isFinished() const;
    void setFinished(bool value);
    uint64 getTimeSlice() const;
    void setTimeSlice(uint64 ts);

    // yield
    static void yield();

    // static attribute running thread
    static TCB *running;
private:
    TCB();
    TCB(Body body, uint64 timeSlice, void* args);

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
    void* arguments;
    static uint64 timeSliceCounter;

    static void threadWrapper();
    static void contextSwitch(Context *oldContext, Context *runningContext);
    static void dispatch();
};
#endif //_TCB_HPP_
