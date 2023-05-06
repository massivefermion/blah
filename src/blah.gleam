import gleam/io
import blah/image

pub fn main() {
  image.fashion(512, 512)
  |> io.println
}
