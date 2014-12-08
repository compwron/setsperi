[![Twitter: @compiledwrong](https://img.shields.io/badge/contact-@compiledwrong-blue.svg?style=flat)](https://twitter.com/compiledwrong)
[![Code Climate](https://codeclimate.com/github/compwron/setsperi/badges/gpa.svg)](https://codeclimate.com/github/compwron/setsperi)
[![Test Coverage](https://codeclimate.com/github/compwron/setsperi/badges/coverage.svg)](https://codeclimate.com/github/compwron/setsperi)
[![Build Status](https://travis-ci.org/compwron/setsperi.svg)](https://travis-ci.org/compwron/setsperi)
[![Dependency Status](https://gemnasium.com/compwron/setsperi.png)](https://gemnasium.com/compwron/setsperi)



Status:
====
Playable from the commandline, but it's not pretty. Starting a new direction in development under https://github.com/compwron/setalyze

Goal:
====

* Write Set as a commandline (or possibly server / api) game, for fun and just because
* Use ruby and possibly rails, for practice with the ecosystem tooling. 
* Make it a gem, because why the heck not

Disclaimers:
====

* My commit style on this project is very fragmented because I steal ten minutes here and there (at lunch, on a plane, in the morning before work) to write a test and make it pass (or not) ... on a production / team project, I would break fewer things and make more cohesive (and better-described) commits. 
* It has become apparent that this is the wrong object model and I'm keeping going basically just so I can experiment with in-place refactoring in ruby later.

Ideas / Inspiration:
====

* http://www.setgame.com/set/daily_puzzle
* http://smart-games.org/en/set/start/
* http://multiplayerset.com/
* http://tao-game.dimension17.com/
* http://www.math.rutgers.edu/~maclagan/papers/set.pdf


Play:
====
```
 ./bin/play                                                                                                                                     
Turn: 1
 Spread: 
2SStP 2DSoG 3OSoG 1SOpR
3DSoR 1OOpR 3SStR 1OStG
1SSoR 1DStG 2DSoP 1OStP
Your guess: 
3OSoG 1SSoR 2DSoP
1 turns played, 1 correct sets
Turn: 2
 Spread: 
2SStP 2DSoG 3OSoG 1SOpR
3DSoR 1OOpR 3SStR 1OStG
1SSoR 1DStG 2DSoP 1OStP
Your guess: 
done
```

To cheat:
```
 ./bin/solve "2SStP 2DSoG 3OSoG 1SOpR 
3DSoR 1OOpR 3SStR 1OStG               
1SSoR 1DStG 2DSoP 1OStP"              

3OSoG 1SSoR 2DSoP                      
```


Development:
====
```
rubocop -a
rspec
```