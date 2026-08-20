#include <sensor-const.h>
#include <sensor-random.h>
#include <sensor-w1.h>
// #include <sink-terminal.h>
#include <sink-sqlite3.h>
#include <data-logger.h>

#include <map>
#include <iostream>
#include <unistd.h>


int main(int argc, char** argv)
{
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <SQLITE3-DB>" << std::endl;
        std::cerr << "  (Create: \"" << SinkSQLite3::create_table_statement << "\")" << std::endl;
        return 1;
    }
        
    ConstantSensor bottom_left(37.5);
    ConstantSensor bottom_right(-273.15);
    RandomSensor top_left(0, 666);
    RandomSensor top_right(-273.15, 0);
//    W1Sensor something_different("/nothing/there");

    SensorConfig config;
    config.addSensor("bl", &bottom_left);
    config.addSensor("br", &bottom_right);
    config.addSensor("tl", &top_left);
    config.addSensor("tr", &top_right);
//    config.addSensor("something-different", &something_different);
    
//    SinkTerminal sink;
    SinkSQLite3 sink(argv[1]);
    DataLogger logger(&config, &sink, 1000/*ms*/);
    logger.startLogging();

    return 0;
}
