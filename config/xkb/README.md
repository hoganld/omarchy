# XKB configuration

XKB is what you use to customize the behavior of your keyboard. Remapping keys, custom modifiers, entirely custom layouts. The "X" comes from X11, as do the keycodes, but despite the history, XKB is used by modern Wayland compositors, such as Hyprland.

XKB is hard to learn —- you have to read a significant chunk of the Internet (and no, AI summaries were not helpful) -- but easy to use when you finally find the right information.

The best explanation of XKB itself is here:

https://who-t.blogspot.com/2020/02/user-specific-xkb-configuration-part-1.html

An article that is helpful, although not as comprehensive as it claims to be:

https://medium.com/@damko/a-simple-humble-but-comprehensive-guide-to-xkb-for-linux-6f1ad5e13450

And for Emacs-specific pointers, specifically on the Meta/Alt issue:

https://emacsnotes.wordpress.com/2022/10/30/use-xkb-to-setup-full-spectrum-of-modifiers-meta-alt-super-and-hyper-for-use-with-emacs/

## XKB Files

XKB files live in two places: system files live under `/usr/share/xkeyboard-config-2` and symlinked to `/usr/share/X11/xkb` (on Arch); user files live under `$HOME/.config/xkb`.

User files take priority over system files, and can import and extend system files. So you can create your own custom layouts by only writing the custom bits you need, and splicing them in with system files. Do not modify the system files, else you may lose your customizations after system updates. But the system files are very useful as a reference, as long as you know what each set of files do.

The XKB directories are:
- compat
- geometry
- keycodes
- rules
- symbols
- types

### compat

I believe these files are for maintaining backwards- and cross- compatability with older and other keyboard configuration systems. Maybe for compatability with obscure hardware? What I know for sure is that almost certainly all you will need to do is to include the `complete` compat file in your layout.

### geometry

These files enable XKB to draw a pretty picture of your keyboard layout, if your keyboard model is specified, which it will not be. You can safely ignore these files.

### keycodes

These files map the scancodes reported by the kernel into XKB keycodes. Probably you will not need a custom keycode file. But unlike `compat` and `geometry`, it's not out of the question. The `keycodes/evdev` file is the primary mapping that you might want to study. The `keycodes/aliases` file is also useful, because it is included in most standard layouts, certainly in the standard US layout.

### rules

These files are the key to creating customizations that can actually be used. In particular, the `rules/evdev` file is critical. Apparently this file is the default for XKB, and possibly still hard-coded as such. So you will create your own `rules/evdev` file, declaring your custom layouts and options, and then include the final line: `! include %S/evdev`, which will pull in everything from the system `rules/evdev` file. (Anything you have customized will take precedence, because XKB will favor the first declaration it sees.)

The `rules` file format is strange, but easy enough to pick up. Stare at it a while until you reach enlightenment.

### symbols

This is where you will actually implement most of your customizations, especially if you are just remapping keys and modifiers. The declarations in these files can be used either as "layouts" or "options" in your rules file. The file name is important -- you will refer to your symbols by /filename/ in your rules file.

To learn the format, the best system files to study are probably `symbols/us`, `symbols/pc`, and `symbols/inet`.

### types

A "type" describes the behavior of a key. For example, alphanumeric types send the lowercase letter by default, and then when shifted send the corresponding uppercase ("level two"). But the numeric keys print a totally different character when shifted. Other keys are modifiers. Some keys have third levels, or even more. (So you can print accented versions, umlat'd characters, etc.) /Probably/ you will not need to customize these files. Probably you will just use `types/complete`, either explicitly or implicitly.


## Modifiers

X has 8 modifiers:

- Shift
- Lock
- Control
- Mod1
- Mod2
- Mod3
- Mod4
- Mod5

Shift and Control recongizable to anybody who has ever used a keyboard. Lock is, you guessed it, Caps Lock. The other modifiers can be remapped as you will. By default:

Mod1 = Alt, Meta
Mod2 = Num Lock
Mod3 = Level-5 Shift
Mod4 = Super
Mod5 = Level-3 Shift

This causes all kinds of problems for someone such as yourself, who has no use for Level 5, probably not much use for Level 3, but wants as many usefully-located modifiers available for Emacs, and Hyprland, as possible.

Of the defaults, the one that works out of the box is Mod4 as Super. Don't bother changing this -- it Just Works with Hyprland.

But the remaining modifiers can be customized to free up two additional modifiers: Hyper and Alt.

Keyboards with a proper "Meta" key have long disappeared, so Emacs treats Alt as Meta. But if you *create* dedicated Meta key, you can free up Alt as another modifier, which means another namespace for keybindings.

The problem is that if both Alt and Meta are mapped to Mod1, then Emacs thinks they are all the same thing (because they are -- they are just two different aliases for Mod1). To get both Meta and Alt, you must map them to different modifiers. Ideally: Mod1 = Alt; Mod2 = Meta. (Emacs will work if you put Alt on Mod2 and Meta on Mod1, but since Alt as Mod1 is a standard, I prefer to leave that in place in order to not confuse other applications.)

That leaves Mod3 for Hyper.

And you still have an additional free modifier: Mod5. Most people would understandably question why you could possibly need another modifier, but that is because they do not use Emacs. Emacs recognizes Control, Meta, Alt, Super and Hyper. So if you can use Mod5 for your window manager, then you can have the full suite of Emacs modifiers.

But what do you call Mod5? "Mod Five" is lame -- it sounds like something Elon Musk would name his kid -- and there are no other standard Linux modifier names remaining. (Arguably, we are already pushing the limits of "standard" with Meta and Hyper.) So I decided to steal the name "Command" from my Mac keyboard. So Mod5 is called "Command".

In theory it is possible to create a new "virtual modifier" called Command in XKB. But I spent more time than I care to admit in writing trying to get it to work, and failed. But that doesn't actually matter. You can just map F24 (or whatever) to Mod5 and call it "$CMD" in your Hyprland keybindings and "Command" in your documentation and buy keycaps labeled "Command" and nobody will be able to stop you.

So you end up with a modifier map that looks like this:

Mod1 = Alt
Mod2 = Meta
Mod3 = Hyper
Mod4 = Super
Mod5 = Command

These definitions are provided by the custom `symbols/maxmods` file here, and used by the layouts defined in the custom `rules/evdev`.

*Important:* Never, under any circumstances, turn on the xkb option to enable NumLock by default. NumLock is utterly useless, and that option permanently sets the Mod2 bit. This confuses Emacs terribly.
