# M4-Brakeforce

Pro-bono project made for crash's personal M4 project.

## Brakeforce system breakdown

https://github.com/plus-and-other-arithmetic-operations/M4-Brakeforce/assets/88043761/edc166cb-8ad8-4479-9ca3-f034fe961c37

The Brakeforce Display is a safety feature in some BMW models that enhances braking visibility to following traffic during hard braking. Here's a typical behavior description:

### Center Brake Light Flashing:

> During hard braking, the center high-mounted brake light (often located at the top center of the rear window) may flash rapidly. This is an attention-grabbing feature intended to alert drivers behind you to your sudden deceleration.


### Outer Blinkers as Additional Brake Lights:

> In some cases, the outer blinkers (turn signals) on either side of the vehicle may also illuminate steadily or flash simultaneously with the center brake light. This provides an extra visual cue to other drivers that you are braking hard.


These features are designed to improve overall visibility and awareness of your braking actions, especially during emergency braking situations.

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
