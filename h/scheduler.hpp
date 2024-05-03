#ifndef _SCHEDULER_HPP_
#define _SCHEDULER_HPP_

#include "list.hpp"

class TCB;

class Scheduler
{
private:
    static List<TCB> readyThreadQueue;

public:
    static TCB *get();

    static void put(TCB *tcb);

};

#endif //_SCHEDULER_HPP_
