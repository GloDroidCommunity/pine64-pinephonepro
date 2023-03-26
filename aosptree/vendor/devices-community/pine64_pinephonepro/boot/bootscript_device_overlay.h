#pragma once

#include "bootscript.h"

/* GPIOs: don't ask, just do :)
 * GPIO4 D2 - Red LED
 * Set: $ gpio set E26
 * GPIO4 D5 - Green LED
 * Set: $ gpio set E29
 * GPIO4 D6 - Blue LED
 * Set: $ gpio set E30
 */

/* Set blue LED when in fastboot mode */
#define PRE_ENTER_FASTBOOT() \
 gpio reset E29; gpio set E30; \
