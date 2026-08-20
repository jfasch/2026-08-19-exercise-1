#pragma once

#include <exception>

class GluehweinError : public std::exception
{
public:
    const char* what() const noexcept override
    {
        return "jo leck!";
    }
};
