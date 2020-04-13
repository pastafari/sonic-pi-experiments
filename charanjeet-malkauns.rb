
live_loop :thump do
  use_bpm 180
  sample :drum_cymbal_closed, amp: 0.5
  sleep 1
  sample :drum_bass_soft, amp: 0.5
  sleep 1
end

