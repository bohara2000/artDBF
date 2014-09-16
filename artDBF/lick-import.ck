/*
NOTE

You need to manually move over 
the Ladspa chugin from the jwmatthys Chugins repo.
Otherwise, a lot of these effects won't work.

LADSPA may also need to be manually installed,
but try moving the .chug file first before doing that
in the future. 

Just making a note to save future self from headaches...
*/

/*

    LiCK  Library for ChucK.
    Copyright (c) 2007-2014 held jointly by the individual authors.

    This file is part of LiCK.

    LiCK is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    LiCK is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with LiCK.  If not, see <http://www.gnu.org/licenses/>.

*/

// functors, package functor
Machine.add(me.dir() + "/lick/BinaryFunction.ck");
Machine.add(me.dir() + "/lick/BinaryPredicate.ck");
Machine.add(me.dir() + "/lick/BinaryProcedure.ck");
Machine.add(me.dir() + "/lick/FloatFloatFloatFloatFunction.ck");
Machine.add(me.dir() + "/lick/FloatFloatFloatFloatPredicate.ck");
Machine.add(me.dir() + "/lick/FloatFloatFloatFloatProcedure.ck");
Machine.add(me.dir() + "/lick/FloatFloatFloatFunction.ck");
Machine.add(me.dir() + "/lick/FloatFloatFloatPredicate.ck");
Machine.add(me.dir() + "/lick/FloatFloatFloatProcedure.ck");
Machine.add(me.dir() + "/lick/FloatFloatFunction.ck");
Machine.add(me.dir() + "/lick/FloatFloatPredicate.ck");
Machine.add(me.dir() + "/lick/FloatFloatProcedure.ck");
Machine.add(me.dir() + "/lick/FloatFunction.ck");
Machine.add(me.dir() + "/lick/FloatPredicate.ck");
Machine.add(me.dir() + "/lick/FloatProcedure.ck");
Machine.add(me.dir() + "/lick/Function.ck");
Machine.add(me.dir() + "/lick/IntFunction.ck");
Machine.add(me.dir() + "/lick/IntIntFunction.ck");
Machine.add(me.dir() + "/lick/IntIntIntFunction.ck");
Machine.add(me.dir() + "/lick/IntIntIntIntFunction.ck");
Machine.add(me.dir() + "/lick/IntIntIntIntPredicate.ck");
Machine.add(me.dir() + "/lick/IntIntIntIntProcedure.ck");
Machine.add(me.dir() + "/lick/IntIntIntPredicate.ck");
Machine.add(me.dir() + "/lick/IntIntIntProcedure.ck");
Machine.add(me.dir() + "/lick/IntIntFloatProcedure.ck");
Machine.add(me.dir() + "/lick/IntIntPredicate.ck");
Machine.add(me.dir() + "/lick/IntIntProcedure.ck");
Machine.add(me.dir() + "/lick/IntFloatProcedure.ck");
Machine.add(me.dir() + "/lick/IntFloatFloatProcedure.ck");
Machine.add(me.dir() + "/lick/IntPredicate.ck");
Machine.add(me.dir() + "/lick/IntProcedure.ck");
Machine.add(me.dir() + "/lick/Predicate.ck");
Machine.add(me.dir() + "/lick/Procedure.ck");
Machine.add(me.dir() + "/lick/QuaternaryFunction.ck");
Machine.add(me.dir() + "/lick/QuaternaryPredicate.ck");
Machine.add(me.dir() + "/lick/TernaryFunction.ck");
Machine.add(me.dir() + "/lick/TernaryPredicate.ck");
Machine.add(me.dir() + "/lick/TernaryProcedure.ck");
Machine.add(me.dir() + "/lick/UnaryFunction.ck");
Machine.add(me.dir() + "/lick/UnaryPredicate.ck");
Machine.add(me.dir() + "/lick/UnaryProcedure.ck");

// functions
Machine.add(me.dir() + "/lick/Acos.ck");
Machine.add(me.dir() + "/lick/Asin.ck");
Machine.add(me.dir() + "/lick/Atan.ck");
Machine.add(me.dir() + "/lick/Ceil.ck");
Machine.add(me.dir() + "/lick/Cos.ck");
Machine.add(me.dir() + "/lick/Cosh.ck");
Machine.add(me.dir() + "/lick/Exp.ck");
Machine.add(me.dir() + "/lick/Floor.ck");
Machine.add(me.dir() + "/lick/Identity.ck");
Machine.add(me.dir() + "/lick/Inverse.ck");
Machine.add(me.dir() + "/lick/Log.ck");
Machine.add(me.dir() + "/lick/Log10.ck");
Machine.add(me.dir() + "/lick/Log2.ck");
Machine.add(me.dir() + "/lick/Negate.ck");
Machine.add(me.dir() + "/lick/Round.ck");
Machine.add(me.dir() + "/lick/Sin.ck");
Machine.add(me.dir() + "/lick/Sinh.ck");
Machine.add(me.dir() + "/lick/Sqrt.ck");
Machine.add(me.dir() + "/lick/Tan.ck");
Machine.add(me.dir() + "/lick/Tanh.ck");
Machine.add(me.dir() + "/lick/Trunc.ck");
Machine.add(me.dir() + "/lick/Uniform.ck");

// composite functions
Machine.add(me.dir() + "/lick/CompositeFloatFunction.ck");
Machine.add(me.dir() + "/lick/CompositeFunction.ck");
Machine.add(me.dir() + "/lick/CompositeIntFunction.ck");

// function convenience classes
Machine.add(me.dir() + "/lick/Functions.ck");
Machine.add(me.dir() + "/lick/FloatFunctions.ck");
Machine.add(me.dir() + "/lick/IntFunctions.ck");

// interpolation, package interpolate
Machine.add(me.dir() + "/lick/Interpolation.ck");
Machine.add(me.dir() + "/lick/BackIn.ck");
Machine.add(me.dir() + "/lick/BackOut.ck");
Machine.add(me.dir() + "/lick/BackInOut.ck");
Machine.add(me.dir() + "/lick/AbstractBounce.ck");
Machine.add(me.dir() + "/lick/BounceIn.ck");
Machine.add(me.dir() + "/lick/BounceOut.ck");
Machine.add(me.dir() + "/lick/BounceInOut.ck");
Machine.add(me.dir() + "/lick/CircularIn.ck");
Machine.add(me.dir() + "/lick/CircularInOut.ck");
Machine.add(me.dir() + "/lick/CircularOut.ck");
Machine.add(me.dir() + "/lick/CubicIn.ck");
Machine.add(me.dir() + "/lick/CubicInOut.ck");
Machine.add(me.dir() + "/lick/CubicOut.ck");
Machine.add(me.dir() + "/lick/ElasticIn.ck");
Machine.add(me.dir() + "/lick/ElasticOut.ck");
Machine.add(me.dir() + "/lick/ElasticInOut.ck");
Machine.add(me.dir() + "/lick/ExponentialIn.ck");
Machine.add(me.dir() + "/lick/ExponentialInOut.ck");
Machine.add(me.dir() + "/lick/ExponentialOut.ck");
Machine.add(me.dir() + "/lick/Linear.ck");
Machine.add(me.dir() + "/lick/QuadraticIn.ck");
Machine.add(me.dir() + "/lick/QuadraticInOut.ck");
Machine.add(me.dir() + "/lick/QuadraticOut.ck");
Machine.add(me.dir() + "/lick/QuarticIn.ck");
Machine.add(me.dir() + "/lick/QuarticInOut.ck");
Machine.add(me.dir() + "/lick/QuarticOut.ck");
Machine.add(me.dir() + "/lick/QuinticIn.ck");
Machine.add(me.dir() + "/lick/QuinticInOut.ck");
Machine.add(me.dir() + "/lick/QuinticOut.ck");
Machine.add(me.dir() + "/lick/Random.ck");
Machine.add(me.dir() + "/lick/GaussianRandom.ck");
Machine.add(me.dir() + "/lick/RandomFloor.ck");
Machine.add(me.dir() + "/lick/RandomThreshold.ck");
Machine.add(me.dir() + "/lick/SinusoidalIn.ck");
Machine.add(me.dir() + "/lick/SinusoidalInOut.ck");
Machine.add(me.dir() + "/lick/SinusoidalOut.ck");
Machine.add(me.dir() + "/lick/Interpolate.ck");
Machine.add(me.dir() + "/lick/Constrain.ck");
Machine.add(me.dir() + "/lick/Interpolations.ck");

// duration providers, package duration
Machine.add(me.dir() + "/lick/DurProvider.ck");
Machine.add(me.dir() + "/lick/Humanize.ck");
Machine.add(me.dir() + "/lick/HumanizedDurProvider.ck");

// procedures, package loop
Machine.add(me.dir() + "/lick/Append.ck");
Machine.add(me.dir() + "/lick/Prepend.ck");
Machine.add(me.dir() + "/lick/Repeat.ck");
Machine.add(me.dir() + "/lick/Sleep.ck");
Machine.add(me.dir() + "/lick/Loop.ck");

// list, package collect
Machine.add(me.dir() + "/lick/Comparator.ck");
Machine.add(me.dir() + "/lick/Iterator.ck");
Machine.add(me.dir() + "/lick/List.ck");
Machine.add(me.dir() + "/lick/ListIterator.ck");
Machine.add(me.dir() + "/lick/ArrayList.ck");

// int list
Machine.add(me.dir() + "/lick/IntComparator.ck");
Machine.add(me.dir() + "/lick/IntIterator.ck");
Machine.add(me.dir() + "/lick/IntList.ck");
Machine.add(me.dir() + "/lick/IntListIterator.ck");
Machine.add(me.dir() + "/lick/IntArrayList.ck");

// float list
Machine.add(me.dir() + "/lick/FloatComparator.ck");
Machine.add(me.dir() + "/lick/FloatIterator.ck");
Machine.add(me.dir() + "/lick/FloatList.ck");
Machine.add(me.dir() + "/lick/FloatListIterator.ck");
Machine.add(me.dir() + "/lick/FloatArrayList.ck");

// set
Machine.add(me.dir() + "/lick/Set.ck");
Machine.add(me.dir() + "/lick/ArraySet.ck");

// graphs
Machine.add(me.dir() + "/lick/Node.ck");
Machine.add(me.dir() + "/lick/Edge.ck");
Machine.add(me.dir() + "/lick/Graph.ck");
Machine.add(me.dir() + "/lick/Graphs.ck");

// intervals, chords, scales, arpeggiator
Machine.add(me.dir() + "/lick/TimeSignature.ck"); // package duration?
Machine.add(me.dir() + "/lick/Interval.ck");
Machine.add(me.dir() + "/lick/Intervals.ck");
Machine.add(me.dir() + "/lick/Chord.ck");
Machine.add(me.dir() + "/lick/Chords.ck");
Machine.add(me.dir() + "/lick/Scale.ck");
Machine.add(me.dir() + "/lick/Scales.ck");
Machine.add(me.dir() + "/lick/Arpeggiator.ck");
Machine.add(me.dir() + "/lick/Arpeggiators.ck");
Machine.add(me.dir() + "/lick/Pattern.ck");
Machine.add(me.dir() + "/lick/Patterns.ck");
Machine.add(me.dir() + "/lick/Warp.ck");
Machine.add(me.dir() + "/lick/MidiNote.ck");
Machine.add(me.dir() + "/lick/MidiNotes.ck");
Machine.add(me.dir() + "/lick/Tuning.ck");
Machine.add(me.dir() + "/lick/Tunings.ck");

// unit test, package test
Machine.add(me.dir() + "/lick/Assert.ck");

// simulators, package simulator
Machine.add(me.dir() + "/lick/Animoog.ck");
Machine.add(me.dir() + "/lick/EchoPad.ck");
Machine.add(me.dir() + "/lick/Filtatron.ck");
Machine.add(me.dir() + "/lick/GarageBand.ck");
Machine.add(me.dir() + "/lick/Loopy.ck");
Machine.add(me.dir() + "/lick/MeeBlip.ck");
Machine.add(me.dir() + "/lick/SooperLooper.ck");
Machine.add(me.dir() + "/lick/TwoPots.ck");

// midi, package midi
Machine.add(me.dir() + "/lick/ControlChangeMidiMsg.ck");
Machine.add(me.dir() + "/lick/NoteOffMidiMsg.ck");
Machine.add(me.dir() + "/lick/NoteOnMidiMsg.ck");
Machine.add(me.dir() + "/lick/AnimoogMidi.ck");
Machine.add(me.dir() + "/lick/EchoPadMidi.ck");
Machine.add(me.dir() + "/lick/GarageBandMidi.ck");
Machine.add(me.dir() + "/lick/FiltatronMidi.ck");
Machine.add(me.dir() + "/lick/LoopyMidi.ck");
Machine.add(me.dir() + "/lick/MeeBlipMidi.ck");
Machine.add(me.dir() + "/lick/EuclidMidi.ck");
Machine.add(me.dir() + "/lick/StompMidi.ck");
Machine.add(me.dir() + "/lick/TwoPotsMidi.ck");
Machine.add(me.dir() + "/lick/PodHd500Midi.ck");

// devices, package device
Machine.add(me.dir() + "/lick/Keyboard.ck");
Machine.add(me.dir() + "/lick/Joystick.ck");
Machine.add(me.dir() + "/lick/LogitechGamepadF310.ck");
Machine.add(me.dir() + "/lick/Monome.ck");
Machine.add(me.dir() + "/lick/Mouse.ck");
Machine.add(me.dir() + "/lick/NanoPad.ck");
Machine.add(me.dir() + "/lick/MAudioOzone.ck");
Machine.add(me.dir() + "/lick/AlesisQX25.ck");
Machine.add(me.dir() + "/lick/StompKeyboard.ck");
Machine.add(me.dir() + "/lick/PodHd500.ck");

// osc, package osc
Machine.add(me.dir() + "/lick/ControlOscServer.ck");
Machine.add(me.dir() + "/lick/EuclidOsc.ck");
Machine.add(me.dir() + "/lick/IanniXOsc.ck");
Machine.add(me.dir() + "/lick/LeapMotionOsc.ck");
Machine.add(me.dir() + "/lick/SooperLooperOsc.ck");
Machine.add(me.dir() + "/lick/TouchOscServer.ck");

// samples, loops
Machine.add(me.dir() + "/lick/Sample.ck");
Machine.add(me.dir() + "/lick/AdsrSample.ck");
Machine.add(me.dir() + "/lick/CompositeSample.ck");
Machine.add(me.dir() + "/lick/RandomSample.ck");
Machine.add(me.dir() + "/lick/PitchSensitiveSample.ck");
Machine.add(me.dir() + "/lick/VelocitySensitiveSample.ck");
Machine.add(me.dir() + "/lick/HandedSample.ck");
Machine.add(me.dir() + "/lick/Samples.ck");
Machine.add(me.dir() + "/lick/Loops.ck");
Machine.add(me.dir() + "/lick/LoopBuilder.ck");

// sample-based drum machines, package sample
Machine.add(me.dir() + "/lick/AkaiMpc60.ck");
Machine.add(me.dir() + "/lick/EmuDrumulator.ck");
Machine.add(me.dir() + "/lick/OberheimDmx.ck");
Machine.add(me.dir() + "/lick/RolandCr78.ck");
Machine.add(me.dir() + "/lick/RolandTr66.ck");
Machine.add(me.dir() + "/lick/RolandTr606.ck");
Machine.add(me.dir() + "/lick/RolandTr808.ck");
Machine.add(me.dir() + "/lick/RolandTr909.ck");
Machine.add(me.dir() + "/lick/BigMono.ck");
Machine.add(me.dir() + "/lick/KorgMs20.ck");

// dist stuff
Machine.add(me.dir() + "/lick/GainShaper.ck");
Machine.add(me.dir() + "/lick/WaveShaper.ck");
Machine.add(me.dir() + "/lick/Clip.ck");
Machine.add(me.dir() + "/lick/Dist.ck");
Machine.add(me.dir() + "/lick/AtanDist.ck");
Machine.add(me.dir() + "/lick/TanhDist.ck");
Machine.add(me.dir() + "/lick/RibbonDist.ck");
Machine.add(me.dir() + "/lick/FrostburnDist.ck");
Machine.add(me.dir() + "/lick/KijjazDist.ck");
Machine.add(me.dir() + "/lick/KijjazDist2.ck");
Machine.add(me.dir() + "/lick/KijjazDist3.ck");
Machine.add(me.dir() + "/lick/KijjazDist4.ck");

// cv stuff
Machine.add(me.dir() + "/lick/Module.ck");
Machine.add(me.dir() + "/lick/Module2.ck");
Machine.add(me.dir() + "/lick/Module3.ck");
Machine.add(me.dir() + "/lick/Module4.ck");
Machine.add(me.dir() + "/lick/Module5.ck");
Machine.add(me.dir() + "/lick/Module6.ck");
Machine.add(me.dir() + "/lick/Module7.ck");
Machine.add(me.dir() + "/lick/Module8.ck");

// effects
Machine.add(me.dir() + "/lick/Effect.ck");
Machine.add(me.dir() + "/lick/CryBaby.ck");
Machine.add(me.dir() + "/lick/DualRect.ck");
Machine.add(me.dir() + "/lick/Harmonizer.ck");
Machine.add(me.dir() + "/lick/Harmonizers.ck");
Machine.add(me.dir() + "/lick/Mesmerizer.ck");
Machine.add(me.dir() + "/lick/MonoDelay2.ck");
Machine.add(me.dir() + "/lick/Thicken.ck");
Machine.add(me.dir() + "/lick/Tremolo.ck");

// delay stuff
Machine.add(me.dir() + "/lick/SinTrem.ck");
Machine.add(me.dir() + "/lick/SqrTrem.ck");
Machine.add(me.dir() + "/lick/TriTrem.ck");
Machine.add(me.dir() + "/lick/Trem.ck");
Machine.add(me.dir() + "/lick/MonoDelay.ck");
Machine.add(me.dir() + "/lick/StereoDelay.ck");
Machine.add(me.dir() + "/lick/FeedbackMachine.ck");
Machine.add(me.dir() + "/lick/FeedbackMachines.ck");
Machine.add(me.dir() + "/lick/StereoFeedbackMachine.ck");
Machine.add(me.dir() + "/lick/StereoFeedbackMachines.ck");
Machine.add(me.dir() + "/lick/Smear.ck");
Machine.add(me.dir() + "/lick/ScaleSmear.ck");
Machine.add(me.dir() + "/lick/Swirl.ck");

// synth/osc
Machine.add(me.dir() + "/lick/CircleRamp.ck");
Machine.add(me.dir() + "/lick/SawRamp.ck");
Machine.add(me.dir() + "/lick/SubGen.ck");
Machine.add(me.dir() + "/lick/SeptSubGen.ck");
Machine.add(me.dir() + "/lick/VoiceOfSaturn.ck");
// Machine.add(me.dir() + "/lick/DroneLab.ck");

// depends on chugins
Machine.add(me.dir() + "/lick/Crush.ck");
Machine.add(me.dir() + "/lick/Expo.ck");
Machine.add(me.dir() + "/lick/PitchFollower.ck");
Machine.add(me.dir() + "/lick/SigmuFollower.ck");
Machine.add(me.dir() + "/lick/SigmuGainFollower.ck");
Machine.add(me.dir() + "/lick/SigmuPitchFollower.ck");
Machine.add(me.dir() + "/lick/Spekt.ck");

// depends on LADSPA chugin
Machine.add(me.dir() + "/lick/Ladspa.ck");

// C*APS plugins
Machine.add(me.dir() + "/lick/Caps.ck");
Machine.add(me.dir() + "/lick/Amp.ck");
Machine.add(me.dir() + "/lick/Cabinet.ck");
Machine.add(me.dir() + "/lick/Eq.ck");
Machine.add(me.dir() + "/lick/NoiseGate.ck");
Machine.add(me.dir() + "/lick/ParametricEq.ck");
Machine.add(me.dir() + "/lick/Plate.ck");
Machine.add(me.dir() + "/lick/Saturate.ck");
Machine.add(me.dir() + "/lick/Scape.ck");
Machine.add(me.dir() + "/lick/StereoEq.ck");
Machine.add(me.dir() + "/lick/StereoPlate.ck");
Machine.add(me.dir() + "/lick/ToneStack.ck");

// CMT plugins
Machine.add(me.dir() + "/lick/Cmt.ck");
Machine.add(me.dir() + "/lick/Lofi.ck");

// TAP-plugins
Machine.add(me.dir() + "/lick/Tap.ck");
Machine.add(me.dir() + "/lick/TubeWarmth.ck");

// SWH plugins
Machine.add(me.dir() + "/lick/Swh.ck");
Machine.add(me.dir() + "/lick/PitchScale.ck");
Machine.add(me.dir() + "/lick/TapeDelay.ck");

// RubberBand plugins
Machine.add(me.dir() + "/lick/RubberBand.ck");

<<<"LiCK imported.">>>;
