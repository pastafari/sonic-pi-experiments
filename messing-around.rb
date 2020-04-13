# Welcome to Sonic Pi v3.0.1

set :bpm, 120

live_loop :kick do
  use_bpm get(:bpm)
  with_fx :distortion, distort: 0.4 do
    sample :drum_heavy_kick, amp: 1.5
  end
  sleep 1
end

live_loop :tom do
  use_bpm get(:bpm)
  sleep 2.75
  sample :drum_tom_hi_soft, amp: 1
  with_fx :distortion, distort: 0.2 do
    sleep 0.75
    sample :drum_tom_hi_hard, amp: 0.6
  end
  sleep 0.5
end

snare_counter = 0
live_loop :snare do
  use_bpm get(:bpm)
  room = snare_counter % 4 == 0 ? 0.9 : 0.3
  
  
  sleep 1
  
  with_fx :reverb, mix: 0.5, room: room do
    sample :drum_snare_soft
  end
  
  sleep 1
  snare_counter += 1
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

cutoff_counter = 0
live_loop :squelch do
  use_bpm get(:bpm) / 2
  use_synth :tb303
  n = (ring :e1, :e2, :e3, :e2).tick
  play n,
    amp: 0.2,
    release: 0.125,
    cutoff: 60 + 30 * Math.sin(cutoff_counter),
    res: 0.9,
    wave: 1
  sleep 0.5
  cutoff_counter += 1
end

live_loop :timbre do
  use_synth (ring :tb303, :blade, :prophet, :saw).tick
  n = (ring :f2, :c2, :a2, :d2).tick
  with_fx :echo do
    with_fx :hpf, cutoff: 35 do
      play n, amp: 0.25, attack: 0.2, release: 0.5, cutoff: 60
    end
  end
  sleep 0.5
end