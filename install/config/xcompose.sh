# Set default XCompose that is triggered with CapsLock
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/omarchy/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$OMARCHY_USER_NAME"
<Multi_key> <space> <e> : "$OMARCHY_USER_EMAIL"

### SPECIAL CHARACTERS ###
# These are just the special characters I see an obvious use for.
# The full list of built-in Compose characters is at /usr/share/X11/locale/en_US.UTF-8/Compose

# Currency
<Multi_key> <c> <slash>	: "¢" cent
<Multi_key> <y> <equal>	: "¥" yen
<Multi_key> <e> <equal>	: "€" EuroSign # euros
<Multi_key> <l> <equal>	: "£" sterling # british pound

# Legal
<Multi_key> <t> <m>	: "™" U2122 # trademark
<Multi_key> <o> <r>	: "®" registered
<Multi_key> <o> <c>	: "©" copyright

# Fractions
<Multi_key> <1> <4>	: "¼"	onequarter # VULGAR FRACTION ONE QUARTER
<Multi_key> <1> <2>	: "½"	onehalf # VULGAR FRACTION ONE HALF
<Multi_key> <3> <4>	: "¾"	threequarters # VULGAR FRACTION THREE QUARTERS
<Multi_key> <1> <7>	: "⅐"	U2150 # VULGAR FRACTION ONE SEVENTH
<Multi_key> <1> <9>	: "⅑"	U2151 # VULGAR FRACTION ONE NINTH
<Multi_key> <1> <1> <0>	: "⅒"	U2152 # VULGAR FRACTION ONE TENTH
<Multi_key> <1> <3>	: "⅓"	U2153 # VULGAR FRACTION ONE THIRD
<Multi_key> <2> <3>	: "⅔"	U2154 # VULGAR FRACTION TWO THIRDS
<Multi_key> <1> <5>	: "⅕"	U2155 # VULGAR FRACTION ONE FIFTH
<Multi_key> <2> <5>	: "⅖"	U2156 # VULGAR FRACTION TWO FIFTHS
<Multi_key> <3> <5>	: "⅗"	U2157 # VULGAR FRACTION THREE FIFTHS
<Multi_key> <4> <5>	: "⅘"	U2158 # VULGAR FRACTION FOUR FIFTHS
<Multi_key> <1> <6>	: "⅙"	U2159 # VULGAR FRACTION ONE SIXTH
<Multi_key> <5> <6>	: "⅚"	U215A # VULGAR FRACTION FIVE SIXTHS
<Multi_key> <1> <8>	: "⅛"	U215B # VULGAR FRACTION ONE EIGHTH
<Multi_key> <3> <8>	: "⅜"	U215C # VULGAR FRACTION THREE EIGHTHS
<Multi_key> <5> <8>	: "⅝"	U215D # VULGAR FRACTION FIVE EIGHTHS
<Multi_key> <7> <8>	: "⅞"	U215E # VULGAR FRACTION SEVEN EIGHTHS
<Multi_key> <0> <3>	: "↉"	U2189 # VULGAR FRACTION ZERO THIRDS

# Superscript/Subscript patterns
# <Multi_key> <asciicircum> <number/equals/plus/minus/parens> => superscript ('asciicircum' is ^)
# <Multi_key> <underscore>  <number/equals/plus/minus/parens> => subscript

# Greek
<Multi_key> <g> <a>     : "α" # alpha
<Multi_key> <g> <b>     : "β" # beta
<Multi_key> <g> <d>     : "δ" # delta
<Multi_key> <g> <e>     : "ε" # epsilon
<Multi_key> <g> <f>     : "φ" # phi
<Multi_key> <g> <g>     : "γ" # gamma
<Multi_key> <g> <h>     : "η" # eta
<Multi_key> <g> <i>     : "ι" # iota
<Multi_key> <g> <j>     : "θ" # theta
<Multi_key> <g> <k>     : "κ" # kappa
<Multi_key> <g> <l>     : "λ" # lamda
<Multi_key> <g> <m>     : "μ" # mu
<Multi_key> <g> <n>     : "ν" # nu
<Multi_key> <g> <o>     : "ο" # omicron
<Multi_key> <g> <p>     : "π" # pi
<Multi_key> <g> <q>     : "χ" # chi
<Multi_key> <g> <r>     : "ρ" # rho
<Multi_key> <g> <s>     : "σ" # sigma
<Multi_key> <g> <t>     : "τ" # tau
<Multi_key> <g> <u>     : "υ" # upsilon
<Multi_key> <g> <w>     : "Ω" # omega
<Multi_key> <g> <x>     : "ξ" # xi
<Multi_key> <g> <y>     : "ψ" # psi
<Multi_key> <g> <z>     : "ζ" # zeta
EOF
