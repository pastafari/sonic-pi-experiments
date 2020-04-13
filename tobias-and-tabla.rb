# Welcome to Sonic Pi v3.0.1

set :bpm, 120

live_loop :kick do
  use_bpm get(:bpm)
  with_fx :distortion, distort: 0.4 do
    sample :drum_heavy_kick, amp: 2.5
  end
  sleep 1
end

live_loop :tom do
  use_bpm get(:bpm)
  sleep 2.75
  with_fx :distortion, distort: 0.2 do
    sample :drum_tom_hi_soft, amp: 1
    sleep 0.75
    sample :drum_tom_hi_hard, amp: 0.6
  end
  sleep 0.5
end

live_loop :snare do
  use_bpm get(:bpm)
  room = one_in(4) ? 0.9 : 0.3
  
  sleep 1
  
  with_fx :reverb, mix: 0.5, room: room do
    sample :drum_snare_soft
  end
  
  sleep 1
end

live_loop :hats do
  use_bpm get(:bpm)
  sample :drum_cymbal_closed, amp: 1
  sleep 0.5
  
  sample :drum_cymbal_open, amp: 0.15, decay_level: 0.5
  sleep 0.5
  2.times do
    sample :drum_cymbal_closed, amp: 1
    sleep 0.5
  end
end

##| live_loop :squelch do
##|   use_bpm get(:bpm) / 2
##|   use_synth :tb303
##|   key = ring(:D1, :G1, :C1).tick
##|   chord_type = one_in(2) ? :maj : :min
##|   n = chord(key, chord_type)
##|   play n,
##|     amp: 0.3,
##|     attack: 0.3,
##|     release: 0.9,
##|     cutoff: 60 + 40 * rrand(-1,1),
##|     res: 0.5,
##|     wave: 1
##|   sleep 0.75
##| end

live_loop :scratch do
  sync :kick
  stop
  ##| sample :guit_em9, amp: 0.5
  sleep 4
end

live_loop :beat_mix do
  use_bpm get(:bpm)
  sync :kick
  amp = 2.9
  
  play tabla_mix(amp)
  
  ##| 32.times do
  ##|   sample choose[(sample_paths "tabla_")]
  ##|   sleep 0.25
  ##| end
  
  sleep 16
end

define :tabla_mix do |amp|
  4.times do
    sample :tabla_na, amp: amp
    sleep 0.75
    sample :tabla_tas1, amp: amp
    sleep 0.25
    sample :tabla_na, amp: amp
    sleep 0.75
    sample :tabla_te2, amp: amp
    sleep 0.25
    sample :tabla_tem, amp: amp
    sleep 0.25
  end
  2.times do
    sample :tabla_na, amp: amp
    sleep 0.75
    sample :tabla_dhec, amp: amp
    sleep 0.5
    sample :tabla_dhec, amp: amp
    sleep 0.5
    sample :tabla_na, amp: amp
    sleep 0.75
  end
  with_fx :bitcrusher do    
    4.times do
      sample :tabla_ke1, amp: amp
      sleep 0.25
      sample :tabla_ke1, amp: amp
      sleep 0.25
      sample :tabla_dhec, amp: amp
      sleep 0.5
      sample :tabla_ke1, amp: amp
      sleep 0.25
      sample :tabla_dhec, amp: amp
      sleep 0.5
    end
  end
end