gluehwein_add_library(
  NAME gluehwein-base
  VERBOSE
  PUBLIC_HEADERS 

    hysteresis.h
    pwm_controller.h
    sensor.h
    sensor-avg.h
    sensor-const.h
    sensor-mock.h
    sensor-random.h
    sensor-w1.h
    switch.h
    switch-mock.h
    sysfs-switch.h

  PRIVATE_HEADERS

    file-util.h

  SOURCES

    hysteresis.cpp
    pwm_controller.cpp
    sensor-avg.cpp
    sensor-const.cpp
    sensor-mock.cpp
    sensor-random.cpp
    sensor-w1.cpp
    switch-mock.cpp
    sysfs-switch.cpp
    file-util.cpp

  DEPENDENCIES

    gluehwein-errors
  )

