let input = getInput("""
  1 1 1 1 0 0 0 -4 -1 0 -3 -4 0 -9 -3 2 -14 0 -17 -12 -15 -7 0 -7 -12 -3 -17
  -11 -24 -10 -16 -15 -28 -13 -28 -15 -28 -29 -20 0 -10 -30 -13 -24 -34 -42 -25
  -36 -38 -35 -23 -11 -4 -16 -15 -10 -31 0 -16 -21 -50 -26 -31 -36 -53 -54 -12
  -28 1 -16 -65 -69 -4 -47 1 -42 -33 -55 -72 -29 -2 -62 -40 -28 0 -42 -78 2 -23
  -86 -75 -17 -15 -9 0 -24 -36 -91 -64 -65 -98 -30 -21 -80 0 -88 -105 -103 -32
  -54 -62 -105 -68 -101 -73 -26 -112 -96 -66 -115 -53 -69 -99 -84 -46 -105 -16
  -18 -104 -19 -16 -9 -45 -40 -40 -11 -105 -105 -72 -89 -3 -119 -74 -124 -111
  -128 -79 -145 -138 -147 -92 -44 -115 -51 -139 -15 -72 -116 -149 -38 -55 -63
  -62 -3 -48 -115 -33 -56 -51 -28 -8 -15 -162 -7 -24 -72 -104 -7 -23 -16 -25
  -169 -157 -53 -123 -183 -127 -98 -133 -180 -96 -56 -57 -123 -123 0 -35 -174
  -91 -167 -121 -67 -47 -201 0 -111 -158 -36 -62 -111 -114 -183 -139 -108 -74
  -154 -12 -18 -182 -217 -199 -68 -212 -183 -126 -56 -112 -211 -203 -223 -40 0
  -225 -101 -24 -91 -94 -80 -190 -6 -234 -2 -222 -208 -46 -163 -136 -45 -17
  -141 -18 -67 -224 -39 -135 -91 -91 -146 -158 -70 -33 -232 -54 -45 -80 -124
  -221 -130 -236 -112 -238 -11 -34 -110 -198 -15 -252 -230 -118 -230 -193 -119
  -162 -214 -206 -158 -199 -141 -167 -9 -140 -185 -126 -106 -293 -142 -290 -78
  -137 -274 -186 -88 -167 -287 -218 -300 -5 -81 -108 -287 -276 -235 -189 -116
  -16 -232 -32 -189 -78 -8 -72 -219 -12 -63 -7 -114 -170 -125 -162 -19 -140
  -152 -3 -127 -314 -158 -301 -153 -62 -7 -94 -182 -61 -6 -285 -260 -123 -298
  -131 -66 -155 -347 -181 -71 -143 -232 -146 -100 0 -101 -315 -53 -348 -209
  -320 -212 -358 -108 -101 -188 -218 -309 -290 -245 -253 -111 -188 -104 -296
  -14 -306 -335 -87 -284 -14 -117 -143 -386 -367 -292 -251 -289 -340 -41 -85
  -52 -236 -265 -265 -341 -395 -110 -311 -391 -79 -262 -214 -395 -205 -50 -318
  -198 -199 -44 -153 -403 -261 -290 -55 -321 -407 -17 -30 -342 -321 -37 -197 -5
  -305 -394 -373 -297 -40 -114 -240 -218 -164 -334 -337 -38 -124 -362 -209 -79
  -208 -277 -341 -345 -112 -137 -306 -90 -10 -50 -447 -445 -50 -327 -374 -441
  -197 -231 -31 -361 -444 -109 -294 -452 -327 -411 -137 -326 -201 -217 -277
  -245 -263 -111 -286 -265 -298 -107 -204 -395 -299 -175 -158 -94 -34 2 -55
  -113 -278 -74 -380 -167 -429 -261 -57 -95 -215 -392 -121 -460 -250 -393 -41
  -183 -123 -367 -387 -66 -431 -399 -295 -449 -10 -461 -392 -277 -302 -460 -197
  -307 -229 -296 -415 -313 -334 -172 -303 -439 -479 -364 -156 -287 -315 -265
  -153 -134 -238 -88 1 -306 -399 -197 -363 -156 -370 -313 -365 -510 -91 -464
  -177 -550 -95 -49 -108 -24 -289 -229 -547 0 -538 -164 -202 -190 -92 -302 -416
  -42 -148 -192 -246 -118 -144 -264 -497 -276 -350 -318 -219 -301 -398 -12 -292
  -395 -565 -102 -118 -424 -3 -473 -94 -413 -145 -38 -97 -485 -363 -309 -250
  -506 -345 -346 -447 -319 -330 -198 -255 -353 -260 -370 -22 -91 -345 -333 -315
  -593 -450 -37 -380 -543 -5 -556 -164 -135 -513 -56 -166 -474 -14 -84 -561
  -596 -454 -429 -457 -69 -59 -597 -598 -391 -260 -596 -384 -267 -34 -158 -531
  -243 -495 -165 -190 -466 -574 -344 -365 -277 -329 -64 -616 -123 -551 -537
  -412 -333 -589 -212 -376 -290 -366 -363 -477 -39 -37 -495 -317 -554 -675 -442
  -427 -407 -515 -169 -113 -395 -561 -358 -214 -20 -424 -74 -311 -110 -353 -112
  -217 -181 -496 -336 -311 -585 -407 -383 -663 -266 -591 -235 -266 -406 -347
  -268 -281 -449 -569 -8 -178 -62 -139 -89 -72 -487 -352 -164 -244 -640 -139
  -639 -330 -348 -390 -260 -632 -171 -343 -700 -21 -653 -250 -20 -587 -357 -151
  -536 -287 -614 -582 -564 -136 -613 -130 -717 -54 -35 -205 -49 -711 -538 -342
  -222 -579 -300 -641 -240 -198 -76 -550 -73 -528 -465 -485 -327 -433 -325 -441
  -575 -661 -126 -588 -315 -651 -692 -189 -656 -533 -627 -459 -244 -737 -422
  -647 -324 -759 -592 -305 -281 -360 -79 -271 -52 -129 -416 -39 -497 -147 -755
  -398 -382 -217 -301 -581 -345 -310 -68 -90 -128 -303 -416 -348 -745 -204 -795
  -482 -537 -315 -662 -432 -464 -239 -19 -216 -230 -240 -612 -129 -655 -197
  -369 -89 -573 -180 -229 -264 -268 -401 -820 -412 -99 -666 -360 -814 -348 -755
  -772 -296 -851 -818 -394 -161 -77 -109 -362 -273 -688 -574 -50 -137 -550 -380
  -462 -851 -611 -237 -853 -11 -383 -767 -349 -170 -389 -747 -247 -462 -839 -87
  -852 -672 -796 -839 -788 -78 -151 -507 -414 -363 -750 -521 -468 -418 -251
  -803 -802 -269 -766 -520 -301 -156 -488 -130 -100 -191 -45 -352 -774 -506
  -306 -517 -220 -62 -523 -111 -157 -516 -541 -888 -514 -223 -902 -159 -255
  -699 -901 -893 -273 -602 -850 -382 -207 -528 -566 -834 -695 -25 -166 -650
  -569 -667 -771 -809 -922 -858 -53 -703 -552 -584 -190 -193 -146 -218 -503
  -252 -432 -93 -180 -277 -250 -610 -194 -415 -67 -793 -413 -930 -785 -890 -417
  -501 -109 -839 -916 -860 -467 -741 -645 -795 -769 -665 -974 -318 -334 -963
  -674 -432 -402 -702 -724 -524 -753 -146 -719 -953
  """)

var instructions = String(input.map { $0 == "\n" ? " " : $0 })
  .split(separator: " ")
  .map { Int($0)! }

var index = 0, counter = 0
while index >= 0 && index < instructions.count {
  let instruction = instructions[index]
  instructions[index] += 1
  index += instruction
  counter += 1
}

print(counter)
