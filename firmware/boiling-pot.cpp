#include <boiling-pot.h>
#include <sensor-random.h>
#include <switch.h>

#include <iostream>
#include <memory>


using namespace std;

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
    auto unique_ptr<Switch> switcH = make_unique<StdOutSwitch>();

    BoilingPot pot(&sensor, switcH.get());

    pot.heat(37.5);

    while (true) {
        sleep(1);
        pot.check();
    }
}
