live_loop :tick do
  use_bpm 120
  cue(:tick)
  sleep 1
end

live_loop :drum do
  sync(:tick)
  sample :drum_bass_hard, amp: 2
  sleep 0.5
end

live_loop :tabla do
  sync(:tick)
  note = ring(:tabla_ke1, :tabla_na_s, :tabla_tas2, :tabla_na_o, :tabla_re).tick
  sample note, release: 0.25
  sleep 0.25
end

live_loop :kick do
  sync(:tick)
  sample :drum_heavy_kick, amp: 4
  sleep 0.5
end

live_loop :tb do
  sync(:tick)
  use_synth :tb303
  with_fx :reverb, room: 0.5 do
    with_fx :bitcrusher, bits: 8 do
      note = ring(90,40,70).tick
      play note, cutoff: rrand(30,120), release: 0.25, wave: choose([0,1,2])
      sleep 0.25
    end
  end
end

live_loop :habanera do
  ##| bizet_bass = (ring :d, :r, :r, :a, :f5, :r, :a, :r)
  bizet_bass = (ring :d, :r, :r, :Bb, :g5, :r, :Bb, :r)
  
  use_synth :prophet
  use_transpose -12
  play bizet_bass.tick
  sleep 0.25
end

with_fx :reverb do
  live_loop :space_light do
    sync(:tick)
    with_fx :slicer, phase: 0.75 do
      synth :dark_ambience, note: :d, release: 8, cutoff: 100, amp: 2
    end
    sleep 8
    with_fx :slicer, phase: 0.5 do
      synth :blade, note: :c, release: 8, cutoff: 120, amp: 2
    end
    sleep 8
  end
end

live_loop :prophet do
  sync(:tick)
  use_synth :prophet
  note = ring(120, 30, 90).tick
  play note, release: 0.2, cutoff: rrand(30,120)
  sleep 0.25
end
