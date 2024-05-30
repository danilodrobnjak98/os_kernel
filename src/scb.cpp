#include "../h/scb.hpp"

void BlockedThreads::BLOCK()
{
    TCB::running->setFinished(true);
    push(TCB::running);
    thread_dispatch();
}

int BlockedThreads::GET_SIZE()
{
    return cnt;
}

void BlockedThreads::UNBLOCK()
{
    TCB *t = pop();
    if(t != nullptr)
    {
        t->setFinished(false);
        Scheduler::put(t);
    }
}

void BlockedThreads::DELETE_ALL_THREADS()
{
    TCB* thr = pop();
    while(thr!= nullptr)
    {
        thr->setFinished(false);
        Scheduler::put(thr);
        thr = pop();
    }
}

void BlockedThreads::push(TCB* tcb)
{
    blockedThreads.addLast(tcb);
    cnt++;
}

TCB* BlockedThreads::pop()
{
    cnt--;
    return blockedThreads.removeFirst();
}

int SCB::GetSemValue() const
{
    return semValue;
}

bool SCB::CheckIsSemOpen() const
{
    return state == SEM_STATE_OPEN;
}

SCB::SCB(sem_t* sem, uint val)
    :
    semValue(val),
    state(SEM_STATE::SEM_STATE_OPEN)
{
    *sem = this;
}

int SCB::signal()
{
    if(!CheckIsSemOpen()) return -1;
    semValue += 1;
    if(GetSemValue()<=0)
    {
        blockedThreads.UNBLOCK();
    }
    return 0;
}

int SCB::wait()
{
    if(!CheckIsSemOpen()) return -1;
    semValue -= 1;
    if (GetSemValue()<0)
    {
        blockedThreads.BLOCK();
    }
    return 0;
}

int SCB::tryWait()
{
    if(!CheckIsSemOpen()) return -1;
    semValue -= 1;
    return GetSemValue() < 0 ? 0 : 1;
}

int SCB::close()
{
    semValue = 0;
    state = SEM_STATE::SEM_STATE_CLOSED;
    blockedThreads.DELETE_ALL_THREADS();
    return GetSemValue();
}

int SCB::signal_all()
{
    if(!CheckIsSemOpen()) return -1;
    while(blockedThreads.GET_SIZE() > 0)
    {
        signal();
    }
}