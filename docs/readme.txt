The key codes can be found here:
https://developer.android.com/reference/android/view/KeyEvent
https://www.temblast.com/ref/akeyscode.htm (backup saved as AndroidKeycodes.mhtml)

Note: Back button needs to use X rather than Escape because X works as backspace on text input while Escape does not.

Currently, we're using these:

Default layout:
    "aKeyCode": 47,  // S item
    "bKeyCode": 48,  // T turbo
    "cKeyCode": 54,  // Z run
    "xKeyCode": 29,  // A mega
    "yKeyCode": 32,  // D quick save
    "zKeyCode": 142, // F12 reset
    "lKeyCode": 52,  // X back
    "rKeyCode": 31,  // C action
    "clKeyCode": 45, // Q previous page
    "crKeyCode": 51, // W next page

Alternate layout:
    "aKeyCode1": 36,  // H run on hold
    "bKeyCode1": 40,  // L turbo on hold
    "cKeyCode1": 41,  // M mute
    "xKeyCode1": 133, // F3 screenshot
    "yKeyCode1": 138, // F8 <function>
    "zKeyCode1": 141, // F11 view controls
    "lKeyCode1": 52,  // X back (same)
    "rKeyCode1": 31,  // C action (same)
    "clKeyCode1": 45, // Q previous page (same)
    "crKeyCode1": 51, // W next page (same)

The layout of the buttons is like this:

lKeyCode                                 rKeyCode
        clKeyCode               crKeyCode
                              aKeyCode  xKeyCode
      DPAD                   bKeyCode    yKeyCode
                              cKeyCode  zKeyCode

RPG Maker Plugin 1.20.50+ also supports controllerKeyMap.
However, currently only the A, B, X, Y, L and R buttons seem to work, at least with my Dual Sense.
I did add mappings for the other keys as it might work better with other controllers, but this is experimental at best.

With RPG Maker Plugin 1.21.10 all buttons seem to work fine with my Dual Sense.
However when my phone asks whether to allow access to DualSense (see dialogue.png) I have to choose Cancel.
If I choose OK the mapping is different and several buttons do nothing at all.

    "controllerKeyMap": [
        {
            "key": 96,   // Cross / A
            "value": 31  // C action
        },
        {
            "key": 97,   // Circle / B
            "value": 52  // X back
        },
        {
            "key": 99,   // Square / X
            "value": 47  // S item
        },
        {
            "key": 100,  // Triangle / Y
            "value": 29  // A mega
        },
        {
            "key": 102,  // L1
            "value": 45  // Q previous page
        },
        {
            "key": 103,  // R1
            "value": 51  // W next page
        },
        {
            "key": 104,  // L2
            "value": 40  // L turbo on hold
        },
        {
            "key": 105,  // R2
            "value": 36  // H run on hold
        },
        {
            "key": 106,  // Left Stick
            "value": 41  // M mute
        },
        {
            "key": 107,  // Right Stick
            "value": 32  // D quick save
        },
        {
            "key": 108,  // Start
            "value": 54  // Z run
        },
        {
            "key": 109,  // Select (Back?)
            "value": 48  // T turbo
        },
        {
            "key": 110,  // Mode (Guide?)
            "value": 142 // F12 reset
        }
    ]
