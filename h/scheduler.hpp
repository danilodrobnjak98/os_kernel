#ifndef _SCHEDULER_HPP_
#define _SCHEDULER_HPP_

#include "list.hpp"

class CCB;

class Scheduler
{
private:
    static List<CCB> readyCoroutineQueue;

public:
    static CCB *get();

    static void put(CCB *ccb);

};

#endif //_SCHEDULER_HPP_
