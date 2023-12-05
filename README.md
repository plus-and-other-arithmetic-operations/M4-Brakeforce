# M4-Brakeforce

Pro-bono project made for crash's personal M4 project.

## Setup

Setup the emissives accordingly:

```ini
[EMISSIVE_EXTRA_E_...]
NAME = EXT_TAILLIGHT_INDICATOR_BFD
COLOR= 50, 20, 0, 3
TOGGLE_VISIBILITY = 1
LOCATION = REAR

[EMISSIVE_EXTRA_F_...]
NAME = EXT_MIDDLEBRAKE_REFLECTOR_BFD
COLOR= 20,2,0, 500
TOGGLE_VISIBILITY = 1
LOCATION = REAR
```

Add the script entry into the car's ext_config:

```ini
[SCRIPT_...]
SCRIPT = 'brakelights.lua'
```
