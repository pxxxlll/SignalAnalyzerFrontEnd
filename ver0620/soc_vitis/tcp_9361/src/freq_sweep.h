#ifndef FREQ_SWEEP_H
#define FREQ_SWEEP_H

#include <stdint.h>
#include "ad9361_api.h"




extern struct ad9361_rf_phy *ad9361_phy;
extern uint64_t sweep_freq;

#define FREQ_START 3000000000UL
#define FREQ_END 3100000000UL
#define FREQ_STEP  10000000UL
#define DWELL_TIME_US 100000

#endif
