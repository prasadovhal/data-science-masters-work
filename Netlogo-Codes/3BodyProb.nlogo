turtles-own
[ fx
  fy
  vx
  vy
  xc
  yc
  mass
]

globals
[ center-of-mass-yc
  center-of-mass-xc
  g
]

to setup
  clear-all
  set g gravitational-constant
  set-default-shape turtles "circle"
  if keep-centered?
  [ recenter ]
  reset-ticks
end


to setup-system
  setup
  create-turtles 1
  [ set color yellow
    set mass Sun-mass
    set shape "sun"
    set size sqrt mass
  ]
  create-turtles 1
  [ set color blue
    set mass earth-mass
    set size sqrt mass
    set xc 50
    set yc 0
    setxy xc yc
    set vx earth-velocity-x
    set vy earth-velocity-y
  ]
  create-turtles 1
  [ set color red
    set mass satellite-mass
    set size sqrt mass
    set xc 60
    set yc 10
    setxy xc yc
    set vx satellite-velocity-x
    set vy satellite-velocity-y
  ]
  create-turtles 1
  [ set color blue
    set mass earth-mass
    set size sqrt mass
    set xc 90
    set yc 20
    setxy xc yc
    set vx satellite-velocity-x
    set vy satellite-velocity-y
  ]
end

to go
  ask turtles
  [ set fx 0
    set fy 0
  ]
  ask turtles [ update-force ]
  ask turtles [ update-velocity ]
  ask turtles [ update-position ]
  recenter
  if ticks >= 350 [ stop ]
  tick
end

to update-force
  ask other turtles [ sum-its-force-on-me myself ]
end

to sum-its-force-on-me [it]
  let xd xc - [xc] of it
  let yd yc - [yc] of it
  let d sqrt ((xd * xd) + (yd * yd))
  set fx fx + (cos (atan (- yd) (- xd))) * ([mass] of it * mass) / (d * d)
  set fy fy + (sin (atan (- yd) (- xd))) * ([mass] of it * mass) / (d * d)
end

to update-velocity
  set vx (vx + (fx * g / mass))
  set vy (vy + (fy * g / mass))
end

to update-position
  set xc (xc + vx)
  set yc (yc + vy)
  adjust-position
end

to adjust-position
  ifelse patch-at (xc - xcor) (yc - ycor) != nobody
  [ setxy xc yc
    show-turtle
    if (fade-rate != 100)
    [ set pcolor color + 3 ]
  ]
  [ hide-turtle ]
end

to recenter
  find-center-of-mass
  ask turtles
  [ set xc (xc - center-of-mass-xc)
    set yc (yc - center-of-mass-yc)
    adjust-position
  ]
end

to find-center-of-mass
  if any? turtles
  [ set center-of-mass-xc sum [mass * xc] of turtles / sum [mass] of turtles
    set center-of-mass-yc sum [mass * yc] of turtles / sum [mass] of turtles
  ]
end

to fade
  let new-color pcolor - 8 * fade-rate / 100
  ifelse (shade-of? pcolor new-color)
  [ set pcolor new-color ]
  [ set pcolor black ]
end
@#$#@#$#@
GRAPHICS-WINDOW
587
10
1197
501
-1
-1
2.0
1
10
1
1
1
0
1
1
1
-150
150
-120
120
1
1
1
ticks
30.0

BUTTON
16
44
102
77
Go
go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

BUTTON
16
10
218
43
Setup Planetary system
setup-system
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SWITCH
9
460
181
493
keep-centered?
keep-centered?
0
1
-1000

SLIDER
9
426
181
459
fade-rate
fade-rate
0
100
8.0
0.1
1
%
HORIZONTAL

BUTTON
131
44
217
77
Go Once
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
0

SLIDER
9
152
225
185
gravitational-constant
gravitational-constant
1
30
13.0
1
1
NIL
HORIZONTAL

SLIDER
11
239
183
272
earth-mass
earth-mass
1
20
10.0
1
1
NIL
HORIZONTAL

SLIDER
11
274
193
307
earth-velocity-x
earth-velocity-x
0
10
0.0
1
1
NIL
HORIZONTAL

SLIDER
12
310
184
343
earth-velocity-y
earth-velocity-y
0
10
9.0
1
1
NIL
HORIZONTAL

SLIDER
234
241
406
274
satellite-mass
satellite-mass
1
5
4.0
1
1
NIL
HORIZONTAL

SLIDER
234
277
418
310
satellite-velocity-x
satellite-velocity-x
0
10
0.0
1
1
NIL
HORIZONTAL

SLIDER
234
311
418
344
satellite-velocity-y
satellite-velocity-y
0
10
3.0
1
1
NIL
HORIZONTAL

TEXTBOX
39
220
189
238
Earth Parameters
12
0.0
1

TEXTBOX
255
223
405
241
Satellite Parameters\n
12
0.0
1

TEXTBOX
35
407
185
425
Trajectory path
12
0.0
1

SLIDER
284
151
456
184
Sun-mass
Sun-mass
100
350
200.0
20
1
NIL
HORIZONTAL

TEXTBOX
296
129
421
147
Sun parameters\n
12
0.0
1

@#$#@#$#@
## WHAT IS IT?

This project displays the common natural phenomenon expressed by the inverse-square law.  Essentially this displays what happens when the strength of the force between two objects varies inversely with the square of the distance between these two objects.  In this case, the formula used is the standard formula for the Law of Gravitational Attraction:

> (G * m1 * m2) / r<sup>2</sup>

This particular model demonstrates the effect of gravity upon a system of interdependent particles. You will see each particle in the collection of small masses (each of the n bodies, n being the total number of particles present in the system) exert gravitational pull upon all others, resulting in unpredictable, chaotic behavior.

## HOW TO USE IT


Use Setup planetary System button two set up Sun,earth and satellite . 
and Go button to run the simulation.
User can change Initial velocity , position and mass of earth and satellite for this sliders are provided.
The KEEP-CENTERED? switch controls whether the simulation will re-center itself after each cycle.  When On, the system will shift the positions of the particles so that the center of mass is at the origin (0, 0).
(Note, if KEEP-CENTERED? is On the particles will always move so that the center of mass is at the origin.)

## THINGS TO TRY

The force acting upon each turtle is multiplied by a constant, 'g' (a global variable). In classical Newtonian Mechanics, 'g' is the universal gravitational constant, used in the equation for determining the force of gravitational attraction between any two bodies:

> f = (g * (mass1 * mass2)) / distance<sup>2</sup>

In real life, g is difficult to calculate, but is approximately 6.67e-11 (or 0.0000000000667). However, in this model, the use of g keeps the forces from growing too high, so that you might better view the simulation. g can be changed using slider provided.

## HOW TO CITE

For the model itself:

I have used some methods from 
* Wilensky, U. (1998).  NetLogo N-Bodies model.  
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

sun
false
0
Circle -7500403 true true 75 75 150
Polygon -7500403 true true 300 150 240 120 240 180
Polygon -7500403 true true 150 0 120 60 180 60
Polygon -7500403 true true 150 300 120 240 180 240
Polygon -7500403 true true 0 150 60 120 60 180
Polygon -7500403 true true 60 195 105 240 45 255
Polygon -7500403 true true 60 105 105 60 45 45
Polygon -7500403 true true 195 60 240 105 255 45
Polygon -7500403 true true 240 195 195 240 255 255

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.0.3
@#$#@#$#@
setup-two-planet
repeat 125 [ go ]
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
