import blah/utils.{get_random_int}
import birl
import birl/duration

pub fn in_interval(from: birl.Time, to: birl.Time) -> birl.Time {
  let unix_from = birl.to_unix(from)
  let unix_to = birl.to_unix(to)

  get_random_int(unix_from, unix_to)
  |> birl.from_unix()
}

pub fn symmetric(distance: duration.Duration) {
  let now = birl.now()

  let unix_from =
    now
    |> birl.subtract(distance)
    |> birl.to_unix

  let unix_to =
    now
    |> birl.add(distance)
    |> birl.to_unix

  get_random_int(unix_from, unix_to)
  |> birl.from_unix()
}

pub fn past(
  min_distance: duration.Duration,
  max_distance: duration.Duration,
) -> birl.Time {
  let now = birl.now()

  let unix_from =
    now
    |> birl.subtract(max_distance)
    |> birl.to_unix

  let unix_to =
    now
    |> birl.subtract(min_distance)
    |> birl.to_unix

  get_random_int(unix_from, unix_to)
  |> birl.from_unix()
}

pub fn future(
  min_distance: duration.Duration,
  max_distance: duration.Duration,
) -> birl.Time {
  let now = birl.now()

  let unix_from =
    now
    |> birl.add(min_distance)
    |> birl.to_unix

  let unix_to =
    now
    |> birl.add(max_distance)
    |> birl.to_unix

  get_random_int(unix_from, unix_to)
  |> birl.from_unix()
}
