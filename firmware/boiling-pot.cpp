#include <boiling-pot.h>
#include <sensor-random.h>
#include <switch.h>

#include <iostream>
#include <memory>
#include <chrono>
#include <thread>


using namespace std;
using namespace std::chrono_literals;

class StdOutSwitch : public Switch
{
public:
    void set_state(bool state) override
    {
        cout << (state? "ON" : "OFF") << '\n';
    }
};

int main(int argc, char** argv)
{
    RandomSensor sensor(0, 100);
    auto switcH = make_unique<StdOutSwitch>();

    BoilingPot pot(&sensor, switcH.get());

    pot.heat(37.5);

    while (true) {
        std::this_thread::sleep_for(1s);
        pot.check();
    }
}
