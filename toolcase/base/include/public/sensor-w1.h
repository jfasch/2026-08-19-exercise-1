#pragma once

#include "sensor.h"

#include <string>
#include <cassert>
#include <fcntl.h>
#include <unistd.h>


class W1Sensor : public Sensor
{
public:
    W1Sensor(std::string filename)
    {
        _filename = filename;
    }

    double get_temperature();

private:
    std::string _filename;
};



