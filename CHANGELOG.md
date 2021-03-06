### Change log
* [中文版](./CHANGELOG_zhCN.md)

## Increase launch stability (2020-05-24)
* Increase launch stability by delaying steering control by 1 second.
    * On launch pad, kos cannot always get the ship's attitude correctly (by using `ship:up` or `lookdirup`). Therefore the initial attitude control can sometimes go crazy. When launch clamp is released and the rocket starts moving, everything will be okay.
* Modify the default roll angle to 90 degree instead of launch azimuth. The roll angle is relative to heading (launch zaimuth), so it should be kept to 90 degree.

## New feature added: Auto time warp to launch time (2020-05-22)
Please refer to [Reference](./docs/reference.md#auto-time-warp) for more detail.

## Small bugfix regarding getting vertical ascent time (2020-05-16)
Small bugfix regarding getting vertical ascent time. When `verticalAscentSpeed` is set, the script could not get the exact boost pitch time correctly.

## Revise action group handler in sequence (2020-05-15)
* Revised action group handler in sequence control, currently only support `action group 1` to `action group 10` (a.k.a. the standard action group). If you have plugins line `action group extended` installed, the remaining action groups cannot be triggered.
    * Known issue: The current implementation of action group handler **DOES NOT** handle mass lost for this action. This means, if you jettison something in an action group, the mass of that object will not be subtracted from your vessel. Hence, it's better to use this action **before** UPFG activation. The handle of mass lost will be added later.

## Add field verticalAscentSpeed in control (2020-05-14)
* A new field `verticalAscentSpeed` is added to configure your vehicle. You can choose to let your vehicle start boost pitch at given time, or at given vertical speed.

* In sequence, a new event type `actiongroup` is added. So now you can control custom action group in a time-based sequence. This is useful for ejecting launch tower in crewed missions.

## Add absolute path in pegas.ks (2020-05-13)
* In pegas.ks, I am using absolute path start from the root of this repo. This is convenient for using this repo as a submodule in the script archive.

* To give a better launch performance, just like Mechjeb PVG, if the initial roll angle is not given, then the initial roll angle will be the launch azimuth.

## Below are changes made by original author of this project

## [v1.1](https://github.com/Noiredd/PEGAS/releases/tag/v1.1) (2017-11-05)
Multiple fixes for bugs identified after the initial release and new features requested since.

##### Features:
* inter-CPU communication system by [Patrykz94](https://github.com/Patrykz94),
* roll control via user events,
* better throttle control via user events,
* new user event type (`jettison`) to account for the amount of jettisoned mass,
* stages can explicitly shut down engines (useful for Falcon 9 style missions),
* LAN and inclination as optional parameters,
* launch direction (northerly and southerly, as well as "nearest opportunity"),
* automatic seizing control from the kOS CPU part.

##### Bug fixes:
* throttling obeys the way [Realism Overhaul works](https://github.com/Noiredd/PEGAS/issues/12),
* sustainer-type stages are now handled properly,
* minor code clean-ups, GUI and documentation fixes.

## [v1.0](https://github.com/Noiredd/PEGAS/releases/tag/v1.0) (2017-07-30)

Initial release of PEGAS in its current form (all old code has been removed), introducing the Unified Powered Flight Guidance (UPFG) algorithm.

##### Features:
* precise orbital guidance, allowing targeting both inclination and longitude of ascending node + periapsis and apoapsis,
* launches to reference plane (by selecting target in the in-game map),
* simple atmospheric ascent in 3 steps: vertical ascent for a given time, pitch-over by a given angle, hold prograde,
* automatic lift-off time and (optionally) launch azimuth calculation,
* flexible automatic staging allowing for separation-ullage burn-ignition sequences, with support for both SRB and RCS-based ullage (as well as none at all),
* basic user events system (for jettisoning of spent strap-on boosters, fairings etc.).
