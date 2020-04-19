live_loop :beat do
  with_fx :flanger, wave: 2 do
    sample :loop_garzul, amp: 2
  end
  sleep sample_duration(:loop_garzul)
end

live_loop :multi_beat do
  c = rrand(80, 130)
  n = (scale :d3, :major_pentatonic).choose
  synth :tb303, note: n, amp: 1.4, release: 0.1, cutoff: c if rand < 0.9
  sleep 0.125
end