#ifndef _SCB_HPP_
#define _SCB_HPP_

#include "list.hpp"
#include "tcb.hpp"

class SCB
{
    ~SCB(){ close(); }
    int signal();
    int wait();
    int close();

    SCB(int initValue);
private:
    int semValue;
    bool open;
    List<TCB> threads;
};

#endif // _SCB_HPP_