#ifndef _SCB_HPP_
#define _SCB_HPP_

#include "list.hpp"
#include "tcb.hpp"
#include "syscall_c.hpp"

class SCB
{
public:
    SCB(sem_t* handle, uint val);
    ~SCB(){ close(); }

    int signal();
    int wait();
    int tryWait();
    int close();

    void releaseAllThreads();

private:
    int semValue;
    bool open;
    List<TCB> threads;
};

#endif // _SCB_HPP_