import gleam/int
import birl/time
import birl/duration

pub fn in_interval(from: time.Time, to: time.Time) -> time.Time {
  let unix_from = time.to_unix(from)
  let unix_to = time.to_unix(to)

  int.random(unix_from, unix_to)
  |> time.from_unix()
}

pub fn symmetric(distance: duration.Duration) {
  let now = time.now()

  let unix_from =
    now
    |> time.subtract(distance)
    |> time.to_unix
  let unix_to =
    now
    |> time.add(distance)
    |> time.to_unix

  int.random(unix_from, unix_to)
  |> time.from_unix()
}

pub fn past(
  min_distance: duration.Duration,
  max_distance: duration.Duration,
) -> time.Time {
  let now = time.now()

  let unix_from =
    now
    |> time.subtract(max_distance)
    |> time.to_unix
  let unix_to =
    now
    |> time.subtract(min_distance)
    |> time.to_unix

  int.random(unix_from, unix_to)
  |> time.from_unix()
}

pub fn future(
  min_distance: duration.Duration,
  max_distance: duration.Duration,
) -> time.Time {
  let now = time.now()

  let unix_from =
    now
    |> time.add(min_distance)
    |> time.to_unix
  let unix_to =
    now
    |> time.add(max_distance)
    |> time.to_unix

  int.random(unix_from, unix_to)
  |> time.from_unix()
}
