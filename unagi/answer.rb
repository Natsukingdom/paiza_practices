def main
  seats_num, group_num = get_stdin_as_arr
  @seats = Array.new(seats_num, false)
  group_num.times do
    members_count, first_seat =  get_stdin_as_arr
    next if !sitable?(members_count, first_seat)
    sit_down(members_count, first_seat)
  end
  count_used_seats
end

# 標準入力を受け取ってintにして返す．
def get_stdin_as_arr
  gets.chomp.split(" ").map(&:to_i)
end

# 造語 座ることができるか判定する
def sitable?(members_count, first_seat)
  check_seat_idxs = calculate_seat_index(members_count, first_seat)
  # return true when this false all
  check_seat_idxs.map do |idx|
    @seats[idx]
  end.all? { |e| !e }
end

def calculate_seat_index(number_of_members, first_seat)
  hoge = (0..number_of_members - 1).map do |num|
    seat_idx = first_seat - 1 + num
    seat_idx - @seats.length if seat_idx > @seats.length - 1
    seat_idx
  end
  hoge
end

def sit_down(members_count, first_seat)
  seat_to_sit_idxs = calculate_seat_index(members_count, first_seat)
  seat_to_sit_idxs.each { |idx| @seats[idx] = true }
end

def count_used_seats
  @seats.count(true)
end

puts main
