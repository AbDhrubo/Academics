#include <iostream>
#include <fstream>
using namespace std;

#include "scheduler.h"
#include "server.h"

int main()
{
    Scheduler *sch = new Scheduler();
    sch->initialize();

    Server *s = new Server();
    s->createTraceFile();

    s->arrivalMean() = 2.0;
    s->departureMean() = 20.0;
    s->initialize();
    sch->run();
    s->report();
    return 0;
}
