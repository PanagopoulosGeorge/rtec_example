:- dynamic vessel/1, vpair/2.

initiatedAt(withinNaturaOrFishingArea(_108,_110)=true, _200, _78, _206) :-
     happensAtIE(entersArea(_114,_116),_78),_200=<_78,_78<_206,
     areaType(_116,_110),
     vesselType(_114,_108),
     member(_110,[natura,fishing]),
     member(_108,[cargo,tanker]).

initiatedAt(withinArea(_108,_110)=true, _140, _78, _146) :-
     happensAtIE(entersArea(_108,_116),_78),_140=<_78,_78<_146,
     areaType(_116,_110).

initiatedAt(gap(_108)=nearPorts, _148, _78, _154) :-
     happensAtIE(gap_start(_108),_78),_148=<_78,_78<_154,
     holdsAtProcessedSimpleFluent(_108,withinArea(_108,nearPorts)=true,_78).

initiatedAt(gap(_108)=farFromPorts, _152, _78, _158) :-
     happensAtIE(gap_start(_108),_78),_152=<_78,_78<_158,
     \+holdsAtProcessedSimpleFluent(_108,withinArea(_108,nearPorts)=true,_78).

initiatedAt(stopped(_108)=nearPorts, _148, _78, _154) :-
     happensAtIE(stop_start(_108),_78),_148=<_78,_78<_154,
     holdsAtProcessedSimpleFluent(_108,withinArea(_108,nearPorts)=true,_78).

initiatedAt(stopped(_108)=farFromPorts, _152, _78, _158) :-
     happensAtIE(stop_start(_108),_78),_152=<_78,_78<_158,
     \+holdsAtProcessedSimpleFluent(_108,withinArea(_108,nearPorts)=true,_78).

initiatedAt(lowSpeed(_108)=true, _124, _78, _130) :-
     happensAtIE(slow_motion_start(_108),_78),
     _124=<_78,
     _78<_130.

initiatedAt(changingSpeed(_108)=true, _124, _78, _130) :-
     happensAtIE(change_in_speed_start(_108),_78),
     _124=<_78,
     _78<_130.

initiatedAt(highSpeedNearCoast(_108)=true, _184, _78, _190) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_184=<_78,_78<_190,
     thresholds(hcNearCoastMax,_130),
     \+inRange(_114,0,_130),
     holdsAtProcessedSimpleFluent(_108,withinArea(_108,nearCoast)=true,_78).

initiatedAt(movingSpeed(_108)=below, _184, _78, _190) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_184=<_78,_78<_190,
     vesselType(_108,_130),
     typeSpeed(_130,_136,_138,_140),
     thresholds(movingMin,_146),
     inRange(_114,_146,_136).

initiatedAt(movingSpeed(_108)=normal, _172, _78, _178) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_172=<_78,_78<_178,
     vesselType(_108,_130),
     typeSpeed(_130,_136,_138,_140),
     inRange(_114,_136,_138).

initiatedAt(movingSpeed(_108)=above, _172, _78, _178) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_172=<_78,_78<_178,
     vesselType(_108,_130),
     typeSpeed(_130,_136,_138,_140),
     inRange(_114,_138,inf).

initiatedAt(drifting(_108)=true, _208, _78, _214) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_208=<_78,_78<_214,
     _118=\=511.0,
     absoluteAngleDiff(_116,_118,_144),
     thresholds(adriftAngThr,_150),
     _144>_150,
     holdsAtProcessedSDFluent(_108,underWay(_108)=true,_78).

initiatedAt(tuggingSpeed(_108)=true, _168, _78, _174) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_168=<_78,_78<_174,
     thresholds(tuggingMin,_130),
     thresholds(tuggingMax,_136),
     inRange(_114,_130,_136).

initiatedAt(trawlSpeed(_108)=true, _192, _78, _198) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_192=<_78,_78<_198,
     thresholds(trawlspeedMin,_130),
     thresholds(trawlspeedMax,_136),
     inRange(_114,_130,_136),
     holdsAtProcessedSimpleFluent(_108,withinArea(_108,fishing)=true,_78).

initiatedAt(trawlingMovement(_108)=true, _148, _78, _154) :-
     happensAtIE(change_in_heading(_108),_78),_148=<_78,_78<_154,
     holdsAtProcessedSimpleFluent(_108,withinArea(_108,fishing)=true,_78).

initiatedAt(sarSpeed(_108)=true, _156, _78, _162) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_156=<_78,_78<_162,
     thresholds(sarMinSpeed,_130),
     inRange(_114,_130,inf).

initiatedAt(sarMovement(_108)=true, _124, _78, _130) :-
     happensAtIE(change_in_heading(_108),_78),
     _124=<_78,
     _78<_130.

initiatedAt(sarMovement(_108)=true, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(changingSpeed(_108)=true),_78),
     _134=<_78,
     _78<_140.

terminatedAt(withinNaturaOrFishingArea(_108,_110)=true, _200, _78, _206) :-
     happensAtIE(leavesArea(_114,_116),_78),_200=<_78,_78<_206,
     areaType(_116,_110),
     vesselType(_114,_108),
     member(_110,[natura,fishing]),
     member(_108,[cargo,tanker]).

terminatedAt(withinNaturaOrFishingArea(_108,_110)=true, _138, _78, _144) :-
     happensAtIE(gap_start(_114),_78),_138=<_78,_78<_144,
     vesselType(_114,_108).

terminatedAt(withinArea(_108,_110)=true, _140, _78, _146) :-
     happensAtIE(leavesArea(_108,_116),_78),_140=<_78,_78<_146,
     areaType(_116,_110).

terminatedAt(withinArea(_108,_110)=true, _126, _78, _132) :-
     happensAtIE(gap_start(_108),_78),
     _126=<_78,
     _78<_132.

terminatedAt(gap(_108)=_84, _124, _78, _130) :-
     happensAtIE(gap_end(_108),_78),
     _124=<_78,
     _78<_130.

terminatedAt(stopped(_108)=_84, _124, _78, _130) :-
     happensAtIE(stop_end(_108),_78),
     _124=<_78,
     _78<_130.

terminatedAt(stopped(_108)=_84, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(gap(_108)=_118),_78),
     _134=<_78,
     _78<_140.

terminatedAt(lowSpeed(_108)=true, _124, _78, _130) :-
     happensAtIE(slow_motion_end(_108),_78),
     _124=<_78,
     _78<_130.

terminatedAt(lowSpeed(_108)=true, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(gap(_108)=_118),_78),
     _134=<_78,
     _78<_140.

terminatedAt(changingSpeed(_108)=true, _124, _78, _130) :-
     happensAtIE(change_in_speed_end(_108),_78),
     _124=<_78,
     _78<_130.

terminatedAt(changingSpeed(_108)=true, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(gap(_108)=_118),_78),
     _134=<_78,
     _78<_140.

terminatedAt(highSpeedNearCoast(_108)=true, _156, _78, _162) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_156=<_78,_78<_162,
     thresholds(hcNearCoastMax,_130),
     inRange(_114,0,_130).

terminatedAt(highSpeedNearCoast(_108)=true, _136, _78, _142) :-
     happensAtProcessedSimpleFluent(_108,end(withinArea(_108,nearCoast)=true),_78),
     _136=<_78,
     _78<_142.

terminatedAt(movingSpeed(_108)=_84, _160, _78, _166) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_160=<_78,_78<_166,
     thresholds(movingMin,_130),
     \+inRange(_114,_130,inf).

terminatedAt(movingSpeed(_108)=_84, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(gap(_108)=_118),_78),
     _134=<_78,
     _78<_140.

terminatedAt(drifting(_108)=true, _168, _78, _174) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_168=<_78,_78<_174,
     absoluteAngleDiff(_116,_118,_132),
     thresholds(adriftAngThr,_138),
     _132=<_138.

terminatedAt(drifting(_108)=true, _136, _78, _142) :-
     happensAtIE(velocity(_108,_114,_116,511.0),_78),
     _136=<_78,
     _78<_142.

terminatedAt(drifting(_108)=true, _134, _78, _140) :-
     happensAtProcessedSDFluent(_108,end(underWay(_108)=true),_78),
     _134=<_78,
     _78<_140.

terminatedAt(tuggingSpeed(_108)=true, _172, _78, _178) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_172=<_78,_78<_178,
     thresholds(tuggingMin,_130),
     thresholds(tuggingMax,_136),
     \+inRange(_114,_130,_136).

terminatedAt(tuggingSpeed(_108)=true, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(gap(_108)=_118),_78),
     _134=<_78,
     _78<_140.

terminatedAt(trawlSpeed(_108)=true, _172, _78, _178) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_172=<_78,_78<_178,
     thresholds(trawlspeedMin,_130),
     thresholds(trawlspeedMax,_136),
     \+inRange(_114,_130,_136).

terminatedAt(trawlSpeed(_108)=true, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(gap(_108)=_118),_78),
     _134=<_78,
     _78<_140.

terminatedAt(trawlSpeed(_108)=true, _136, _78, _142) :-
     happensAtProcessedSimpleFluent(_108,end(withinArea(_108,fishing)=true),_78),
     _136=<_78,
     _78<_142.

terminatedAt(trawlingMovement(_108)=true, _136, _78, _142) :-
     happensAtProcessedSimpleFluent(_108,end(withinArea(_108,fishing)=true),_78),
     _136=<_78,
     _78<_142.

terminatedAt(sarSpeed(_108)=true, _156, _78, _162) :-
     happensAtIE(velocity(_108,_114,_116,_118),_78),_156=<_78,_78<_162,
     thresholds(sarMinSpeed,_130),
     inRange(_114,0,_130).

terminatedAt(sarSpeed(_108)=true, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(gap(_108)=_118),_78),
     _134=<_78,
     _78<_140.

terminatedAt(sarMovement(_108)=true, _134, _78, _140) :-
     happensAtProcessedSimpleFluent(_108,start(gap(_108)=_118),_78),
     _134=<_78,
     _78<_140.

holdsForSDFluent(underWay(_108)=true,_78) :-
     holdsForProcessedSimpleFluent(_108,movingSpeed(_108)=below,_124),
     holdsForProcessedSimpleFluent(_108,movingSpeed(_108)=normal,_140),
     holdsForProcessedSimpleFluent(_108,movingSpeed(_108)=above,_156),
     union_all([_124,_140,_156],_78).

holdsForSDFluent(anchoredOrMoored(_108)=true,_78) :-
     holdsForProcessedSimpleFluent(_108,stopped(_108)=farFromPorts,_124),
     holdsForProcessedSimpleFluent(_108,withinArea(_108,anchorage)=true,_142),
     intersect_all([_124,_142],_160),
     holdsForProcessedSimpleFluent(_108,stopped(_108)=nearPorts,_176),
     union_all([_160,_176],_194),
     thresholds(aOrMTime,_200),
     intDurGreater(_194,_200,_78).

holdsForSDFluent(tugging(_108,_110)=true,_78) :-
     holdsForProcessedIE(_108,proximity(_108,_110)=true,_128),
     oneIsTug(_108,_110),
     \+oneIsPilot(_108,_110),
     \+twoAreTugs(_108,_110),
     holdsForProcessedSimpleFluent(_108,tuggingSpeed(_108)=true,_170),
     holdsForProcessedSimpleFluent(_110,tuggingSpeed(_110)=true,_186),
     intersect_all([_128,_170,_186],_210),
     thresholds(tuggingTime,_216),
     intDurGreater(_210,_216,_78).

holdsForSDFluent(rendezVous(_108,_110)=true,_78) :-
     holdsForProcessedIE(_108,proximity(_108,_110)=true,_128),
     \+oneIsTug(_108,_110),
     \+oneIsPilot(_108,_110),
     holdsForProcessedSimpleFluent(_108,lowSpeed(_108)=true,_164),
     holdsForProcessedSimpleFluent(_110,lowSpeed(_110)=true,_180),
     holdsForProcessedSimpleFluent(_108,stopped(_108)=farFromPorts,_196),
     holdsForProcessedSimpleFluent(_110,stopped(_110)=farFromPorts,_212),
     union_all([_164,_196],_230),
     union_all([_180,_212],_248),
     intersect_all([_230,_248,_128],_272),
     _272\=[],
     holdsForProcessedSimpleFluent(_108,withinArea(_108,nearPorts)=true,_296),
     holdsForProcessedSimpleFluent(_110,withinArea(_110,nearPorts)=true,_314),
     holdsForProcessedSimpleFluent(_108,withinArea(_108,nearCoast)=true,_332),
     holdsForProcessedSimpleFluent(_110,withinArea(_110,nearCoast)=true,_350),
     relative_complement_all(_272,[_296,_314,_332,_350],_382),
     thresholds(rendezvousTime,_388),
     intDurGreater(_382,_388,_78).

holdsForSDFluent(trawling(_108)=true,_78) :-
     holdsForProcessedSimpleFluent(_108,trawlSpeed(_108)=true,_124),
     holdsForProcessedSimpleFluent(_108,trawlingMovement(_108)=true,_140),
     intersect_all([_124,_140],_158),
     thresholds(trawlingTime,_164),
     intDurGreater(_158,_164,_78).

holdsForSDFluent(inSAR(_108)=true,_78) :-
     holdsForProcessedSimpleFluent(_108,sarSpeed(_108)=true,_124),
     holdsForProcessedSimpleFluent(_108,sarMovement(_108)=true,_140),
     intersect_all([_124,_140],_158),
     intDurGreater(_158,3600,_78).

holdsForSDFluent(loitering(_108)=true,_78) :-
     holdsForProcessedSimpleFluent(_108,lowSpeed(_108)=true,_124),
     holdsForProcessedSimpleFluent(_108,stopped(_108)=farFromPorts,_140),
     union_all([_124,_140],_158),
     holdsForProcessedSimpleFluent(_108,withinArea(_108,nearCoast)=true,_176),
     holdsForProcessedSDFluent(_108,anchoredOrMoored(_108)=true,_192),
     relative_complement_all(_158,[_176,_192],_212),
     thresholds(loiteringTime,_218),
     intDurGreater(_212,_218,_78).

holdsForSDFluent(pilotOps(_108,_110)=true,_78) :-
     holdsForProcessedIE(_108,proximity(_108,_110)=true,_128),
     oneIsPilot(_108,_110),
     holdsForProcessedSimpleFluent(_108,lowSpeed(_108)=true,_150),
     holdsForProcessedSimpleFluent(_110,lowSpeed(_110)=true,_166),
     holdsForProcessedSimpleFluent(_108,stopped(_108)=farFromPorts,_182),
     holdsForProcessedSimpleFluent(_110,stopped(_110)=farFromPorts,_198),
     union_all([_150,_182],_216),
     union_all([_166,_198],_234),
     intersect_all([_216,_234,_128],_258),
     _258\=[],
     holdsForProcessedSimpleFluent(_108,withinArea(_108,nearCoast)=true,_282),
     holdsForProcessedSimpleFluent(_110,withinArea(_110,nearCoast)=true,_300),
     relative_complement_all(_258,[_282,_300],_78).

fi(trawlingMovement(_118)=true,trawlingMovement(_118)=false,_80):-
     thresholds(trawlingCrs,_80),
     grounding(trawlingMovement(_118)=true),
     grounding(trawlingMovement(_118)=false).

fi(sarMovement(_112)=true,sarMovement(_112)=false,1800):-
     grounding(sarMovement(_112)=true),
     grounding(sarMovement(_112)=false).

collectIntervals2(_82, proximity(_82,_84)=true) :-
     vpair(_82,_84).

needsGrounding(_296,_298,_300) :- 
     fail.

grounding(change_in_speed_start(_478)) :- 
     vessel(_478).

grounding(change_in_speed_end(_478)) :- 
     vessel(_478).

grounding(change_in_heading(_478)) :- 
     vessel(_478).

grounding(stop_start(_478)) :- 
     vessel(_478).

grounding(stop_end(_478)) :- 
     vessel(_478).

grounding(slow_motion_start(_478)) :- 
     vessel(_478).

grounding(slow_motion_end(_478)) :- 
     vessel(_478).

grounding(gap_start(_478)) :- 
     vessel(_478).

grounding(gap_end(_478)) :- 
     vessel(_478).

grounding(entersArea(_478,_480)) :- 
     vessel(_478),areaType(_480).

grounding(leavesArea(_478,_480)) :- 
     vessel(_478),areaType(_480).

grounding(coord(_478,_480,_482)) :- 
     vessel(_478).

grounding(velocity(_478,_480,_482,_484)) :- 
     vessel(_478).

grounding(proximity(_484,_486)=true) :- 
     vpair(_484,_486).

grounding(vesselType(_478,_480)) :- 
     vessel(_478),vesselStaticInfo(_478,_480,_492).

grounding(withinNaturaOrFishingArea(_484,_486)=true) :- 
     vessel(_490),areaType(_486).

grounding(gap(_484)=_480) :- 
     vessel(_484),portStatus(_480).

grounding(stopped(_484)=_480) :- 
     vessel(_484),portStatus(_480).

grounding(lowSpeed(_484)=true) :- 
     vessel(_484).

grounding(changingSpeed(_484)=true) :- 
     vessel(_484).

grounding(withinArea(_484,_486)=true) :- 
     vessel(_484),areaType(_486).

grounding(underWay(_484)=true) :- 
     vessel(_484).

grounding(sarSpeed(_484)=true) :- 
     vessel(_484),vesselType(_484,sar).

grounding(sarMovement(_484)=true) :- 
     vessel(_484),vesselType(_484,sar).

grounding(sarMovement(_484)=false) :- 
     vessel(_484),vesselType(_484,sar).

grounding(inSAR(_484)=true) :- 
     vessel(_484).

grounding(highSpeedNearCoast(_484)=true) :- 
     vessel(_484).

grounding(drifting(_484)=true) :- 
     vessel(_484).

grounding(anchoredOrMoored(_484)=true) :- 
     vessel(_484).

grounding(trawlSpeed(_484)=true) :- 
     vessel(_484),vesselType(_484,fishing).

grounding(movingSpeed(_484)=_480) :- 
     vessel(_484),movingStatus(_480).

grounding(pilotOps(_484,_486)=true) :- 
     vpair(_484,_486).

grounding(tuggingSpeed(_484)=true) :- 
     vessel(_484).

grounding(tugging(_484,_486)=true) :- 
     vpair(_484,_486).

grounding(rendezVous(_484,_486)=true) :- 
     vpair(_484,_486).

grounding(trawlingMovement(_484)=true) :- 
     vessel(_484),vesselType(_484,fishing).

grounding(trawlingMovement(_484)=false) :- 
     vessel(_484),vesselType(_484,fishing).

grounding(trawling(_484)=true) :- 
     vessel(_484).

grounding(loitering(_484)=true) :- 
     vessel(_484).

p(trawlingMovement(_478)=true).

p(sarMovement(_478)=true).

inputEntity(entersArea(_132,_134)).
inputEntity(gap_start(_132)).
inputEntity(stop_start(_132)).
inputEntity(slow_motion_start(_132)).
inputEntity(change_in_speed_start(_132)).
inputEntity(velocity(_132,_134,_136,_138)).
inputEntity(change_in_heading(_132)).
inputEntity(leavesArea(_132,_134)).
inputEntity(gap_end(_132)).
inputEntity(stop_end(_132)).
inputEntity(slow_motion_end(_132)).
inputEntity(change_in_speed_end(_132)).
inputEntity(proximity(_138,_140)=true).
inputEntity(coord(_132,_134,_136)).
inputEntity(vesselType(_132,_134)).

outputEntity(withinNaturaOrFishingArea(_284,_286)=true).
outputEntity(withinArea(_284,_286)=true).
outputEntity(gap(_284)=nearPorts).
outputEntity(gap(_284)=farFromPorts).
outputEntity(stopped(_284)=nearPorts).
outputEntity(stopped(_284)=farFromPorts).
outputEntity(lowSpeed(_284)=true).
outputEntity(changingSpeed(_284)=true).
outputEntity(highSpeedNearCoast(_284)=true).
outputEntity(movingSpeed(_284)=below).
outputEntity(movingSpeed(_284)=normal).
outputEntity(movingSpeed(_284)=above).
outputEntity(drifting(_284)=true).
outputEntity(tuggingSpeed(_284)=true).
outputEntity(trawlSpeed(_284)=true).
outputEntity(trawlingMovement(_284)=true).
outputEntity(sarSpeed(_284)=true).
outputEntity(sarMovement(_284)=true).
outputEntity(trawlingMovement(_284)=false).
outputEntity(sarMovement(_284)=false).
outputEntity(underWay(_284)=true).
outputEntity(anchoredOrMoored(_284)=true).
outputEntity(tugging(_284,_286)=true).
outputEntity(rendezVous(_284,_286)=true).
outputEntity(trawling(_284)=true).
outputEntity(inSAR(_284)=true).
outputEntity(loitering(_284)=true).
outputEntity(pilotOps(_284,_286)=true).

event(entersArea(_502,_504)).
event(gap_start(_502)).
event(stop_start(_502)).
event(slow_motion_start(_502)).
event(change_in_speed_start(_502)).
event(velocity(_502,_504,_506,_508)).
event(change_in_heading(_502)).
event(leavesArea(_502,_504)).
event(gap_end(_502)).
event(stop_end(_502)).
event(slow_motion_end(_502)).
event(change_in_speed_end(_502)).
event(coord(_502,_504,_506)).
event(vesselType(_502,_504)).

simpleFluent(withinNaturaOrFishingArea(_648,_650)=true).
simpleFluent(withinArea(_648,_650)=true).
simpleFluent(gap(_648)=nearPorts).
simpleFluent(gap(_648)=farFromPorts).
simpleFluent(stopped(_648)=nearPorts).
simpleFluent(stopped(_648)=farFromPorts).
simpleFluent(lowSpeed(_648)=true).
simpleFluent(changingSpeed(_648)=true).
simpleFluent(highSpeedNearCoast(_648)=true).
simpleFluent(movingSpeed(_648)=below).
simpleFluent(movingSpeed(_648)=normal).
simpleFluent(movingSpeed(_648)=above).
simpleFluent(drifting(_648)=true).
simpleFluent(tuggingSpeed(_648)=true).
simpleFluent(trawlSpeed(_648)=true).
simpleFluent(trawlingMovement(_648)=true).
simpleFluent(sarSpeed(_648)=true).
simpleFluent(sarMovement(_648)=true).
simpleFluent(trawlingMovement(_648)=false).
simpleFluent(sarMovement(_648)=false).


sDFluent(underWay(_880)=true).
sDFluent(anchoredOrMoored(_880)=true).
sDFluent(tugging(_880,_882)=true).
sDFluent(rendezVous(_880,_882)=true).
sDFluent(trawling(_880)=true).
sDFluent(inSAR(_880)=true).
sDFluent(loitering(_880)=true).
sDFluent(pilotOps(_880,_882)=true).
sDFluent(proximity(_880,_882)=true).

index(entersArea(_936,_990),_936).
index(gap_start(_936),_936).
index(stop_start(_936),_936).
index(slow_motion_start(_936),_936).
index(change_in_speed_start(_936),_936).
index(velocity(_936,_990,_992,_994),_936).
index(change_in_heading(_936),_936).
index(leavesArea(_936,_990),_936).
index(gap_end(_936),_936).
index(stop_end(_936),_936).
index(slow_motion_end(_936),_936).
index(change_in_speed_end(_936),_936).
index(coord(_936,_990,_992),_936).
index(vesselType(_936,_990),_936).
index(withinNaturaOrFishingArea(_936,_996)=true,_936).
index(withinArea(_936,_996)=true,_936).
index(gap(_936)=nearPorts,_936).
index(gap(_936)=farFromPorts,_936).
index(stopped(_936)=nearPorts,_936).
index(stopped(_936)=farFromPorts,_936).
index(lowSpeed(_936)=true,_936).
index(changingSpeed(_936)=true,_936).
index(highSpeedNearCoast(_936)=true,_936).
index(movingSpeed(_936)=below,_936).
index(movingSpeed(_936)=normal,_936).
index(movingSpeed(_936)=above,_936).
index(drifting(_936)=true,_936).
index(tuggingSpeed(_936)=true,_936).
index(trawlSpeed(_936)=true,_936).
index(trawlingMovement(_936)=true,_936).
index(sarSpeed(_936)=true,_936).
index(sarMovement(_936)=true,_936).
index(trawlingMovement(_936)=false,_936).
index(sarMovement(_936)=false,_936).
index(underWay(_936)=true,_936).
index(anchoredOrMoored(_936)=true,_936).
index(tugging(_936,_996)=true,_936).
index(rendezVous(_936,_996)=true,_936).
index(trawling(_936)=true,_936).
index(inSAR(_936)=true,_936).
index(loitering(_936)=true,_936).
index(pilotOps(_936,_996)=true,_936).
index(proximity(_936,_996)=true,_936).


cachingOrder2(_1452, withinNaturaOrFishingArea(_1452,_1454)=true) :- % level in dependency graph: 1, processing order in component: 1
     vessel(_1494),areaType(_1454).

cachingOrder2(_1428, withinArea(_1428,_1430)=true) :- % level in dependency graph: 1, processing order in component: 1
     vessel(_1428),areaType(_1430).

cachingOrder2(_1776, gap(_1776)=farFromPorts) :- % level in dependency graph: 2, processing order in component: 1
     vessel(_1776),portStatus(farFromPorts).

cachingOrder2(_1792, gap(_1792)=nearPorts) :- % level in dependency graph: 2, processing order in component: 2
     vessel(_1792),portStatus(nearPorts).

cachingOrder2(_1754, highSpeedNearCoast(_1754)=true) :- % level in dependency graph: 2, processing order in component: 1
     vessel(_1754).

cachingOrder2(_1716, trawlingMovement(_1716)=true) :- % level in dependency graph: 2, processing order in component: 1
     vessel(_1716),vesselType(_1716,fishing).

cachingOrder2(_1716, trawlingMovement(_1716)=false) :- % level in dependency graph: 2, processing order in component: 2
     vessel(_1716),vesselType(_1716,fishing).

cachingOrder2(_2420, stopped(_2420)=farFromPorts) :- % level in dependency graph: 3, processing order in component: 1
     vessel(_2420),portStatus(farFromPorts).

cachingOrder2(_2436, stopped(_2436)=nearPorts) :- % level in dependency graph: 3, processing order in component: 2
     vessel(_2436),portStatus(nearPorts).

cachingOrder2(_2398, lowSpeed(_2398)=true) :- % level in dependency graph: 3, processing order in component: 1
     vessel(_2398).

cachingOrder2(_2376, changingSpeed(_2376)=true) :- % level in dependency graph: 3, processing order in component: 1
     vessel(_2376).

cachingOrder2(_2322, movingSpeed(_2322)=above) :- % level in dependency graph: 3, processing order in component: 1
     vessel(_2322),movingStatus(above).

cachingOrder2(_2338, movingSpeed(_2338)=normal) :- % level in dependency graph: 3, processing order in component: 2
     vessel(_2338),movingStatus(normal).

cachingOrder2(_2354, movingSpeed(_2354)=below) :- % level in dependency graph: 3, processing order in component: 3
     vessel(_2354),movingStatus(below).

cachingOrder2(_2300, tuggingSpeed(_2300)=true) :- % level in dependency graph: 3, processing order in component: 1
     vessel(_2300).

cachingOrder2(_2278, trawlSpeed(_2278)=true) :- % level in dependency graph: 3, processing order in component: 1
     vessel(_2278),vesselType(_2278,fishing).

cachingOrder2(_2256, sarSpeed(_2256)=true) :- % level in dependency graph: 3, processing order in component: 1
     vessel(_2256),vesselType(_2256,sar).

cachingOrder2(_3418, sarMovement(_3418)=true) :- % level in dependency graph: 4, processing order in component: 1
     vessel(_3418),vesselType(_3418,sar).

cachingOrder2(_3418, sarMovement(_3418)=false) :- % level in dependency graph: 4, processing order in component: 2
     vessel(_3418),vesselType(_3418,sar).

cachingOrder2(_3396, underWay(_3396)=true) :- % level in dependency graph: 4, processing order in component: 1
     vessel(_3396).

cachingOrder2(_3374, anchoredOrMoored(_3374)=true) :- % level in dependency graph: 4, processing order in component: 1
     vessel(_3374).

cachingOrder2(_3350, tugging(_3350,_3352)=true) :- % level in dependency graph: 4, processing order in component: 1
     vpair(_3350,_3352).

cachingOrder2(_3326, rendezVous(_3326,_3328)=true) :- % level in dependency graph: 4, processing order in component: 1
     vpair(_3326,_3328).

cachingOrder2(_3304, trawling(_3304)=true) :- % level in dependency graph: 4, processing order in component: 1
     vessel(_3304).

cachingOrder2(_3280, pilotOps(_3280,_3282)=true) :- % level in dependency graph: 4, processing order in component: 1
     vpair(_3280,_3282).

cachingOrder2(_4186, drifting(_4186)=true) :- % level in dependency graph: 5, processing order in component: 1
     vessel(_4186).

cachingOrder2(_4164, inSAR(_4164)=true) :- % level in dependency graph: 5, processing order in component: 1
     vessel(_4164).

cachingOrder2(_4142, loitering(_4142)=true) :- % level in dependency graph: 5, processing order in component: 1
     vessel(_4142).

collectGrounds([entersArea(_726,_740), gap_start(_726), stop_start(_726), slow_motion_start(_726), change_in_speed_start(_726), velocity(_726,_740,_742,_744), change_in_heading(_726), leavesArea(_726,_740), gap_end(_726), stop_end(_726), slow_motion_end(_726), change_in_speed_end(_726), coord(_726,_740,_742), vesselType(_726,_740)],vessel(_726)).

collectGrounds([proximity(_714,_716)=true],vpair(_714,_716)).

dgrounded(withinNaturaOrFishingArea(_1846,_1848)=true, vessel(_1864)).
dgrounded(withinArea(_1802,_1804)=true, vessel(_1802)).
dgrounded(gap(_1760)=nearPorts, vessel(_1760)).
dgrounded(gap(_1718)=farFromPorts, vessel(_1718)).
dgrounded(stopped(_1676)=nearPorts, vessel(_1676)).
dgrounded(stopped(_1634)=farFromPorts, vessel(_1634)).
dgrounded(lowSpeed(_1602)=true, vessel(_1602)).
dgrounded(changingSpeed(_1570)=true, vessel(_1570)).
dgrounded(highSpeedNearCoast(_1538)=true, vessel(_1538)).
dgrounded(movingSpeed(_1496)=below, vessel(_1496)).
dgrounded(movingSpeed(_1454)=normal, vessel(_1454)).
dgrounded(movingSpeed(_1412)=above, vessel(_1412)).
dgrounded(drifting(_1380)=true, vessel(_1380)).
dgrounded(tuggingSpeed(_1348)=true, vessel(_1348)).
dgrounded(trawlSpeed(_1304)=true, vessel(_1304)).
dgrounded(trawlingMovement(_1260)=true, vessel(_1260)).
dgrounded(sarSpeed(_1216)=true, vessel(_1216)).
dgrounded(sarMovement(_1172)=true, vessel(_1172)).
dgrounded(trawlingMovement(_1128)=false, vessel(_1128)).
dgrounded(sarMovement(_1084)=false, vessel(_1084)).
dgrounded(underWay(_1052)=true, vessel(_1052)).
dgrounded(anchoredOrMoored(_1020)=true, vessel(_1020)).
dgrounded(tugging(_984,_986)=true, vpair(_984,_986)).
dgrounded(rendezVous(_948,_950)=true, vpair(_948,_950)).
dgrounded(trawling(_916)=true, vessel(_916)).
dgrounded(inSAR(_884)=true, vessel(_884)).
dgrounded(loitering(_852)=true, vessel(_852)).
dgrounded(pilotOps(_816,_818)=true, vpair(_816,_818)).
