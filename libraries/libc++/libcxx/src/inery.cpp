#pragma once

/**
 * Define specific things for the inery system
 */

extern "C" {
   void inery_assert(unsigned int, const char*);
   void __cxa_pure_virtual() { inery_assert(false, "pure virtual method called"); }
}
