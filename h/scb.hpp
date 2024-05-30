#ifndef _SCB_HPP_
#define _SCB_HPP_

#include "list.hpp"
#include "tcb.hpp"
#include "syscall_c.hpp"

enum SEM_STATE
{
    SEM_STATE_OPEN = 0,
    SEM_STATE_CLOSED = 1
};

class BlockedThreads
{
public:
    void BLOCK();
    void UNBLOCK();
    void DELETE_ALL_THREADS();
    int GET_SIZE();
private:
    void push(TCB* tcb);
    TCB* pop();
    List<TCB> blockedThreads;
    int cnt;
};

class SCB
{
public:
    SCB(sem_t* handle, uint val);
    ~SCB(){ close(); }

    int signal();
    int wait();
    int tryWait();
    int close();
    int signal_all();

private:
    int GetSemValue() const;
    bool CheckIsSemOpen() const;

    int semValue;
    SEM_STATE state;
    BlockedThreads blockedThreads;
};

#endif // _SCB_HPP_