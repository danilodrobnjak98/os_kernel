#include "../h/scb.hpp"
#include "../h/syscall_c.hpp"

SCB::SCB(int initValue)
    :
    semValue(initValue),
    open(true)
{

}

int SCB::signal()
{
    if(!open)
    {
        // vec smo ga ugasili
        return -1;
    }

    semValue += 1;

    if(semValue > 0)
        return 0;

    TCB* t = threads.peekFirst();
    if(t != nullptr)
    {
        t->setFinished(true);
        // presipamo iz reda blokiranih u scheduler
        threads.removeFirst();
        Scheduler::put(t);
    }
    return 0;
}

int SCB::wait()
{
    if(!open)
    {
        // neko nam je zatvorio semafor
        return -1;
    }

    semValue -= 1;

    if(semValue >= 0)
    {
        return 0;
    }
    TCB::running->setFinished(true);
    threads.addLast(TCB::running);
    thread_dispatch();
    return 0;
}

int SCB::close()
{
    open = false;
    semValue = 0;
    return semValue;
    // mozes da izbacis iz thread liste i ubacis u sch ako treba
}