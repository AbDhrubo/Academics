#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>

using namespace std;

#include "scheduler.h"
#include "server.h"

int main()
{
    srand(static_cast<unsigned int>(time(0)));
    Scheduler *sch = new Scheduler();
    sch->initialize();

    Server *s = new Server();
    s->createTraceFile();

    s->arrivalMean() = 50.0;
    s->departureMean() = 10.0;
    s->initialize();
    sch->run();
    s->report();
    return 0;
}
