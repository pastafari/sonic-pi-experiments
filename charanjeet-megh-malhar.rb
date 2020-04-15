##| Charanjeet Singh
##| Raga Megh Malhar
##| Ten Ragas to a Disco Beat

set(:bpm, 180)

live_loop :bd_tek do
  use_bpm get(:bpm)
  3.times do
    sample :bd_tek, amp: 0.5, decay: 0.2
    sleep 0.5
    sample :drum_snare_soft
    sleep 0.5
  end
  sleep 1
end

live_loop :snare do
  stop
  use_bpm get(:bpm)
  sync(:bd_tek)
  sleep 3
  sample :drum_snare_soft, beat_stretch: 1
end

live_loop :cymbal do
  use_bpm get(:bpm)
  sync(:bd_tek)
  sleep 0.5
  sample :drum_cymbal_pedal,  amp: 0.6, beat_stretch: 1
  sleep 0.5
  sample :drum_heavy_kick,  amp: 0.4, decay: 0.2, sustain_level: 0
end
