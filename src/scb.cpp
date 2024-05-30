#include "../h/scb.hpp"

SCB::SCB(sem_t* sem, uint val)
{
    semValue = val;
    *sem = this;
    open = true;
}

void SCB::releaseAllThreads()
{
    TCB* thr = threads.removeFirst();
    while(thr!= nullptr)
    {
        thr->setFinished(false);
        Scheduler::put(thr);
        thr = threads.removeFirst();
    }
}

int SCB::signal()
{
    if(!open) return -1;
    ++semValue;
    if(semValue<=0) {
        TCB *t = threads.removeFirst();
        if(t != nullptr) {
            t->setFinished(false);
            Scheduler::put(t);
        }
    }
    return 0;
}

int SCB::wait()
{
    if(!open) return -1;
    --semValue;
    if (semValue<0) {
        TCB::running->setFinished(true);
        threads.addLast(TCB::running);
        thread_dispatch();
    }
    return 0;
}

int SCB::tryWait()
{
    if(!open) return -1;
    --semValue;
    if(semValue < 0)
    {
        return 0;
    }
    else
        return 1;
}

int SCB::close()
{
    open = false;
    semValue = 0;
    releaseAllThreads();
    return semValue;
}