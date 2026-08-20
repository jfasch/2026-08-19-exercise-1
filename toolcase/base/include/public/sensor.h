#pragma once

#include <error.h>

class Sensor
{
public:
    virtual ~Sensor() {}
    virtual double get_temperature() = 0;
};
