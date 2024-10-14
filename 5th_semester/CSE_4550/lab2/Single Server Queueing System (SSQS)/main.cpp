#include <iostream>
#include <fstream>
#include <time.h>
#include <stdlib.h>
using namespace std;

#include "scheduler.h"
#include "server.h"

int main()
{
    srand(time(NULL));
    Scheduler *sch = new Scheduler();
    sch->initialize();

    Server *s = new Server();
    s->createTraceFile();

    s->arrivalMean() = 4.0;
    s->departureMean() = 10.0;
    s->initialize();
    sch->run();
    s->report();
    return 0;
}
