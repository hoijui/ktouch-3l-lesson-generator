<!--
SPDX-FileCopyrightText: 2021 Robin Vobruba <hoijui.quaero@gmail.com>

SPDX-License-Identifier: MIT
-->

# KTouch 3l course/lessons generator

[![License: MIT](
https://img.shields.io/badge/License-MIT-blue.svg)](
https://choosealicense.com/licenses/mit/)
[![REUSE status](
https://api.reuse.software/badge/github.com/hoijui/ktouch-3l-lesson-generator)](
https://api.reuse.software/info/github.com/hoijui/ktouch-3l-lesson-generator)

This generates a course for learning to type on the 3l (Three-Layout) keyboard layout
for the KTouch software,
using the ktouch-lesson-generator.

* [3l](https://github.com/jackrosenthal/threelayout) -
  a (niche) keyboard layout,
  tailored for programming in english,
  minimizing the overall keys required for all the most common symbols,
  and trying to improve typing comfort (and speed);
  it originates from the [Neo](https://neo-layout.org) community.
* [KTouch](https://apps.kde.org/ktouch/) -
  a KDE (Linux) based keyboard-typing learning software
* [ktouch-lesson-generator](https://github.com/simgunz/ktouch-lesson-generator) -
  auto-generates KTouch course/lessons files

## How to use

run:

```
./generate.bash
```

This generates the file _ktouch-lessons-3l.xml_,
which you can import into KTouch.
